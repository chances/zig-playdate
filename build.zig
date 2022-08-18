const std = @import("std");
const mem = std.mem;
const builtin = @import("builtin");
const string = []const u8;
const Builder = std.build.Builder;
const CrossTarget = std.zig.CrossTarget;
const Target = std.Target;
const arm = std.Target.arm;

pub fn build(b: *Builder) !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const mode = b.standardReleaseOptions();

    // Get path to the Playdate SDK
    const sdkPath = getPlaydateSdkPath(allocator);
    if (sdkPath == null) std.debug.print("Could not find path to Playdate SDK! Define PLAYDATE_SDK_PATH in your environment.\n\tSee https://sdk.play.date/1.12.3/Inside%20Playdate%20with%20C.html#_set_playdate_sdk_path_environment_variable", .{});

    const device = b.addObject("pdex", "src/main.zig");
    device.setTarget(.{
        .cpu_arch = .arm,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_features_add = arm.cpu.cortex_m7.features,
    });
    device.addIncludeDir(std.fs.path.join(allocator, &[_]string{
        sdkPath.?, "C_API",
    }) catch unreachable);
    const linkerScriptPath = std.fs.path.join(allocator, &[_]string{
        sdkPath.?, "C_API", "buildsupport", "link_map.ld",
    }) catch unreachable;
    device.setLinkerScriptPath(.{ .path = linkerScriptPath });
    device.linkLibC();
    device.setBuildMode(mode);
    _ = device.installRaw("pdex.elf", .{
        .format = .bin,
        .dest_dir = .{ .custom = "" },
    });
    std.debug.print("{s}", .{device.out_filename});
    b.step("device", "Build application for the Playdate").dependOn(&device.step);

    const simulator = b.addSharedLibrary("pdex", "src/main.zig", .unversioned);
    simulator.addIncludeDir(std.fs.path.join(allocator, &[_]string{
        sdkPath.?, "C_API",
    }) catch unreachable);
    simulator.defineCMacro("TARGET_SIMULATOR", null);
    simulator.defineCMacro("TARGET_EXTENSION", null);
    simulator.setBuildMode(mode);
    simulator.install();
    b.step("simulator", "Build application for the Playdate Simulator").dependOn(&simulator.step);
}

fn getPlaydateSdkPath(allocator: mem.Allocator) ?string {
    const ChildProcess = std.ChildProcess;
    const maxInt = std.math.maxInt;

    return std.process.getEnvVarOwned(allocator, "PLAYDATE_SDK_PATH") catch |err| switch (err) {
        error.EnvironmentVariableNotFound => {
            if (builtin.os.tag == .windows) return null;
            const args = [_]string{ "sh", "-c", "\"egrep '^\\s*SDKRoot' ~/.Playdate/config | head -n 1 | cut -c9-\"" };
            const proc = ChildProcess.init(args.items, allocator) catch unreachable;
            const status = proc.spawnAndWait() catch return null;
            std.debug.assert(status == .{ .Exited = 0 });
            if (proc.stdout) |stdout| {
                return stdout.readToEndAlloc(allocator, maxInt(u64)) catch return null;
            } else return null;
        },
        else => return null,
    };
}

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
    const lib = b.addStaticLibrary("pdex", "src/main.zig");

    // Get path to the Playdate SDK
    const sdkPath = getPlaydateSdkPath(allocator);
    if (sdkPath == null) std.debug.print("Could not find path to Playdate SDK! Define PLAYDATE_SDK_PATH in your environment.", .{});

    lib.setTarget(.{
        .cpu_arch = .arm,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_features_add = arm.cpu.cortex_m7.features,
    });
    const linkerScriptPath = std.fs.path.join(allocator, &[_]string{
        sdkPath.?, "C_API", "buildsupport", "link_map.ld",
    }) catch unreachable;
    lib.setLinkerScriptPath(.{ .path = linkerScriptPath });
    lib.linkLibC();
    lib.setBuildMode(mode);
    lib.install();
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

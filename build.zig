const builtin = @import("builtin");
const Builder = @import("std").build.Builder;
const CrossTarget = @import("std").zig.CrossTarget;
const arm = @import("std").Target.arm;

pub fn build(b: *Builder) !void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("pdex", "src/main.zig");

    lib.setTarget(.{
        .cpu_arch = .arm,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_features_add = arm.cpu.cortex_m7.features,
    });
    lib.setLinkerScriptPath(.{ .path = getPlaydateSdkPath() + "/C_API/buildsupport/link_map.ld" });
    lib.linkLibC();
    lib.setBuildMode(mode);
    lib.install();
}

fn getPlaydateSdkPath() []const u8 {
    const os = @import("std").os;
    return try os.getenv("PLAYDATE_SDK_PATH");
}

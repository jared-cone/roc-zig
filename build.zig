const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "roc-host",
        .root_source_file = .{ .path = "platform/host.zig" },
        .target = target,
        .optimize = mode,
        .link_libc = true,
    });

    lib.force_pic = true;
    lib.disable_stack_probing = true;

    b.installArtifact(lib);
}

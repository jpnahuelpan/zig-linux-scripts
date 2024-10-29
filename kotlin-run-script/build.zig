const std = @import("std");

pub fn build(b: *std.Build) void {
    // Compile to binary
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const re = b.addStaticLibrary(.{
        .name = "remove_extension",
        .root_source_file = b.path("src/lib/remove_extension.zig"),
        .target = target,
        .optimize = optimize,
    });

    const ec = b.addStaticLibrary(.{
        .name = "execute_command",
        .root_source_file = b.path("src/lib/execute_command.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "runkt",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.linkLibrary(re);
    exe.linkLibrary(ec);

    b.installArtifact(exe);

    // testing modules.
    const test_step = b.step("test", "Run unit tests");
    const unit_tests = b.addTest(.{
        .root_source_file = b.path("src/test.zig"),
        .target = target,
    });

    unit_tests.linkLibrary(re);
    unit_tests.linkLibrary(ec);
    const run_unit_tests = b.addRunArtifact(unit_tests);
    test_step.dependOn(&run_unit_tests.step);
}

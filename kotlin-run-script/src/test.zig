const std = @import("std");
const lib = @import("lib/main.zig");
// const re = @import("lib/RemoveExtension.zig");
// const ec = @import("lib/ExecuteCommand.zig");
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;
const expectError = std.testing.expectError;
const expectEqualStrings = std.testing.expectEqualStrings;
const checkAllAllocationFailures = std.testing.checkAllAllocationFailures;

test "remove_extension test" {
    try expectEqualStrings("python", lib.removeExtension("python.py"));
    try expectEqualStrings("doc", lib.removeExtension("doc.docx"));
    try expectEqualStrings("point.po.in", lib.removeExtension("point.po.in.t"));
    try expectEqualStrings("go", lib.removeExtension("go.go"));
}

test "test execute command" {
    // const allocator = std.testing.allocator;
    try expectError(error.FileNotFound, lib.executeCommand(&.{"unvalid command"}));
    // try checkAllAllocationFailures(allocator, ec.executeCommand, &.{"ls"});
    // try expect(ec.execute_command(&.{ "echo", "This test it's ok!" }));
}

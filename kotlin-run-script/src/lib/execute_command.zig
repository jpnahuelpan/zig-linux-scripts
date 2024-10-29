const std = @import("std");

pub fn executeCommand(args: []const []const u8) !void {
    const allocator = std.heap.page_allocator;
    const command = args[0];

    var process = std.process.Child.init(args, allocator);
    try process.spawn();

    _ = process.wait() catch |err| {
        std.debug.print("Error in the execution of process \"{s}\": {}\n", .{ command, err });
        return err;
    };
    // std.debug.print("Process \"{s}\" has completed with the following message: {}\n", .{ command, exit_code });
}

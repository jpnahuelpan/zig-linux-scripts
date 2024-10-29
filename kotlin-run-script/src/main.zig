const std = @import("std");
const lib = @import("lib/main.zig");

pub fn main() !void {
    var args = std.process.args();
    const have_other = args.skip();
    if (have_other) {
        const allocator = std.heap.page_allocator;
        const kt_file: []const u8 = args.next() orelse "";
        const file_name: []const u8 = lib.removeExtension(kt_file); // whithout extention
        const jar_file: []const u8 = try std.fmt.allocPrint(allocator, "{0s}.jar", .{file_name});
        const compile = &.{ "kotlinc", kt_file, "-include-runtime", "-d", jar_file };
        const run = &.{ "kotlin", jar_file };
        const delete_runable = &.{ "rm", jar_file };
        try lib.executeCommand(compile);
        try lib.executeCommand(run);
        try lib.executeCommand(delete_runable);

        allocator.free(jar_file);
    }
}

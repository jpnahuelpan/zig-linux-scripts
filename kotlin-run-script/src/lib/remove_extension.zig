const std = @import("std");

pub fn removeExtension(filename: []const u8) []const u8 {
    const lastDot = std.mem.lastIndexOfLinear(u8, filename, ".");
    if (lastDot == null) {
        return filename;
    }
    return filename[0..lastDot.?];
}

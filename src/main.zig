const std = @import("std");
const gtk = @cImport({
    @cInclude("ziggtk.c");
});

pub fn main() !void {
    _ = gtk.run();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

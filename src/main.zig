const std = @import("std");

pub fn main() void {
    const maybe: ?i32 = 10;
    const maybes: ?i32 = null;

    if (maybe and maybes) |x| {
        std.debug.print("The value is :{}", .{x});
    } else {
        std.debug.print("No value yet", .{});
    }
}

const std = @import("std");

pub fn main() void {
    const a: i32 = 4;
    const b: i32 = 5;

    if (a != b) {
        std.debug.print("Naah, they aren't equal", .{});
    } else if (a == 9) {
        std.debug.print("Look at that they are equal", .{});
    } else {
        std.debug.print("Nasty comparision", .{});
    }
}

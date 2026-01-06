const std = @import("std");

pub fn main() void {
    const items = [_]i32{ 1, 2, 3, 5, 6 };
    const more = [_]i32{ 9, 8, 7, 6, 5 };
    var sum: i32 = 0;

    for (items, more) |i, j| {
        sum += i + j;
    }

    std.debug.print("The sum is: {}\n", .{sum});
}

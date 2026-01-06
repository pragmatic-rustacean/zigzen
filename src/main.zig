const std = @import("std");

pub fn main() void {
    const items = [_]i32{ 1, 2, 3, 5, 6 };
    var sum: i32 = 0;

    for (items, 0..) |_, index| {
        sum += @intCast(index);
    }

    std.debug.print("The sum is: {}\n", .{sum});
}

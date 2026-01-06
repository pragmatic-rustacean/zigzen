const std = @import("std");

pub fn main() void {
    const items = [_]i32{ 1, 2, 3, 4, 5, 6 };

    var sum: i32 = 0;

    var stopped_at_index: i32 = 0;

    const stoped_early = for (0.., items) |index, item| {
        if (@mod(item, 2) == 0) {
            stopped_at_index = @intCast(index);
            break true;
        }
        sum += 1;
    } else false;

    std.debug.print("Sum of items: {}\n", .{sum});

    if (stoped_early) {
        std.debug.print("Stopped at index: {}\n", .{stopped_at_index});
    }
}

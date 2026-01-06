const std = @import("std");

pub fn main() void {
    const today = 6;
    switch (today) {
        1 => {
            std.debug.print("Today is a new year", .{});
        },
        2 => {
            std.debug.print("Today is after new year", .{});
        },
        3 => {
            std.debug.print("Now the year is old", .{});
        },
        4 => {
            std.debug.print("Today is a week after new year", .{});
        },
        5 => {
            std.debug.print("Now today is on a monday", .{});
        },
        6 => {
            std.debug.print("Today is on a Tuesday and I didn't go to school", .{});
        },
        else => {
            std.debug.print("Naah, not what you are looking for", .{});
        },
    }
}

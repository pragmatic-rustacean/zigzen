const std = @import("std");

pub fn main() void {
    light: switch (@as(u8, 1)) {
        1 => {
            std.debug.print("Light is red, cars stops\n", .{});
            continue :light 2;
        },
        2 => {
            std.debug.print("Light is yellow, cars get ready\n", .{});
            continue :light 3;
        },
        3 => {
            std.debug.print("Light is green, cars go\n", .{});
            continue :light 4;
        },
        4 => {
            std.debug.print("Pedestrian crossing activated, cars stop\n", .{});
            return;
        },
        else => {
            std.debug.print("Naah dude, let's meet at the traffic dept\n", .{});
        },
    }
}

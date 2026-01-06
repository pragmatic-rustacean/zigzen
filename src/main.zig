const std = @import("std");

pub fn main() void {
    const age = 22;
    if (age < 18) {
        std.debug.print("You are an underage yooh. Wait until you get to 18", .{});
    } else {
        std.debug.print("Welcome to the party, big dog.", .{});
    }
}

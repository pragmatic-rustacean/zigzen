const std = @import("std");

pub fn main() void {
    const age = 22;
    if (age < 18) {
        std.debug.print("Yooh, you baby. Wait and grow up.", .{});
    } else if (age < 20 and age >= 18) {
        std.debug.print("You can enter but, head to the kids section", .{});
    } else {
        std.debug.print("Welcome big dog. This place deserves you", .{});
    }
}

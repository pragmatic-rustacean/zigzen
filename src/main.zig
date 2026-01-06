const std = @import("std");

pub fn main() void {
    const a: i32 = 4;
    const b: i32 = 5;

    const result = if (a < b) 19 else 10;

    std.debug.print("My name is: {} \n", .{result});
}

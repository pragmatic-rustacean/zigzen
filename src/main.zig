const std = @import("std");

const day = enum {
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
};

const http = enum(i32) {
    Ok = 200,
    NotFound = 404,
    InternalServerError = 500,
    BadRequest = 400,
};

const trafic_light = enum {
    Red,
    Green,
    Yellow,

    pub fn is_red(self: trafic_light) bool {
        return self == .Red;
    }
};

pub fn main() void {
    const today = day.wednesday;
    const day_number = @intFromEnum(today);
    const status_code = http.Ok;
    const code = @intFromEnum(status_code);
    std.debug.print("Status code: {}\n", .{code});

    if (today == .wednesday) {
        std.debug.print("Today is hump day. day number {}!\n", .{day_number + 1});
    }
}

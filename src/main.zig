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

const ErrorCode = enum(i32) { Success = 200, Failure = 400, _ };

pub fn handle_error(code: ErrorCode) void {
    switch (code) {
        .Success => {
            std.debug.print("Success brother...", .{});
        },
        .Failure => {
            std.debug.print("Failure my brother...", .{});
        },
        _ => unreachable,
    }
}

const Data = union {
    floatValue: f32,
    intValue: i32,
    stringValue: []const u8,
};

pub fn main() void {
    var res = Data{ .stringValue = "James Muriuki Maina" };
    std.debug.print("String value: {s}\n", .{res.stringValue});

    res = Data{ .floatValue = 22.5 };
    std.debug.print("Float value: {}\n", .{res.floatValue});

    res = Data{ .intValue = 22 };
    std.debug.print("Int value: {}\n", .{res.intValue});

    const err: ErrorCode = .Failure;
    handle_error(err);
}

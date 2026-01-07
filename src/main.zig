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
    }
}

pub fn main() void {
    const err: ErrorCode = .Failure;
    handle_error(err);
}

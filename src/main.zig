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

const Result = union(enum) {
    Success: i32,
    Error: []const u8,
};

pub fn calculate_results(input: i32) Result {
    if (input > 3) {
        return Result{ .Success = input };
    } else {
        return Result{ .Error = "Naah brah" };
    }
}

const NetworkError = error{
    ConnectionLost,
    Timeout,
    InvalidResponse,
};

fn fetch_data(url: []const u8) ![]const u8 {
    if (url.len == 0) {
        return error.ConnectionLost;
    }
    return "Woooh!!!, That's aw3some";
}

const ParseError = error{
    InvalidFormat,
    Overflow,
};

pub fn parse_float(input: []const u8) ParseError!f64 {
    const result = std.fmt.parseFloat(f64, input) catch |err| {
        return switch (err) {
            // std.fmt.ParseFloatError.
        };
    };
    std.debug.print("{}", .{result});
}

pub fn main() !void {
    var array = [_]u8{ 1, 2, 3, 4, 5, 6 };
    const item = 0;
    _ = &item;

    const slice = array[item .. array.len - 1];
    std.debug.print("I am a slice: {s}", .{slice});

    const Structor = struct {
        name: []const u8,
        age: u16,
        sex: []const u8,
    };

    const res: Structor = .{ .age = 22, .name = "James", .sex = "male" };
    std.debug.print("This is my info: {}", .{res});
}

test "James is a dick, I don't know why He keep on getting rejected by ugly and unattractive girls" {
    try std.testing.expect(true);
}

test "managing players health using pointers" {
    const james_health: i32 = 10;
    const james_health_ptr = &james_health;
    try std.testing.expect(james_health_ptr.* == 10);
    try std.testing.expect(@TypeOf(james_health_ptr) == *const i32);

    var player_health: i32 = 100;
    const player_health_ptr = &player_health;
    try std.testing.expect(player_health_ptr.* == 100);
    try std.testing.expect(@TypeOf(player_health_ptr) == *i32);

    player_health_ptr.* -= 10;
    try std.testing.expect(player_health_ptr.* == 90);
    try std.testing.expect(player_health == 90);
}

test "Slicing syntax on pointers" {
    var age: i32 = 22;
    const age_ptr = &age;
    const age_array_ptr = age_ptr[0..1];
    const age_many_ptr: [*]i32 = age_array_ptr;

    try std.testing.expect(@TypeOf(age_many_ptr) == [*]i32);
    try std.testing.expect(age_many_ptr[0] == 22);
}

test "pointer arithmetics" {
    const students = [_]u8{ "James", "Mercy", "Joy", "Tony" };
    var names: [*]const u8 = &students;
    try std.testing.expectEqualStrings(names[0], "James");
    names += 1;
    try std.testing.expectEqualStrings(names[0], "Mercy");
}

pub fn enchanted_forest(allocator: std.mem.Allocator) std.mem.Allocator.Error![]u8 {
    var chants: [5]u8 = .{ 'S', 'l', 'a', 's', 'h' };
    const chants_copy = try allocator.alloc(std.mem.Allocator, u8, chants.len);
    @memcpy(chants_copy, &chants);
    return chants_copy;
}

const Sword = struct {
    stats: []u8,
    pub fn init(allocator: std.mem.Allocator, stats: []const u8) !*Sword {
        const sword_ptr = try allocator.create(Sword);
        errdefer allocator.destroy(sword_ptr);
        sword_ptr.stats = try allocator.alloc(u8, stats.len);
        @memcpy(sword_ptr, stats);
        return sword_ptr;
    }

    pub fn deinit(self: *Sword, allocator: std.mem.Allocator) void {
        // Free the memory for the stats.
        allocator.free(self.stats);
        // Destroy the struct itself
        allocator.destroy(self);
    }
};

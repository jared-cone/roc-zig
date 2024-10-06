const RocResultTag = enum(u8) {
    RocErr = 0,
    RocOk = 1,
};

fn RocResultPayload(comptime T: type, comptime E: type) type {
    return extern union {
        ok: T,
        err: E,
    };
}

pub fn RocResult(comptime T: type, comptime E: type) type {
    return extern struct {
        payload: RocResultPayload(T, E),
        tag: RocResultTag,

        pub fn ok(value: T) @This() {
            return .{ .payload = .{ .ok = value }, .tag = .RocOk };
        }

        pub fn err(value: E) @This() {
            return .{ .payload = .{ .err = value }, .tag = .RocErr };
        }
    };
}

const std = @import("std");
const RocResult = @import("roc_std/roc_result.zig").RocResult;

const RocResultVoidVoid = RocResult(void, void);

export fn roc_fx_doNothing() callconv(.C) RocResultVoidVoid {
    return RocResultVoidVoid.ok({});
}

const RocResultI32Void = RocResult(i32, void);

export fn roc_fx_returnI32(num: i32) callconv(.C) RocResultI32Void {
    return RocResultI32Void.ok(num);
}

export fn roc_fx_printNum(num: i32) callconv(.C) RocResultVoidVoid {
    _ = std.io.getStdOut().writer().print("Number={}\n", .{num}) catch void;
    return RocResultVoidVoid.ok({});
}

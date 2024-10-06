const std = @import("std");
const RocResult = @import("roc_std/roc_result.zig").RocResult;

const RocResultI32Void = RocResult(i32, void);

export fn roc_fx_test() callconv(.C) RocResultI32Void {
    return RocResultI32Void.ok(500);
}

const std = @import("std");
const util = @import("util.zig");
const RocResult = @import("roc_std/roc_result.zig").RocResult;
const RocStr = @import("roc_std/roc_str.zig").RocStr;

const RocResultVoidVoid = RocResult(void, void);

export fn roc_fx_stdoutLine(_: *RocStr) callconv(.C) RocResultVoidVoid {
    //_ = std.io.getStdOut().writer().print("{s}\n", .{util.str_to_c(text)}) catch void;
    _ = std.io.getStdOut().writer().print("Hello\n", .{}) catch void;
    return RocResultVoidVoid.ok({});
}

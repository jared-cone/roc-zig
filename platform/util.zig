const RocStr = @import("roc_std/roc_str.zig").RocStr;

// TODO this is terrible, but works for now
var memory: [1000]u8 = undefined;

pub fn str_to_c(roc_str: *RocStr) [*:0]const u8 {
    const slice = roc_str.asSlice();

    var buffer: []u8 = &memory;

    if (slice.len > 1000) {
        @panic("unsupported, the platform only handles RocStr that are less than 1000 bytes for now");
    }

    @memcpy(buffer[0..slice.len], slice);

    buffer[slice.len] = 0;

    return @ptrCast(&memory);
}

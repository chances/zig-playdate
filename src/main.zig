const pd = @import("playdate.zig");
const std = @import("std");
const testing = std.testing;

export fn eventHandler(playdate: [*c]pd.api.PlaydateAPI, event: pd.system.Event, _: u32) u32 {
    switch (event) {
        .init => playdate.system.setUpdateCallback(&update, null),
        else => {},
    }
}

export fn update(userData: ?*anyopaque) u32 {
    std.debug.assert(userData == null);
    return 0;
}

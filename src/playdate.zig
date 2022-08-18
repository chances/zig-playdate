pub const api = @import("pd.zig");

pub const system = struct {
    /// See https://sdk.play.date/1.12.3/Inside%20Playdate%20with%20C.html#_eventHandler
    pub const Event = enum(c_int) {
        init = api.kEventInit,
        initLua = api.kEventInitLua,
        lock = api.kEventLock,
        unlock = api.kEventUnlock,
        pause = api.kEventPause,
        resume_ = api.kEventResume,
        terminate = api.kEventTerminate,
        keyPressed = api.kEventKeyPressed,
        keyReleased = api.kEventKeyReleased,
        lowPower = api.kEventLowPower,
    };
};

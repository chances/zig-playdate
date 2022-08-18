// Generated with `zig translate-c -lc -DTARGET_EXTENSION ~/Projects/Scratch/PlaydateSDK/C_API/pd_api.h > src/pd.zig`
// Then pruned of fluff by hand

const std = @import("std");

pub const LCDRect = extern struct {
    left: c_int,
    right: c_int,
    top: c_int,
    bottom: c_int,
};
pub fn LCDMakeRect(arg_x: c_int, arg_y: c_int, arg_width: c_int, arg_height: c_int) callconv(.C) LCDRect {
    var x = arg_x;
    var y = arg_y;
    var width = arg_width;
    var height = arg_height;
    var r: LCDRect = LCDRect{
        .left = x,
        .right = x + width,
        .top = y,
        .bottom = y + height,
    };
    return r;
}
pub fn LCDRect_translate(arg_r: LCDRect, arg_dx: c_int, arg_dy: c_int) callconv(.C) LCDRect {
    var r = arg_r;
    var dx = arg_dx;
    var dy = arg_dy;
    return LCDRect{
        .left = r.left + dx,
        .right = r.right + dx,
        .top = r.top + dy,
        .bottom = r.bottom + dy,
    };
}
pub const kDrawModeCopy: c_int = 0;
pub const kDrawModeWhiteTransparent: c_int = 1;
pub const kDrawModeBlackTransparent: c_int = 2;
pub const kDrawModeFillWhite: c_int = 3;
pub const kDrawModeFillBlack: c_int = 4;
pub const kDrawModeXOR: c_int = 5;
pub const kDrawModeNXOR: c_int = 6;
pub const kDrawModeInverted: c_int = 7;
pub const LCDBitmapDrawMode = c_uint;
pub const kBitmapUnflipped: c_int = 0;
pub const kBitmapFlippedX: c_int = 1;
pub const kBitmapFlippedY: c_int = 2;
pub const kBitmapFlippedXY: c_int = 3;
pub const LCDBitmapFlip = c_uint;
pub const kColorBlack: c_int = 0;
pub const kColorWhite: c_int = 1;
pub const kColorClear: c_int = 2;
pub const kColorXOR: c_int = 3;
pub const LCDSolidColor = c_uint;
pub const kLineCapStyleButt: c_int = 0;
pub const kLineCapStyleSquare: c_int = 1;
pub const kLineCapStyleRound: c_int = 2;
pub const LCDLineCapStyle = c_uint;
pub const kLCDFontLanguageEnglish: c_int = 0;
pub const kLCDFontLanguageJapanese: c_int = 1;
pub const kLCDFontLanguageUnknown: c_int = 2;
pub const LCDFontLanguage = c_uint;
pub const kASCIIEncoding: c_int = 0;
pub const kUTF8Encoding: c_int = 1;
pub const k16BitLEEncoding: c_int = 2;
pub const PDStringEncoding = c_uint;
pub const LCDColor = usize;
pub const kPolygonFillNonZero: c_int = 0;
pub const kPolygonFillEvenOdd: c_int = 1;
pub const LCDPolygonFillRule = c_uint;
pub const LCDBitmap = opaque {};
pub const LCDBitmapTable = opaque {};
pub const LCDFont = opaque {};
pub const LCDFontData = opaque {};
pub const LCDFontPage = opaque {};
pub const LCDFontGlyph = opaque {};
pub const LCDVideoPlayer = opaque {};
pub const playdate_video = extern struct {
    loadVideo: fn ([*c]const u8) callconv(.C) ?*LCDVideoPlayer,
    freePlayer: fn (?*LCDVideoPlayer) callconv(.C) void,
    setContext: fn (?*LCDVideoPlayer, ?*LCDBitmap) callconv(.C) c_int,
    useScreenContext: fn (?*LCDVideoPlayer) callconv(.C) void,
    renderFrame: fn (?*LCDVideoPlayer, c_int) callconv(.C) c_int,
    getError: fn (?*LCDVideoPlayer) callconv(.C) [*c]const u8,
    getInfo: fn (?*LCDVideoPlayer, [*c]c_int, [*c]c_int, [*c]f32, [*c]c_int, [*c]c_int) callconv(.C) void,
    getContext: fn (?*LCDVideoPlayer) callconv(.C) ?*LCDBitmap,
};
pub const playdate_graphics = extern struct {
    video: [*c]const playdate_video,
    setStencil: fn (?*LCDBitmap) callconv(.C) void,
    setDrawOffset: fn (c_int, c_int) callconv(.C) void,
    setClipRect: fn (c_int, c_int, c_int, c_int) callconv(.C) void,
    clearClipRect: fn () callconv(.C) void,
    setFont: fn (?*LCDFont) callconv(.C) void,
    setTextTracking: fn (c_int) callconv(.C) void,
    pushContext: fn (?*LCDBitmap) callconv(.C) void,
    popContext: fn () callconv(.C) void,
    drawScaledBitmap: fn (?*LCDBitmap, c_int, c_int, f32, f32) callconv(.C) void,
    freeBitmap: fn (?*LCDBitmap) callconv(.C) void,
    loadBitmap: fn ([*c]const u8, [*c][*c]const u8) callconv(.C) ?*LCDBitmap,
    copyBitmap: fn (?*LCDBitmap) callconv(.C) ?*LCDBitmap,
    loadIntoBitmap: fn ([*c]const u8, ?*LCDBitmap, [*c][*c]const u8) callconv(.C) void,
    getBitmapData: fn (?*LCDBitmap, [*c]c_int, [*c]c_int, [*c]c_int, [*c][*c]u8, [*c][*c]u8) callconv(.C) void,
    rotatedBitmap: fn (?*LCDBitmap, f32, f32, f32, [*c]c_int) callconv(.C) ?*LCDBitmap,
    newBitmapTable: fn (c_int, c_int, c_int) callconv(.C) ?*LCDBitmapTable,
    freeBitmapTable: fn (?*LCDBitmapTable) callconv(.C) void,
    loadBitmapTable: fn ([*c]const u8, [*c][*c]const u8) callconv(.C) ?*LCDBitmapTable,
    loadIntoBitmapTable: fn ([*c]const u8, ?*LCDBitmapTable, [*c][*c]const u8) callconv(.C) void,
    getTableBitmap: fn (?*LCDBitmapTable, c_int) callconv(.C) ?*LCDBitmap,
    loadFont: fn ([*c]const u8, [*c][*c]const u8) callconv(.C) ?*LCDFont,
    getFontPage: fn (?*LCDFont, u32) callconv(.C) ?*LCDFontPage,
    getPageGlyph: fn (?*LCDFontPage, u32, [*c]?*LCDBitmap, [*c]c_int) callconv(.C) ?*LCDFontGlyph,
    getGlyphKerning: fn (?*LCDFontGlyph, u32, u32) callconv(.C) c_int,
    getFrame: fn () callconv(.C) [*c]u8,
    getDisplayFrame: fn () callconv(.C) [*c]u8,
    getDebugBitmap: fn () callconv(.C) ?*LCDBitmap,
    copyFrameBufferBitmap: fn () callconv(.C) ?*LCDBitmap,
    markUpdatedRows: fn (c_int, c_int) callconv(.C) void,
    display: fn () callconv(.C) void,
    setScreenClipRect: fn (c_int, c_int, c_int, c_int) callconv(.C) void,
    getFontHeight: fn (?*LCDFont) callconv(.C) u8,
    getDisplayBufferBitmap: fn () callconv(.C) ?*LCDBitmap,
    drawRotatedBitmap: fn (?*LCDBitmap, c_int, c_int, f32, f32, f32, f32, f32) callconv(.C) void,
    setTextLeading: fn (c_int) callconv(.C) void,
    setBitmapMask: fn (?*LCDBitmap, ?*LCDBitmap) callconv(.C) c_int,
    getBitmapMask: fn (?*LCDBitmap) callconv(.C) ?*LCDBitmap,
    setStencilImage: fn (?*LCDBitmap, c_int) callconv(.C) void,
    makeFontFromData: fn (?*LCDFontData, c_int) callconv(.C) ?*LCDFont,
};
pub const kButtonLeft: c_int = 1;
pub const kButtonRight: c_int = 2;
pub const kButtonUp: c_int = 4;
pub const kButtonDown: c_int = 8;
pub const kButtonB: c_int = 16;
pub const kButtonA: c_int = 32;
pub const PDButtons = c_uint;
pub const kPDLanguageEnglish: c_int = 0;
pub const kPDLanguageJapanese: c_int = 1;
pub const kPDLanguageUnknown: c_int = 2;
pub const PDLanguage = c_uint;
pub const PDMenuItem = opaque {};
pub const kNone: c_int = 0;
pub const kAccelerometer: c_int = 1;
pub const kAllPeripherals: c_int = 65535;
pub const PDPeripherals = c_uint;
pub const PDCallbackFunction = fn (?*anyopaque) callconv(.C) c_int;
pub const PDMenuItemCallbackFunction = fn (?*anyopaque) callconv(.C) void;
pub const playdate_sys = extern struct {
    realloc: fn (?*anyopaque, usize) callconv(.C) ?*anyopaque,
    formatString: fn ([*c][*c]u8, [*c]const u8, ...) callconv(.C) c_int,
    logToConsole: fn ([*c]const u8, ...) callconv(.C) void,
    @"error": fn ([*c]const u8, ...) callconv(.C) void,
    getCurrentTimeMilliseconds: fn () callconv(.C) c_uint,
    getSecondsSinceEpoch: fn ([*c]c_uint) callconv(.C) c_uint,
    drawFPS: fn (c_int, c_int) callconv(.C) void,
    setUpdateCallback: fn (?PDCallbackFunction, ?*anyopaque) callconv(.C) void,
    setPeripheralsEnabled: fn (PDPeripherals) callconv(.C) void,
    getAccelerometer: fn ([*c]f32, [*c]f32, [*c]f32) callconv(.C) void,
    getCrankChange: fn () callconv(.C) f32,
    getCrankAngle: fn () callconv(.C) f32,
    isCrankDocked: fn () callconv(.C) c_int,
    setCrankSoundsDisabled: fn (c_int) callconv(.C) c_int,
    getFlipped: fn () callconv(.C) c_int,
    setAutoLockDisabled: fn (c_int) callconv(.C) void,
    setMenuImage: fn (?*LCDBitmap, c_int) callconv(.C) void,
    addMenuItem: fn ([*c]const u8, ?PDMenuItemCallbackFunction, ?*anyopaque) callconv(.C) ?*PDMenuItem,
    addCheckmarkMenuItem: fn ([*c]const u8, c_int, ?PDMenuItemCallbackFunction, ?*anyopaque) callconv(.C) ?*PDMenuItem,
    addOptionsMenuItem: fn ([*c]const u8, [*c][*c]const u8, c_int, ?PDMenuItemCallbackFunction, ?*anyopaque) callconv(.C) ?*PDMenuItem,
    removeAllMenuItems: fn () callconv(.C) void,
    removeMenuItem: fn (?*PDMenuItem) callconv(.C) void,
    getMenuItemValue: fn (?*PDMenuItem) callconv(.C) c_int,
    setMenuItemValue: fn (?*PDMenuItem, c_int) callconv(.C) void,
    getMenuItemTitle: fn (?*PDMenuItem) callconv(.C) [*c]const u8,
    setMenuItemTitle: fn (?*PDMenuItem, [*c]const u8) callconv(.C) void,
    getMenuItemUserdata: fn (?*PDMenuItem) callconv(.C) ?*anyopaque,
    setMenuItemUserdata: fn (?*PDMenuItem, ?*anyopaque) callconv(.C) void,
    getReduceFlashing: fn () callconv(.C) c_int,
    getElapsedTime: fn () callconv(.C) f32,
    resetElapsedTime: fn () callconv(.C) void,
    getBatteryPercentage: fn () callconv(.C) f32,
    getBatteryVoltage: fn () callconv(.C) f32,
};

pub const kJSONNull: c_int = 0;
pub const kJSONTrue: c_int = 1;
pub const kJSONFalse: c_int = 2;
pub const kJSONInteger: c_int = 3;
pub const kJSONFloat: c_int = 4;
pub const kJSONString: c_int = 5;
pub const kJSONArray: c_int = 6;
pub const kJSONTable: c_int = 7;
pub const json_value_type = c_uint;
const union_unnamed_2 = extern union {
    intval: c_int,
    floatval: f32,
    stringval: [*c]u8,
    arrayval: ?*anyopaque,
    tableval: ?*anyopaque,
};
pub const json_value = extern struct {
    type: u8,
    data: union_unnamed_2,
};
pub fn json_intValue(arg_value: json_value) callconv(.C) !c_int {
    var value = arg_value;
    while (true) {
        switch (@bitCast(c_int, @as(c_uint, value.type))) {
            @as(c_int, 3) => return value.data.intval,
            @as(c_int, 4) => return @floatToInt(c_int, value.data.floatval),
            @as(c_int, 5) => return try std.fmt.parseInt(c_int, value.data.stringval, @as(c_int, 10)),
            @as(c_int, 1) => return 1,
            else => return 0,
        }
        break;
    }
    return 0;
}
pub fn json_floatValue(arg_value: json_value) callconv(.C) f32 {
    var value = arg_value;
    while (true) {
        switch (@bitCast(c_int, @as(c_uint, value.type))) {
            @as(c_int, 3) => return @intToFloat(f32, value.data.intval),
            @as(c_int, 4) => return value.data.floatval,
            @as(c_int, 5) => return 0,
            @as(c_int, 1) => return @floatCast(f32, 1.0),
            else => return @floatCast(f32, 0.0),
        }
        break;
    }
    return 0;
}
pub fn json_boolValue(arg_value: json_value) callconv(.C) c_int {
    var value = arg_value;
    return if (@bitCast(c_int, @as(c_uint, value.type)) == kJSONString) @boolToInt(std.mem.eql([*c]u8, value.data.stringval, @as([*c]u8, "")) != true) else json_intValue(value);
}
pub fn json_stringValue(arg_value: json_value) callconv(.C) [*c]u8 {
    var value = arg_value;
    return if (@bitCast(c_int, @as(c_uint, value.type)) == kJSONString) value.data.stringval else null;
}
pub const json_decoder = extern struct {
    decodeError: fn ([*c]json_decoder, [*c]const u8, c_int) callconv(.C) void,
    willDecodeSublist: fn ([*c]json_decoder, [*c]const u8, json_value_type) callconv(.C) void,
    shouldDecodeTableValueForKey: fn ([*c]json_decoder, [*c]const u8) callconv(.C) c_int,
    didDecodeTableValue: fn ([*c]json_decoder, [*c]const u8, json_value) callconv(.C) void,
    shouldDecodeArrayValueAtIndex: fn ([*c]json_decoder, c_int) callconv(.C) c_int,
    didDecodeArrayValue: fn ([*c]json_decoder, c_int, json_value) callconv(.C) void,
    didDecodeSublist: fn ([*c]json_decoder, [*c]const u8, json_value_type) callconv(.C) ?*anyopaque,
    userdata: ?*anyopaque,
    returnString: c_int,
    path: [*c]const u8,
};
pub fn json_setTableDecode(arg_decoder: [*c]json_decoder, arg_willDecodeSublist: fn ([*c]json_decoder, [*c]const u8, json_value_type) callconv(.C) void, arg_didDecodeTableValue: fn ([*c]json_decoder, [*c]const u8, json_value) callconv(.C) void, arg_didDecodeSublist: fn ([*c]json_decoder, [*c]const u8, json_value_type) callconv(.C) ?*anyopaque) callconv(.C) void {
    var decoder = arg_decoder;
    var willDecodeSublist = arg_willDecodeSublist;
    var didDecodeTableValue = arg_didDecodeTableValue;
    var didDecodeSublist = arg_didDecodeSublist;
    decoder.*.didDecodeTableValue = didDecodeTableValue;
    decoder.*.didDecodeArrayValue = null;
    decoder.*.willDecodeSublist = willDecodeSublist;
    decoder.*.didDecodeSublist = didDecodeSublist;
}
pub fn json_setArrayDecode(arg_decoder: [*c]json_decoder, arg_willDecodeSublist: fn ([*c]json_decoder, [*c]const u8, json_value_type) callconv(.C) void, arg_didDecodeArrayValue: fn ([*c]json_decoder, c_int, json_value) callconv(.C) void, arg_didDecodeSublist: fn ([*c]json_decoder, [*c]const u8, json_value_type) callconv(.C) ?*anyopaque) callconv(.C) void {
    var decoder = arg_decoder;
    var willDecodeSublist = arg_willDecodeSublist;
    var didDecodeArrayValue = arg_didDecodeArrayValue;
    var didDecodeSublist = arg_didDecodeSublist;
    decoder.*.didDecodeTableValue = null;
    decoder.*.didDecodeArrayValue = didDecodeArrayValue;
    decoder.*.willDecodeSublist = willDecodeSublist;
    decoder.*.didDecodeSublist = didDecodeSublist;
}
pub const json_reader = extern struct {
    read: fn (?*anyopaque, [*c]u8, c_int) callconv(.C) c_int,
    userdata: ?*anyopaque,
};
pub const writeFunc = fn (?*anyopaque, [*c]const u8, c_int) callconv(.C) void; // C:/Users/Chance/Projects/Scratch/PlaydateSDK/C_API/pd_api/pd_api_json.h:133:6: warning: struct demoted to opaque type - has bitfield
pub const json_encoder = opaque {};
pub const playdate_json = extern struct {
    initEncoder: fn (encoder: ?*json_encoder, write: [*c]writeFunc, userdata: ?*anyopaque, pretty: c_int) callconv(.C) void,
    decode: fn (functions: [*c]json_decoder, reader: json_reader, outval: [*c]json_value) callconv(.C) c_int,
    decodeString: fn (functions: [*c]json_decoder, jsonString: [*c]const u8, outval: [*c]json_value) callconv(.C) c_int,
};
pub const SDFile = anyopaque;
pub const kFileRead: c_int = 1;
pub const kFileReadData: c_int = 2;
pub const kFileWrite: c_int = 4;
pub const kFileAppend: c_int = 8;
pub const FileOptions = c_uint;
pub const FileStat = extern struct {
    isdir: c_int,
    size: c_uint,
    m_year: c_int,
    m_month: c_int,
    m_day: c_int,
    m_hour: c_int,
    m_minute: c_int,
    m_second: c_int,
};
pub const playdate_file = extern struct {
    geterr: fn () callconv(.C) [*c]const u8,
    listfiles: fn ([*c]const u8, ?fn ([*c]const u8, ?*anyopaque) callconv(.C) void, ?*anyopaque, c_int) callconv(.C) c_int,
    mkdir: fn ([*c]const u8) callconv(.C) c_int,
    unlink: fn ([*c]const u8, c_int) callconv(.C) c_int,
    rename: fn ([*c]const u8, [*c]const u8) callconv(.C) c_int,
};
pub const kCollisionTypeSlide: c_int = 0;
pub const kCollisionTypeFreeze: c_int = 1;
pub const kCollisionTypeOverlap: c_int = 2;
pub const kCollisionTypeBounce: c_int = 3;
pub const SpriteCollisionResponseType = c_uint;
pub const PDRect = extern struct {
    x: f32,
    y: f32,
    width: f32,
    height: f32,
};
pub fn PDRectMake(arg_x: f32, arg_y: f32, arg_width: f32, arg_height: f32) callconv(.C) PDRect {
    var x = arg_x;
    var y = arg_y;
    var width = arg_width;
    var height = arg_height;
    return PDRect{
        .x = x,
        .y = y,
        .width = width,
        .height = height,
    };
}
pub const CollisionPoint = extern struct {
    x: f32,
    y: f32,
};
pub const CollisionVector = extern struct {
    x: c_int,
    y: c_int,
};
pub const SpriteCollisionInfo = extern struct {
    overlaps: u8,
    ti: f32,
    move: CollisionPoint,
    normal: CollisionVector,
    touch: CollisionPoint,
};
pub const SpriteQueryInfo = extern struct {
    ti1: f32,
    ti2: f32,
    entryPoint: CollisionPoint,
    exitPoint: CollisionPoint,
};
pub const LCDSprite = opaque {};
pub const CWCollisionInfo = opaque {};
pub const CWItemInfo = opaque {};
pub const LCDSpriteUpdateFunction = fn (?*LCDSprite) callconv(.C) void;
pub const playdate_sprite = extern struct {
    setAlwaysRedraw: fn (c_int) callconv(.C) void,
    addDirtyRect: fn (LCDRect) callconv(.C) void,
    drawSprites: fn () callconv(.C) void,
    updateAndDrawSprites: fn () callconv(.C) void,
    newSprite: fn () callconv(.C) ?*LCDSprite,
    freeSprite: fn (?*LCDSprite) callconv(.C) void,
    copy: fn (?*LCDSprite) callconv(.C) ?*LCDSprite,
    addSprite: fn (?*LCDSprite) callconv(.C) void,
    removeSprite: fn (?*LCDSprite) callconv(.C) void,
    removeSprites: fn ([*c]?*LCDSprite, c_int) callconv(.C) void,
    removeAllSprites: fn () callconv(.C) void,
    getSpriteCount: fn () callconv(.C) c_int,
    moveTo: fn (?*LCDSprite, f32, f32) callconv(.C) void,
    moveBy: fn (?*LCDSprite, f32, f32) callconv(.C) void,
    getImage: fn (?*LCDSprite) callconv(.C) ?*LCDBitmap,
    setSize: fn (?*LCDSprite, f32, f32) callconv(.C) void,
    setZIndex: fn (?*LCDSprite, i16) callconv(.C) void,
    getZIndex: fn (?*LCDSprite) callconv(.C) i16,
    setStencil: fn (?*LCDSprite, ?*LCDBitmap) callconv(.C) void,
    setClipRect: fn (?*LCDSprite, LCDRect) callconv(.C) void,
    clearClipRect: fn (?*LCDSprite) callconv(.C) void,
    setClipRectsInRange: fn (LCDRect, c_int, c_int) callconv(.C) void,
    clearClipRectsInRange: fn (c_int, c_int) callconv(.C) void,
    setUpdatesEnabled: fn (?*LCDSprite, c_int) callconv(.C) void,
    updatesEnabled: fn (?*LCDSprite) callconv(.C) c_int,
    setCollisionsEnabled: fn (?*LCDSprite, c_int) callconv(.C) void,
    collisionsEnabled: fn (?*LCDSprite) callconv(.C) c_int,
    setVisible: fn (?*LCDSprite, c_int) callconv(.C) void,
    isVisible: fn (?*LCDSprite) callconv(.C) c_int,
    setOpaque: fn (?*LCDSprite, c_int) callconv(.C) void,
    markDirty: fn (?*LCDSprite) callconv(.C) void,
    setTag: fn (?*LCDSprite, u8) callconv(.C) void,
    getTag: fn (?*LCDSprite) callconv(.C) u8,
    setIgnoresDrawOffset: fn (?*LCDSprite, c_int) callconv(.C) void,
    setUpdateFunction: fn (?*LCDSprite, ?LCDSpriteUpdateFunction) callconv(.C) void,
    getPosition: fn (?*LCDSprite, [*c]f32, [*c]f32) callconv(.C) void,
    resetCollisionWorld: fn () callconv(.C) void,
    clearCollideRect: fn (?*LCDSprite) callconv(.C) void,
    checkCollisions: fn (?*LCDSprite, f32, f32, [*c]f32, [*c]f32, [*c]c_int) callconv(.C) [*c]SpriteCollisionInfo,
    moveWithCollisions: fn (?*LCDSprite, f32, f32, [*c]f32, [*c]f32, [*c]c_int) callconv(.C) [*c]SpriteCollisionInfo,
    querySpritesAtPoint: fn (f32, f32, [*c]c_int) callconv(.C) [*c]?*LCDSprite,
    querySpritesInRect: fn (f32, f32, f32, f32, [*c]c_int) callconv(.C) [*c]?*LCDSprite,
    querySpritesAlongLine: fn (f32, f32, f32, f32, [*c]c_int) callconv(.C) [*c]?*LCDSprite,
    querySpriteInfoAlongLine: fn (f32, f32, f32, f32, [*c]c_int) callconv(.C) [*c]SpriteQueryInfo,
    overlappingSprites: fn (?*LCDSprite, [*c]c_int) callconv(.C) [*c]?*LCDSprite,
    allOverlappingSprites: fn ([*c]c_int) callconv(.C) [*c]?*LCDSprite,
    setStencilPattern: fn (?*LCDSprite, [*c]u8) callconv(.C) void,
    clearStencil: fn (?*LCDSprite) callconv(.C) void,
    setUserdata: fn (?*LCDSprite, ?*anyopaque) callconv(.C) void,
    getUserdata: fn (?*LCDSprite) callconv(.C) ?*anyopaque,
    setStencilImage: fn (?*LCDSprite, ?*LCDBitmap, c_int) callconv(.C) void,
};
pub const kSound8bitMono: c_int = 0;
pub const kSound8bitStereo: c_int = 1;
pub const kSound16bitMono: c_int = 2;
pub const kSound16bitStereo: c_int = 3;
pub const kSoundADPCMMono: c_int = 4;
pub const kSoundADPCMStereo: c_int = 5;
pub const SoundFormat = c_uint;
pub fn SoundFormat_bytesPerFrame(arg_fmt: SoundFormat) callconv(.C) u32 {
    var fmt = arg_fmt;
    return @bitCast(u32, (if ((fmt & @bitCast(c_uint, @as(c_int, 1))) != 0) @as(c_int, 2) else @as(c_int, 1)) * (if (fmt >= @bitCast(c_uint, kSound16bitMono)) @as(c_int, 2) else @as(c_int, 1)));
}
pub const MIDINote = f32;
pub fn pd_noteToFrequency(arg_n: MIDINote) callconv(.C) f32 {
    var n = arg_n;
    return @intToFloat(f32, @as(c_int, 440)) * std.math.pow(f32, 2.0, (n - @intToFloat(f32, @as(c_int, 69))) / 12.0);
}
pub fn pd_frequencyToNote(arg_f: f32) callconv(.C) MIDINote {
    var f = arg_f;
    return (@intToFloat(f32, @as(c_int, 12)) * std.math.log2(f)) - 36.37631607055664;
}
pub const SoundSource = opaque {};
pub const sndCallbackProc = fn (?*SoundSource) callconv(.C) void;
pub const playdate_sound_source = extern struct {
    setVolume: fn (?*SoundSource, f32, f32) callconv(.C) void,
    getVolume: fn (?*SoundSource, [*c]f32, [*c]f32) callconv(.C) void,
    isPlaying: fn (?*SoundSource) callconv(.C) c_int,
    setFinishCallback: fn (?*SoundSource, ?sndCallbackProc) callconv(.C) void,
};
pub const FilePlayer = opaque {};
pub const playdate_sound_fileplayer = extern struct {
    newPlayer: fn () callconv(.C) ?*FilePlayer,
    freePlayer: fn (?*FilePlayer) callconv(.C) void,
    loadIntoPlayer: fn (?*FilePlayer, [*c]const u8) callconv(.C) c_int,
    setBufferLength: fn (?*FilePlayer, f32) callconv(.C) void,
    play: fn (?*FilePlayer, c_int) callconv(.C) c_int,
    isPlaying: fn (?*FilePlayer) callconv(.C) c_int,
    pause: fn (?*FilePlayer) callconv(.C) void,
    stop: fn (?*FilePlayer) callconv(.C) void,
    setVolume: fn (?*FilePlayer, f32, f32) callconv(.C) void,
    getVolume: fn (?*FilePlayer, [*c]f32, [*c]f32) callconv(.C) void,
    getLength: fn (?*FilePlayer) callconv(.C) f32,
    setOffset: fn (?*FilePlayer, f32) callconv(.C) void,
    setRate: fn (?*FilePlayer, f32) callconv(.C) void,
    setLoopRange: fn (?*FilePlayer, f32, f32) callconv(.C) void,
    didUnderrun: fn (?*FilePlayer) callconv(.C) c_int,
    setFinishCallback: fn (?*FilePlayer, ?sndCallbackProc) callconv(.C) void,
    setLoopCallback: fn (?*FilePlayer, ?sndCallbackProc) callconv(.C) void,
    getOffset: fn (?*FilePlayer) callconv(.C) f32,
    getRate: fn (?*FilePlayer) callconv(.C) f32,
    setStopOnUnderrun: fn (?*FilePlayer, c_int) callconv(.C) void,
    fadeVolume: fn (?*FilePlayer, f32, f32, i32, ?sndCallbackProc) callconv(.C) void,
    setMP3StreamSource: fn (?*FilePlayer, ?fn ([*c]u8, c_int, ?*anyopaque) callconv(.C) c_int, ?*anyopaque, f32) callconv(.C) void,
};
pub const AudioSample = opaque {};
pub const SamplePlayer = opaque {};
pub const playdate_sound_sample = extern struct {
    newSampleBuffer: fn (c_int) callconv(.C) ?*AudioSample,
    loadIntoSample: fn (?*AudioSample, [*c]const u8) callconv(.C) c_int,
    load: fn ([*c]const u8) callconv(.C) ?*AudioSample,
    freeSample: fn (?*AudioSample) callconv(.C) void,
    getLength: fn (?*AudioSample) callconv(.C) f32,
};
pub const playdate_sound_sampleplayer = extern struct {
    newPlayer: fn () callconv(.C) ?*SamplePlayer,
    freePlayer: fn (?*SamplePlayer) callconv(.C) void,
    setSample: fn (?*SamplePlayer, ?*AudioSample) callconv(.C) void,
    play: fn (?*SamplePlayer, c_int, f32) callconv(.C) c_int,
    isPlaying: fn (?*SamplePlayer) callconv(.C) c_int,
    stop: fn (?*SamplePlayer) callconv(.C) void,
    setVolume: fn (?*SamplePlayer, f32, f32) callconv(.C) void,
    getVolume: fn (?*SamplePlayer, [*c]f32, [*c]f32) callconv(.C) void,
    getLength: fn (?*SamplePlayer) callconv(.C) f32,
    setOffset: fn (?*SamplePlayer, f32) callconv(.C) void,
    setRate: fn (?*SamplePlayer, f32) callconv(.C) void,
    setPlayRange: fn (?*SamplePlayer, c_int, c_int) callconv(.C) void,
    setFinishCallback: fn (?*SamplePlayer, ?sndCallbackProc) callconv(.C) void,
    setLoopCallback: fn (?*SamplePlayer, ?sndCallbackProc) callconv(.C) void,
    getOffset: fn (?*SamplePlayer) callconv(.C) f32,
    getRate: fn (?*SamplePlayer) callconv(.C) f32,
    setPaused: fn (?*SamplePlayer, c_int) callconv(.C) void,
};
pub const PDSynthSignalValue = opaque {};
pub const PDSynthSignal = opaque {};
pub const signalStepFunc = ?fn (?*anyopaque, [*c]c_int, [*c]f32) callconv(.C) f32;
pub const signalNoteOnFunc = ?fn (?*anyopaque, MIDINote, f32, f32) callconv(.C) void;
pub const signalNoteOffFunc = ?fn (?*anyopaque, c_int, c_int) callconv(.C) void;
pub const signalDeallocFunc = ?fn (?*anyopaque) callconv(.C) void;
pub const playdate_sound_signal = extern struct {
    newSignal: fn (signalStepFunc, signalNoteOnFunc, signalNoteOffFunc, signalDeallocFunc, ?*anyopaque) callconv(.C) ?*PDSynthSignal,
    freeSignal: fn (?*PDSynthSignal) callconv(.C) void,
    getValue: fn (?*PDSynthSignal) callconv(.C) f32,
    setValueScale: fn (?*PDSynthSignal, f32) callconv(.C) void,
    setValueOffset: fn (?*PDSynthSignal, f32) callconv(.C) void,
};
pub const kLFOTypeSquare: c_int = 0;
pub const kLFOTypeTriangle: c_int = 1;
pub const kLFOTypeSine: c_int = 2;
pub const kLFOTypeSampleAndHold: c_int = 3;
pub const kLFOTypeSawtoothUp: c_int = 4;
pub const kLFOTypeSawtoothDown: c_int = 5;
pub const kLFOTypeArpeggiator: c_int = 6;
pub const kLFOTypeFunction: c_int = 7;
pub const LFOType = c_uint;
pub const PDSynthLFO = opaque {};
pub const playdate_sound_lfo = extern struct {
    freeLFO: fn (?*PDSynthLFO) callconv(.C) void,
    setRate: fn (?*PDSynthLFO, f32) callconv(.C) void,
    setPhase: fn (?*PDSynthLFO, f32) callconv(.C) void,
    setCenter: fn (?*PDSynthLFO, f32) callconv(.C) void,
    setDepth: fn (?*PDSynthLFO, f32) callconv(.C) void,
    setArpeggiation: fn (?*PDSynthLFO, c_int, [*c]f32) callconv(.C) void,
    setFunction: fn (?*PDSynthLFO, ?fn (?*PDSynthLFO, ?*anyopaque) callconv(.C) f32, ?*anyopaque, c_int) callconv(.C) void,
    setDelay: fn (?*PDSynthLFO, f32, f32) callconv(.C) void,
    setRetrigger: fn (?*PDSynthLFO, c_int) callconv(.C) void,
    getValue: fn (?*PDSynthLFO) callconv(.C) f32,
    setGlobal: fn (?*PDSynthLFO, c_int) callconv(.C) void,
};
pub const PDSynthEnvelope = opaque {};
pub const playdate_sound_envelope = extern struct {
    newEnvelope: fn (f32, f32, f32, f32) callconv(.C) ?*PDSynthEnvelope,
    freeEnvelope: fn (?*PDSynthEnvelope) callconv(.C) void,
    setAttack: fn (?*PDSynthEnvelope, f32) callconv(.C) void,
    setDecay: fn (?*PDSynthEnvelope, f32) callconv(.C) void,
    setSustain: fn (?*PDSynthEnvelope, f32) callconv(.C) void,
    setRelease: fn (?*PDSynthEnvelope, f32) callconv(.C) void,
    setLegato: fn (?*PDSynthEnvelope, c_int) callconv(.C) void,
    setRetrigger: fn (?*PDSynthEnvelope, c_int) callconv(.C) void,
    getValue: fn (?*PDSynthEnvelope) callconv(.C) f32,
};
pub const kWaveformSquare: c_int = 0;
pub const kWaveformTriangle: c_int = 1;
pub const kWaveformSine: c_int = 2;
pub const kWaveformNoise: c_int = 3;
pub const kWaveformSawtooth: c_int = 4;
pub const kWaveformPOPhase: c_int = 5;
pub const kWaveformPODigital: c_int = 6;
pub const kWaveformPOVosim: c_int = 7;
pub const SoundWaveform = c_uint;
pub const synthRenderFunc = ?fn (?*anyopaque, [*c]i32, [*c]i32, c_int, u32, i32) callconv(.C) c_int;
pub const synthNoteOnFunc = ?fn (?*anyopaque, MIDINote, f32, f32) callconv(.C) void;
pub const synthReleaseFunc = ?fn (?*anyopaque, c_int) callconv(.C) void;
pub const synthSetParameterFunc = ?fn (?*anyopaque, c_int, f32) callconv(.C) c_int;
pub const synthDeallocFunc = ?fn (?*anyopaque) callconv(.C) void;
pub const PDSynth = opaque {};
pub const playdate_sound_synth = extern struct {
    newSynth: fn () callconv(.C) ?*PDSynth,
    freeSynth: fn (?*PDSynth) callconv(.C) void,
    setGenerator: fn (?*PDSynth, c_int, synthRenderFunc, synthNoteOnFunc, synthReleaseFunc, synthSetParameterFunc, synthDeallocFunc, ?*anyopaque) callconv(.C) void,
    setSample: fn (?*PDSynth, ?*AudioSample, u32, u32) callconv(.C) void,
    setAttackTime: fn (?*PDSynth, f32) callconv(.C) void,
    setDecayTime: fn (?*PDSynth, f32) callconv(.C) void,
    setSustainLevel: fn (?*PDSynth, f32) callconv(.C) void,
    setReleaseTime: fn (?*PDSynth, f32) callconv(.C) void,
    setTranspose: fn (?*PDSynth, f32) callconv(.C) void,
    setFrequencyModulator: fn (?*PDSynth, ?*PDSynthSignalValue) callconv(.C) void,
    getFrequencyModulator: fn (?*PDSynth) callconv(.C) ?*PDSynthSignalValue,
    setAmplitudeModulator: fn (?*PDSynth, ?*PDSynthSignalValue) callconv(.C) void,
    getAmplitudeModulator: fn (?*PDSynth) callconv(.C) ?*PDSynthSignalValue,
    getParameterCount: fn (?*PDSynth) callconv(.C) c_int,
    setParameter: fn (?*PDSynth, c_int, f32) callconv(.C) c_int,
    setParameterModulator: fn (?*PDSynth, c_int, ?*PDSynthSignalValue) callconv(.C) void,
    getParameterModulator: fn (?*PDSynth, c_int) callconv(.C) ?*PDSynthSignalValue,
    playNote: fn (?*PDSynth, f32, f32, f32, u32) callconv(.C) void,
    playMIDINote: fn (?*PDSynth, MIDINote, f32, f32, u32) callconv(.C) void,
    noteOff: fn (?*PDSynth, u32) callconv(.C) void,
    stop: fn (?*PDSynth) callconv(.C) void,
    setVolume: fn (?*PDSynth, f32, f32) callconv(.C) void,
    getVolume: fn (?*PDSynth, [*c]f32, [*c]f32) callconv(.C) void,
    isPlaying: fn (?*PDSynth) callconv(.C) c_int,
};
pub const ControlSignal = opaque {};
pub const playdate_control_signal = extern struct {
    newSignal: fn () callconv(.C) ?*ControlSignal,
    freeSignal: fn (?*ControlSignal) callconv(.C) void,
    clearEvents: fn (?*ControlSignal) callconv(.C) void,
    addEvent: fn (?*ControlSignal, c_int, f32, c_int) callconv(.C) void,
    removeEvent: fn (?*ControlSignal, c_int) callconv(.C) void,
    getMIDIControllerNumber: fn (?*ControlSignal) callconv(.C) c_int,
};
pub const PDSynthInstrument = opaque {};
pub const playdate_sound_instrument = extern struct {
    newInstrument: fn () callconv(.C) ?*PDSynthInstrument,
    freeInstrument: fn (?*PDSynthInstrument) callconv(.C) void,
    addVoice: fn (?*PDSynthInstrument, ?*PDSynth, MIDINote, MIDINote, f32) callconv(.C) c_int,
    playNote: fn (?*PDSynthInstrument, f32, f32, f32, u32) callconv(.C) ?*PDSynth,
    playMIDINote: fn (?*PDSynthInstrument, MIDINote, f32, f32, u32) callconv(.C) ?*PDSynth,
    setPitchBend: fn (?*PDSynthInstrument, f32) callconv(.C) void,
    setPitchBendRange: fn (?*PDSynthInstrument, f32) callconv(.C) void,
    setTranspose: fn (?*PDSynthInstrument, f32) callconv(.C) void,
    noteOff: fn (?*PDSynthInstrument, MIDINote, u32) callconv(.C) void,
    allNotesOff: fn (?*PDSynthInstrument, u32) callconv(.C) void,
    setVolume: fn (?*PDSynthInstrument, f32, f32) callconv(.C) void,
    getVolume: fn (?*PDSynthInstrument, [*c]f32, [*c]f32) callconv(.C) void,
    activeVoiceCount: fn (?*PDSynthInstrument) callconv(.C) c_int,
};
pub const SequenceTrack = opaque {};
pub const playdate_sound_track = extern struct {
    newTrack: fn () callconv(.C) ?*SequenceTrack,
    freeTrack: fn (?*SequenceTrack) callconv(.C) void,
    setInstrument: fn (?*SequenceTrack, ?*PDSynthInstrument) callconv(.C) void,
    getInstrument: fn (?*SequenceTrack) callconv(.C) ?*PDSynthInstrument,
    addNoteEvent: fn (?*SequenceTrack, u32, u32, MIDINote, f32) callconv(.C) void,
    removeNoteEvent: fn (?*SequenceTrack, u32, MIDINote) callconv(.C) void,
    clearNotes: fn (?*SequenceTrack) callconv(.C) void,
    getControlSignalCount: fn (?*SequenceTrack) callconv(.C) c_int,
    getControlSignal: fn (?*SequenceTrack, c_int) callconv(.C) ?*ControlSignal,
    clearControlEvents: fn (?*SequenceTrack) callconv(.C) void,
    getPolyphony: fn (?*SequenceTrack) callconv(.C) c_int,
    activeVoiceCount: fn (?*SequenceTrack) callconv(.C) c_int,
    setMuted: fn (?*SequenceTrack, c_int) callconv(.C) void,
    getLength: fn (?*SequenceTrack) callconv(.C) u32,
    getIndexForStep: fn (?*SequenceTrack, u32) callconv(.C) c_int,
    getNoteAtIndex: fn (?*SequenceTrack, c_int, [*c]u32, [*c]u32, [*c]MIDINote, [*c]f32) callconv(.C) c_int,
    getSignalForController: fn (?*SequenceTrack, c_int, c_int) callconv(.C) ?*ControlSignal,
};
pub const SoundSequence = opaque {};
pub const SequenceFinishedCallback = ?fn (?*SoundSequence, ?*anyopaque) callconv(.C) void;
pub const playdate_sound_sequence = extern struct {
    newSequence: fn () callconv(.C) ?*SoundSequence,
    freeSequence: fn (?*SoundSequence) callconv(.C) void,
    loadMidiFile: fn (?*SoundSequence, [*c]const u8) callconv(.C) c_int,
    getTime: fn (?*SoundSequence) callconv(.C) u32,
    setTime: fn (?*SoundSequence, u32) callconv(.C) void,
    setLoops: fn (?*SoundSequence, c_int, c_int, c_int) callconv(.C) void,
    getTempo: fn (?*SoundSequence) callconv(.C) c_int,
    setTempo: fn (?*SoundSequence, c_int) callconv(.C) void,
    getTrackCount: fn (?*SoundSequence) callconv(.C) c_int,
    addTrack: fn (?*SoundSequence) callconv(.C) ?*SequenceTrack,
    getTrackAtIndex: fn (?*SoundSequence, c_uint) callconv(.C) ?*SequenceTrack,
    setTrackAtIndex: fn (?*SoundSequence, ?*SequenceTrack, c_uint) callconv(.C) void,
    allNotesOff: fn (?*SoundSequence) callconv(.C) void,
    isPlaying: fn (?*SoundSequence) callconv(.C) c_int,
    getLength: fn (?*SoundSequence) callconv(.C) u32,
    play: fn (?*SoundSequence, SequenceFinishedCallback, ?*anyopaque) callconv(.C) void,
    stop: fn (?*SoundSequence) callconv(.C) void,
    getCurrentStep: fn (?*SoundSequence, [*c]c_int) callconv(.C) c_int,
    setCurrentStep: fn (?*SoundSequence, c_int, c_int, c_int) callconv(.C) void,
};
pub const TwoPoleFilter = opaque {};
pub const kFilterTypeLowPass: c_int = 0;
pub const kFilterTypeHighPass: c_int = 1;
pub const kFilterTypeBandPass: c_int = 2;
pub const kFilterTypeNotch: c_int = 3;
pub const kFilterTypePEQ: c_int = 4;
pub const kFilterTypeLowShelf: c_int = 5;
pub const kFilterTypeHighShelf: c_int = 6;
pub const TwoPoleFilterType = c_uint;
pub const playdate_sound_effect_twopolefilter = extern struct {
    newFilter: fn () callconv(.C) ?*TwoPoleFilter,
    freeFilter: fn (?*TwoPoleFilter) callconv(.C) void,
    setFrequency: fn (?*TwoPoleFilter, f32) callconv(.C) void,
    setFrequencyModulator: fn (?*TwoPoleFilter, ?*PDSynthSignalValue) callconv(.C) void,
    getFrequencyModulator: fn (?*TwoPoleFilter) callconv(.C) ?*PDSynthSignalValue,
    setGain: fn (?*TwoPoleFilter, f32) callconv(.C) void,
    setResonance: fn (?*TwoPoleFilter, f32) callconv(.C) void,
    setResonanceModulator: fn (?*TwoPoleFilter, ?*PDSynthSignalValue) callconv(.C) void,
    getResonanceModulator: fn (?*TwoPoleFilter) callconv(.C) ?*PDSynthSignalValue,
};
pub const OnePoleFilter = opaque {};
pub const playdate_sound_effect_onepolefilter = extern struct {
    newFilter: fn () callconv(.C) ?*OnePoleFilter,
    freeFilter: fn (?*OnePoleFilter) callconv(.C) void,
    setParameter: fn (?*OnePoleFilter, f32) callconv(.C) void,
    setParameterModulator: fn (?*OnePoleFilter, ?*PDSynthSignalValue) callconv(.C) void,
    getParameterModulator: fn (?*OnePoleFilter) callconv(.C) ?*PDSynthSignalValue,
};
pub const BitCrusher = opaque {};
pub const playdate_sound_effect_bitcrusher = extern struct {
    newBitCrusher: fn () callconv(.C) ?*BitCrusher,
    freeBitCrusher: fn (?*BitCrusher) callconv(.C) void,
    setAmount: fn (?*BitCrusher, f32) callconv(.C) void,
    setAmountModulator: fn (?*BitCrusher, ?*PDSynthSignalValue) callconv(.C) void,
    getAmountModulator: fn (?*BitCrusher) callconv(.C) ?*PDSynthSignalValue,
    setUndersampling: fn (?*BitCrusher, f32) callconv(.C) void,
    setUndersampleModulator: fn (?*BitCrusher, ?*PDSynthSignalValue) callconv(.C) void,
    getUndersampleModulator: fn (?*BitCrusher) callconv(.C) ?*PDSynthSignalValue,
};
pub const RingModulator = opaque {};
pub const playdate_sound_effect_ringmodulator = extern struct {
    newRingmod: fn () callconv(.C) ?*RingModulator,
    freeRingmod: fn (?*RingModulator) callconv(.C) void,
    setFrequency: fn (?*RingModulator, f32) callconv(.C) void,
    setFrequencyModulator: fn (?*RingModulator, ?*PDSynthSignalValue) callconv(.C) void,
    getFrequencyModulator: fn (?*RingModulator) callconv(.C) ?*PDSynthSignalValue,
};
pub const DelayLine = opaque {};
pub const DelayLineTap = opaque {};
pub const playdate_sound_effect_delayline = extern struct {
    newDelayLine: fn (c_int, c_int) callconv(.C) ?*DelayLine,
    freeDelayLine: fn (?*DelayLine) callconv(.C) void,
    setLength: fn (?*DelayLine, c_int) callconv(.C) void,
    setFeedback: fn (?*DelayLine, f32) callconv(.C) void,
    addTap: fn (?*DelayLine, c_int) callconv(.C) ?*DelayLineTap,
    freeTap: fn (?*DelayLineTap) callconv(.C) void,
    setTapDelay: fn (?*DelayLineTap, c_int) callconv(.C) void,
    setTapDelayModulator: fn (?*DelayLineTap, ?*PDSynthSignalValue) callconv(.C) void,
    getTapDelayModulator: fn (?*DelayLineTap) callconv(.C) ?*PDSynthSignalValue,
    setTapChannelsFlipped: fn (?*DelayLineTap, c_int) callconv(.C) void,
};
pub const Overdrive = opaque {};
pub const playdate_sound_effect_overdrive = extern struct {
    newOverdrive: fn () callconv(.C) ?*Overdrive,
    freeOverdrive: fn (?*Overdrive) callconv(.C) void,
    setGain: fn (?*Overdrive, f32) callconv(.C) void,
    setLimit: fn (?*Overdrive, f32) callconv(.C) void,
    setLimitModulator: fn (?*Overdrive, ?*PDSynthSignalValue) callconv(.C) void,
    getLimitModulator: fn (?*Overdrive) callconv(.C) ?*PDSynthSignalValue,
    setOffset: fn (?*Overdrive, f32) callconv(.C) void,
    setOffsetModulator: fn (?*Overdrive, ?*PDSynthSignalValue) callconv(.C) void,
    getOffsetModulator: fn (?*Overdrive) callconv(.C) ?*PDSynthSignalValue,
};
pub const SoundEffect = opaque {};
pub const effectProc = fn (?*SoundEffect, [*c]i32, [*c]i32, c_int, c_int) callconv(.C) c_int;
pub const playdate_sound_effect = extern struct {
    newEffect: fn (?effectProc, ?*anyopaque) callconv(.C) ?*SoundEffect,
    freeEffect: fn (?*SoundEffect) callconv(.C) void,
    setMix: fn (?*SoundEffect, f32) callconv(.C) void,
    setMixModulator: fn (?*SoundEffect, ?*PDSynthSignalValue) callconv(.C) void,
    getMixModulator: fn (?*SoundEffect) callconv(.C) ?*PDSynthSignalValue,
    setUserdata: fn (?*SoundEffect, ?*anyopaque) callconv(.C) void,
    getUserdata: fn (?*SoundEffect) callconv(.C) ?*anyopaque,
    twopolefilter: [*c]const playdate_sound_effect_twopolefilter,
    onepolefilter: [*c]const playdate_sound_effect_onepolefilter,
    bitcrusher: [*c]const playdate_sound_effect_bitcrusher,
    ringmodulator: [*c]const playdate_sound_effect_ringmodulator,
    delayline: [*c]const playdate_sound_effect_delayline,
    overdrive: [*c]const playdate_sound_effect_overdrive,
};
pub const SoundChannel = opaque {};
pub const AudioSourceFunction = fn (?*anyopaque, [*c]i16, [*c]i16, c_int) callconv(.C) c_int;
pub const playdate_sound_channel = extern struct {
    newChannel: fn () callconv(.C) ?*SoundChannel,
    freeChannel: fn (?*SoundChannel) callconv(.C) void,
    addSource: fn (?*SoundChannel, ?*SoundSource) callconv(.C) c_int,
    removeSource: fn (?*SoundChannel, ?*SoundSource) callconv(.C) c_int,
    addCallbackSource: fn (?*SoundChannel, ?AudioSourceFunction, ?*anyopaque, c_int) callconv(.C) ?*SoundSource,
    addEffect: fn (?*SoundChannel, ?*SoundEffect) callconv(.C) void,
    removeEffect: fn (?*SoundChannel, ?*SoundEffect) callconv(.C) void,
    setVolume: fn (?*SoundChannel, f32) callconv(.C) void,
    getVolume: fn (?*SoundChannel) callconv(.C) f32,
    setVolumeModulator: fn (?*SoundChannel, ?*PDSynthSignalValue) callconv(.C) void,
    getVolumeModulator: fn (?*SoundChannel) callconv(.C) ?*PDSynthSignalValue,
    setPan: fn (?*SoundChannel, f32) callconv(.C) void,
    setPanModulator: fn (?*SoundChannel, ?*PDSynthSignalValue) callconv(.C) void,
    getPanModulator: fn (?*SoundChannel) callconv(.C) ?*PDSynthSignalValue,
    getDryLevelSignal: fn (?*SoundChannel) callconv(.C) ?*PDSynthSignalValue,
    getWetLevelSignal: fn (?*SoundChannel) callconv(.C) ?*PDSynthSignalValue,
};
pub const RecordCallback = fn (?*anyopaque, [*c]i16, c_int) callconv(.C) c_int;
pub const playdate_sound = extern struct {
    channel: [*c]const playdate_sound_channel,
    fileplayer: [*c]const playdate_sound_fileplayer,
    sample: [*c]const playdate_sound_sample,
    sampleplayer: [*c]const playdate_sound_sampleplayer,
    synth: [*c]const playdate_sound_synth,
    sequence: [*c]const playdate_sound_sequence,
    effect: [*c]const playdate_sound_effect,
    lfo: [*c]const playdate_sound_lfo,
    envelope: [*c]const playdate_sound_envelope,
    source: [*c]const playdate_sound_source,
    controlsignal: [*c]const playdate_control_signal,
    track: [*c]const playdate_sound_track,
    instrument: [*c]const playdate_sound_instrument,
    getCurrentTime: fn () callconv(.C) u32,
    addSource: fn (?AudioSourceFunction, ?*anyopaque, c_int) callconv(.C) ?*SoundSource,
    getDefaultChannel: fn () callconv(.C) ?*SoundChannel,
    addChannel: fn (?*SoundChannel) callconv(.C) void,
    removeChannel: fn (?*SoundChannel) callconv(.C) void,
    setMicCallback: fn (?RecordCallback, ?*anyopaque, c_int) callconv(.C) void,
    getHeadphoneState: fn ([*c]c_int, [*c]c_int, ?fn (c_int, c_int) callconv(.C) void) callconv(.C) void,
    setOutputsActive: fn (c_int, c_int) callconv(.C) void,
    removeSource: fn (?*SoundSource) callconv(.C) void,
    signal: [*c]const playdate_sound_signal,
};
pub const playdate_display = extern struct {
    getWidth: fn () callconv(.C) c_int,
    getHeight: fn () callconv(.C) c_int,
    setRefreshRate: fn (f32) callconv(.C) void,
    setInverted: fn (c_int) callconv(.C) void,
    setScale: fn (c_uint) callconv(.C) void,
    setMosaic: fn (c_uint, c_uint) callconv(.C) void,
    setFlipped: fn (c_int, c_int) callconv(.C) void,
    setOffset: fn (c_int, c_int) callconv(.C) void,
};
pub const PDScore = extern struct {
    rank: u32,
    value: u32,
    player: [*c]u8,
};
pub const PDScoresList = extern struct {
    boardID: [*c]u8,
    count: c_uint,
    lastUpdated: u32,
    playerIncluded: c_int,
    limit: c_uint,
    scores: [*c]PDScore,
};
pub const PDBoard = extern struct {
    boardID: [*c]u8,
    name: [*c]u8,
};
pub const PDBoardsList = extern struct {
    count: c_uint,
    lastUpdated: u32,
    boards: [*c]PDBoard,
};
pub const AddScoreCallback = ?fn ([*c]PDScore, [*c]const u8) callconv(.C) void;
pub const PersonalBestCallback = ?fn ([*c]PDScore, [*c]const u8) callconv(.C) void;
pub const BoardsListCallback = ?fn ([*c]PDBoardsList, [*c]const u8) callconv(.C) void;
pub const ScoresCallback = ?fn ([*c]PDScoresList, [*c]const u8) callconv(.C) void;
pub const playdate_scoreboards = extern struct {
    addScore: fn ([*c]const u8, u32, AddScoreCallback) callconv(.C) c_int,
    getPersonalBest: fn ([*c]const u8, PersonalBestCallback) callconv(.C) c_int,
    freeScore: fn ([*c]PDScore) callconv(.C) void,
    getScoreboards: fn (BoardsListCallback) callconv(.C) c_int,
    freeBoardsList: fn ([*c]PDBoardsList) callconv(.C) void,
    getScores: fn ([*c]const u8, ScoresCallback) callconv(.C) c_int,
    freeScoresList: fn ([*c]PDScoresList) callconv(.C) void,
};
pub const playdate_lua = opaque {};
pub const PlaydateAPI = extern struct {
    system: [*c]const playdate_sys,
    file: [*c]const playdate_file,
    graphics: [*c]const playdate_graphics,
    sprite: [*c]const playdate_sprite,
    display: [*c]const playdate_display,
    sound: [*c]const playdate_sound,
    lua: ?*const playdate_lua,
    json: [*c]const playdate_json,
    scoreboards: [*c]const playdate_scoreboards,
};
pub const kEventInit: c_int = 0;
pub const kEventInitLua: c_int = 1;
pub const kEventLock: c_int = 2;
pub const kEventUnlock: c_int = 3;
pub const kEventPause: c_int = 4;
pub const kEventResume: c_int = 5;
pub const kEventTerminate: c_int = 6;
pub const kEventKeyPressed: c_int = 7;
pub const kEventKeyReleased: c_int = 8;
pub const kEventLowPower: c_int = 9;
pub const PDSystemEvent = c_uint;
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const AUDIO_FRAMES_PER_CYCLE = @as(c_int, 512);
pub inline fn SoundFormatIsStereo(f: anytype) @TypeOf(f & @as(c_int, 1)) {
    return f & @as(c_int, 1);
}
pub inline fn SoundFormatIs16bit(f: anytype) @TypeOf(f >= kSound16bitMono) {
    return f >= kSound16bitMono;
}
pub const NOTE_C4 = @as(c_int, 60);

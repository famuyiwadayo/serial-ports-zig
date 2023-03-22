const std = @import("std");
const serial = @import("serial");

pub fn main() !void {
    var iterator = try serial.list();
    defer iterator.deinit();

    while (try iterator.next()) |port| {
        std.debug.print("path={s},\tname={s},\tdriver={s}\n", .{ port.file_name, port.display_name, port.driver orelse "" });
    }

    return 0;
}

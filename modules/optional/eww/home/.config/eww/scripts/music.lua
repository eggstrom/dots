#!/usr/bin/env luajit

local lib = require("scripts.lib")

local data = {}

function data:update()
    local status = lib.pipe("mpc", 3)

    -- Check if mpd is playing using second line
    self.playing = status[2] ~= nil and status[2]:find("%[playing%]") ~= nil

    -- Get rest of data from last line
    self.volume = status[#status]:match("volume:%s*(%d+)")
    self.repeat_ = status[#status]:match("repeat:%s*(%a+)") == "on"
    self.random = status[#status]:match("random:%s*(%a+)") == "on"
end

function data:print()
    io.write(
        string.format(
            '{"playing":%s,"volume":%s,"repeat":%s,"random":%s}\n',
            self.playing,
            self.volume,
            self.repeat_,
            self.random
        )
    )
end

while true do
    data:update()
    data:print()

    -- Wait for the following events:
    -----------------------
    -- Event    | Triggers
    -----------------------
    -- update   | update
    -- playlist | add, clear
    -- player   | play, pause, stop, next, prev
    -- mixer    | volume
    -- options  | repeat, random
    os.execute("mpc idle update playlist player mixer options >/dev/null")
end

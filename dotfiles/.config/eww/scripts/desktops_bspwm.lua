#!/usr/bin/env luajit

local lib = require("scripts.lib")

local DESKTOP_COUNT = tonumber(lib.pipe("bspc query -D | wc -l", 1))
local listener = lib.pipe("bspc subscribe report")

while true do
	-- Match smallest string that ends with :
	local next = listener:read("*l"):gmatch("(.-):")
	next() -- Skip first match

    local wrote_first = false
	io.write("[")
	for _ = 1, DESKTOP_COUNT do
		local desktop = next()
		local state = desktop:sub(1, 1)

		-- Skip desktop if it's empty
		if state == "f" then
			goto continue
		end

		if wrote_first then
			io.write(",")
		end
		io.write(string.format('{"name":"%s","focused":%s}', desktop:sub(2), state:find("%u") ~= nil))
        wrote_first = true
		::continue::
	end
	io.write("]\n")
end

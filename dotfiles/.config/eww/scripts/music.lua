#!/usr/bin/env luajit

local lib = require("scripts.lib")

local data = {}

function data:update()
	local status = lib.pipe("mpc", 3)

	-- Get state from 2nd line, if it exists
	if status[2] == nil then
		self.state = "stopped"
	elseif status[2]:find("%[playing%]") then
		self.state = "playing"
	else
		self.state = "paused"
	end

	-- Get rest of data from last line
	data.volume = status[#status]:match("volume:%s*(%d+)")
	data.repeat_ = status[#status]:match("repeat:%s*(%a+)") == "on"
	data.random = status[#status]:match("random:%s*(%a+)") == "on"
end

function data:print()
	print(
		string.format(
			'{"state":"%s","volume":%s,"repeat":%s,"random":%s}',
			data.state,
			data.volume,
			data.repeat_,
			data.random
		)
	)
end

while true do
	data:update()
	data:print()

	-- Wait for the following events:
	-- player:  play, pause, stop, next, prev
	-- mixer:   volume
	-- options: repeat, random
	os.execute("mpc idle player mixer options >/dev/null")
end

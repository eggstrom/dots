#!/usr/bin/env luajit

local lib = require("scripts.lib")

local NAMES_PROP = "_NET_DESKTOP_NAMES"
local CURRENT_PROP = "_NET_CURRENT_DESKTOP"

local data = {}

function data:update(output)
	if output:find(NAMES_PROP) then
		self.names = "[" .. output:match(" = (.*)") .. "]"
	elseif output:find(CURRENT_PROP) then
		self.current = output:match(" = (.*)")
	end
end

function data:print()
	print(string.format('{"current":%s,"names":%s}', self.current, self.names))
end

local listener = lib.pipe("xprop -spy -root " .. NAMES_PROP .. " " .. CURRENT_PROP)

while true do
	data:update(listener:read("*l"))
    data:print()
end

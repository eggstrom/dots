#!/usr/bin/env luajit

local lib = require("scripts.lib")

local data = {}

function data:update_sink()
	self.sink = {
		volume = lib.pipe("pamixer --get-volume ", 1),
		muted = lib.pipe("pamixer --get-mute ", 1),
	}
end

function data:update_source()
	self.source = {
		volume = lib.pipe("pamixer --get-volume --default-source", 1),
		muted = lib.pipe("pamixer --get-mute --default-source", 1),
	}
end

function data:print()
	print(
		string.format(
			'{"sink":{"volume":%s,"muted":%s},"source":{"volume":%s,"muted":%s}}',
			self.sink.volume,
			self.sink.muted,
			self.source.volume,
			self.source.muted
		)
	)
end

data:update_sink()
data:update_source()
data:print()

-- Get default sink and source
local sink = lib.pipe("pamixer --list-sinks | grep \"$(pactl get-default-sink)\" | cut -d' ' -f1", 1)
local source = lib.pipe("pamixer --list-sources | grep \"$(pactl get-default-source)\" | cut -d' ' -f1", 1)
local sink_event = "Event 'change' on sink #" .. sink
local source_event = "Event 'change' on source #" .. source

local listener = lib.pipe("pactl subscribe")

while true do
	local event = listener:read("*l")

	if event == sink_event then
        data:update_sink()
	elseif event == source_event then
        data:update_source()
	else
		goto continue
	end

    data:print()
	::continue::
end

#!/usr/bin/env luajit

local lib = require("scripts.lib")

local output = lib.pipe("acpi 2>/dev/null", 1)
if output == nil then
  return
end

local status, capacity = output:match(": (%S+), (%d+)%%")
local time = output:match("(%d%d:%d%d:%d%d)") or ""
io.write(string.format('{"status":"%s","capacity":%s,"time":"%s"}\n', status, capacity, time))

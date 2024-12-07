#!/usr/bin/env luajit

local lib = require("scripts.lib")

local CURRENT_PROP = "_NET_CURRENT_DESKTOP"
local NAMES_PROP = "_NET_DESKTOP_NAMES"

local data = {}

function data:update(output)
  if output:find(CURRENT_PROP) then
    self.current = output:match(" = (.*)")
  elseif output:find(NAMES_PROP) then
    -- Convert output to a table
    self.desktops = load("return {" .. output:match(" = (.*)") .. "}")()
  end
end

function data:print()
  -- Don't print if all data hasn't been initialized
  if self.current == nil or self.desktops == nil then
    return
  end

  io.write(string.format('{"current":%s,"desktops":[', self.current))
  for i, name in ipairs(self.desktops) do
    io.write(string.format('{"index":%s,"name":"%s"}', i - 1, name))
    if i < #self.desktops then
      io.write(",")
    end
  end
  io.write("]}\n")
end

local listener = lib.pipe(string.format("xprop -spy -root %s %s", CURRENT_PROP, NAMES_PROP))

while true do
  data:update(listener:read("*l"))
  data:print()
end

--[=[
@class Clock
@inherits Emitter
@tag utility
@description Used to periodically execute code according to the ticking of the system clock instead of arbitrary interval.
]=]

local class = require('../class')
local helpers = require('../helpers')
local Emitter = require('./Emitter')

local date = os.date
local setInterval, clearTimer = helpers.setInterval, helpers.clearTimer

local Clock = class('Clock', Emitter)

--[=[
@constructor __init
@description TODO
]=]
function Clock:__init()
	Emitter.__init(self)
	self._interval = nil
end

--[=[
@method start
@param? utc boolean false
@returns nil
@description Starts this clock's main loop. An event is emitted for every change in the `os.date` table. The event name
is key of the value that changed and the only argument is the corresponding date table.

If `utc` is passed, UTC time is used; otherwise, local time is used.

Valid events are: sec, min, hour, day, wday, yday, month, year, isdst
]=]
function Clock:start(utc)
	if self._interval then return end
	local fmt = utc and '!*t' or '*t'
	local prev = date(fmt)
	self._interval = setInterval(1000, function()
		local now = date(fmt)
		for k, v in pairs(now) do
			if v ~= prev[k] then
				self:emit(k, now)
			end
		end
		prev = now
	end)
end

--[=[
@method stop
@returns nil
@description Stops the clock's main loop immediately.
]=]
function Clock:stop()
	if not self._interval then return end
	clearTimer(self._interval)
	self._interval = nil
end

return Clock

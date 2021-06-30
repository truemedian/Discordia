--[=[
@class Stopwatch
@tag utility
@description Used to measure an elapsed period of time. Although nanosecond precision is available, Lua can only
reliably provide microsecond accuracy due to the lack of native 64-bit integer support. Generally, milliseconds should
be sufficient here.
]=]

local uv = require('uv')
local class = require('../class')
local constants = require('../constants')
local Time = require('./Time')

local hrtime = uv.hrtime

local NS_PER_US = constants.NS_PER_US

local Stopwatch = class('Stopwatch')

--[=[
@constructor __init
@param stopped boolean
@description TODO
]=]
function Stopwatch:__init(stopped)
	local t = hrtime()
	self._initial = t
	self._final = stopped and t or nil
end

--[=[
@method toString
@returns string
@description TODO
]=]
function Stopwatch:toString()
	return self:getTime():toString()
end

--[=[
@method getTime
@returns Time
@description Returns a new Time object that represents the currently elapsed time. This is useful for "catching" the
current time and comparing its many forms as required.
]=]
function Stopwatch:getTime()
	local ns = (self._final or hrtime()) - self._initial
	return Time.fromMicroseconds(ns / NS_PER_US)
end

--[=[
@method start
@returns nil
@description Starts the stopwatch. This function is idempotent, calling it multiple times has no effect.
]=]
function Stopwatch:start()
	if not self._final then return end
	self._initial = self._initial + hrtime() - self._final
	self._final = nil
end

--[=[
@method stop
@returns nil
@description Stops the stopwatch, time elapsed will no longer increase.
]=]
function Stopwatch:stop()
	if self._final then return end
	self._final = hrtime()
end

--[=[
@method reset
@returns nil
@description Resets the stopwatch. If the stopwatch currently running, the start time is reset to the current time. If
the stopwatch is stopped, the start time is reset to the time that the stopwatch was stopped.
]=]
function Stopwatch:reset()
	self._initial = self._final or hrtime()
end

return Stopwatch

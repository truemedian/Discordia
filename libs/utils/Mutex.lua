--[=[
@class Mutex
@tag utility
@description Mutual exclusion class used to control Lua coroutine execution order.
]=]

local class = require('../class')
local typing = require('../typing')
local helpers = require('../helpers')

local yield, running = coroutine.yield, coroutine.running
local setTimeout = helpers.setTimeout
local insert, remove = table.insert, table.remove
local checkNumber = typing.checkNumber
local assertResume = helpers.assertResume

local Mutex = class('Mutex')

--[=[
@constructor __init
@description TODO
]=]
function Mutex:__init()
	self._queue = {}
	self._active = false
end

--[=[
@method lock
@tag yields
@param prepend boolean
@return nil
@description If the mutex is not active (if a coroutine is not queued), this will activate the mutex; otherwise, this
will yield and queue the current coroutine.
]=]
function Mutex:lock(prepend)
	if self._active then
		local thread = running()
		if prepend then
			insert(self._queue, 1, thread)
		else
			insert(self._queue, thread)
		end
		return yield()
	else
		self._active = true
	end
end

--[=[
@method unlock
@return nil
@description If the mutex is active (if a coroutine is queued), this will dequeue and resume the next available
coroutine; otherwise, this will deactivate the mutex.
]=]
function Mutex:unlock()
	local thread = remove(self._queue, 1)
	if thread then
		return assertResume(thread)
	else
		self._active = false
	end
end

--[=[
@method unlockAfter
@param delay number
@return userdata[uv_timer_t]
@description Asynchronously unlocks the mutex after a specified time in milliseconds. The relevant `uv_timer` object is
returned.
]=]
function Mutex:unlockAfter(delay)
	return setTimeout(checkNumber(delay, 10, 0), self.unlock, self)
end

return Mutex

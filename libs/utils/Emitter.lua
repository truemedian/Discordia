--[=[
@class Emitter
@tag utility
@description TODO
]=]

local Listener = require('./Listener')
local Iterable = require('./Iterable')

local class = require('../class')
local typing = require('../typing')
local helpers = require('../helpers')

local yield, running = coroutine.yield, coroutine.running
local insert, remove = table.insert, table.remove
local setTimeout, clearTimer = helpers.setTimeout, helpers.clearTimer
local checkType = typing.checkType
local checkNumber = typing.checkNumber
local assertResume = helpers.assertResume

local Emitter = class('Emitter')

local meta = {
	__index = function(self, k)
		self[k] = {}
		return self[k]
	end
}

local function mark(listeners, i)
	listeners[i] = false
	listeners.marked = true
end

local function clean(listeners)
	for i = #listeners, 1, -1 do
		if not listeners[i] then
			remove(listeners, i)
		end
	end
	listeners.marked = nil
end

local once = {}

--[=[
@constructor __init
@description TODO
]=]
function Emitter:__init()
	self._listeners = setmetatable({}, meta)
end

--[=[
@method on
@param eventName string
@param callback function
@param? errorHandler function
@returns Listener
@description TODO
]=]
function Emitter:on(eventName, callback, errorHandler)
	local listener = Listener(self, eventName, callback, errorHandler)
	insert(self._listeners[listener.eventName], listener)
	return listener
end

--[=[
@method once
@param eventName string
@param callback function
@param? errorHandler function
@returns Listener
@description TODO
]=]
function Emitter:once(eventName, callback, errorHandler)
	local listener = Listener(self, eventName, callback, errorHandler)
	insert(self._listeners[listener.eventName], listener)
	once[listener] = true
	return listener
end


--[=[
@method emit
@param eventName string
@param ... any
@returns nil
@description TODO
]=]
function Emitter:emit(eventName, ...)
	local listeners = self._listeners[checkType('string', eventName)]
	for i = 1, #listeners do
		local listener = listeners[i]
		if listener then
			if once[listener] then
				mark(listeners, i)
			end
			listener:fire(...)
		end
	end
	if listeners.marked then
		clean(listeners)
	end
end

--[=[
@method getListeners
@param eventName string
@returns Iterable[Listener]
@description TODO
]=]
function Emitter:getListeners(eventName)
	local listeners = self._listeners[checkType('string', eventName)]
	local new = {}
	for _, v in ipairs(listeners) do
		if v then
			insert(new, v)
		end
	end
	return Iterable(new)
end

--[=[
@method removeListener
@param eventName string
@param listener Listener
@returns nil
@description TODO
]=]
function Emitter:removeListener(eventName, listener)
	local listeners = self._listeners[checkType('string', eventName)]
	for i, v in ipairs(listeners) do
		if v == listener then
			listeners[i] = false
			return true
		end
	end
	return false
end

--[=[
@method removeAllListeners
@param eventName string
@returns nil
@description TODO
]=]
function Emitter:removeAllListeners(eventName)
	if eventName then
		self._listeners[checkType('string', eventName)] = nil
	else
		for k in pairs(self._listeners) do
			self._listeners[k] = nil
		end
	end
end

--[=[
@method eventName
@tag yields
@param eventName string
@param? timeout number
@param? predicate function
@returns any
@description TODO
]=]
function Emitter:waitFor(eventName, timeout, predicate)

	eventName = checkType('string', eventName)
	predicate = predicate and checkType('function', predicate)

	local t, listener
	local thread = running()

	local function complete(success, ...)
		if t then
			clearTimer(t)
			t = nil
		end
		if listener then
			self:removeListener(eventName, listener)
			listener = nil
			return assertResume(thread, success, ...)
		end
	end

	listener = self:on(eventName, function(...)
		if not predicate or predicate(...) then
			return complete(true, ...)
		end
	end)

	if timeout then
		t = setTimeout(checkNumber(timeout, 10, 0), complete, false)
	end

	return yield()

end

return Emitter

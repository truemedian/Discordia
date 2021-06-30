--[=[
@class Listener
@tag utility
@description TODO
]=]

local class = require('../class')
local typing = require('../typing')

local wrap = coroutine.wrap
local checkType = typing.checkType
local checkCallable = typing.checkCallable

local Listener, get = class('Listener')

--[=[
@constructor __init
@param emitter Emitter
@param eventName string
@param callback function
@param? errorHandler function
@description TODO
]=]
function Listener:__init(emitter, eventName, callback, errorHandler)
	self._emitter = assert(emitter)
	self._eventName = checkType('string', eventName)
	self._callback = checkCallable(callback)
	self._errorHandler = errorHandler and checkCallable(errorHandler)
	self._enabled = true
end

--[=[
@method fire
@param ... any
@return nil
@description TODO
]=]
function Listener:fire(...)
	if self.errorHandler then
		local success, err = pcall(wrap(self.callback), ...)
		if not success then
			wrap(self.errorHandler)(err, ...)
		end
	else
		wrap(self.callback)(...)
	end
end

--[=[
@method unregister
@return nil
@description TODO
]=]
function Listener:unregister()
	return self.emitter:removeListener(self.eventName, self)
end

--[=[
@property emitter
@type Emitter
@description TODO
]=]
function get:emitter()
	return self._emitter
end

--[=[
@property eventName
@type string
@description TODO
]=]
function get:eventName()
	return self._eventName
end

--[=[
@property callback
@type function
@description TODO
]=]
function get:callback()
	return self._callback
end

--[=[
@property errorHandler
@type function,nil
@description TODO
]=]
function get:errorHandler()
	return self._errorHandler
end

--[=[
@property enabled
@type boolean
@description TODO
]=]
function get:enabled()
	return self._enabled
end

return Listener

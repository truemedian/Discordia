--[=[
@class VoiceRegion
@tag struct
@description https://discord.com/developers/docs/resources/voice#voice-region-object-voice-region-structure
]=]

local class = require('../class')

local VoiceRegion, get = class('VoiceRegion')

function VoiceRegion:__init(data)
	self._id = data.id
	self._name = data.name
	self._vip = data.vip
	self._optimal = data.optimal
	self._deprecated = data.deprecated
	self._custom = data.custom
end

--[=[
@property id
@type string
@description unique ID for the region
]=]
function get:id()
	return self._id
end

--[=[
@property id
@type string
@description name of the region
]=]
function get:name()
	return self._name
end

--[=[
@property id
@type boolean
@description true if this is a vip-only server
]=]
function get:vip()
	return self._vip
end

--[=[
@property id
@type boolean
@description true for a single server that is closest to the current user's client
]=]
function get:optimal()
	return self._optimal
end

--[=[
@property id
@type boolean
@description whether this is a deprecated voice region (avoid switching to these)
]=]
function get:deprecated()
	return self._deprecated
end

--[=[
@property id
@type boolean
@description whether this is a custom voice region (used for events/etc)
]=]
function get:custom()
	return self._custom
end

return VoiceRegion

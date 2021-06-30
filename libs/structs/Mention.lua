--[=[
@class Mention
@tag struct
@description TODO
]=]

local class = require('../class')

local Mention, get = class('Mention')

function Mention:__init(data)
	self._id = data.id -- user, channel, role, emoji
	self._type = data.type -- all
	self._raw = data.raw -- all
	self._animated = data.animated -- emoji
	self._name = data.name -- emoji
	self._timestamp = data.timestamp -- timestamp
	self._style = data.style -- timestamp
end

--[=[
@property id
@type string[Snowflake]
@description the id of this mention's target
]=]
function get:id()
	return self._id
end

--[=[
@property type
@type Enumeration#mentionType
@description this mention's type
]=]
function get:type()
	return self._type
end

--[=[
@property raw
@type string
@description this mention's raw string form
]=]
function get:raw()
	return self._raw
end

--[=[
@property raw
@type boolean,nil
@description whether this mention is animated or not (if emoji)
]=]
function get:animated()
	return self._animated
end

--[=[
@property name
@type string,nil
@description the name of the mentioned emoji (if emoji)
]=]
function get:name()
	return self._name
end

--[=[
@property timestamp
@type string,nil
@description unix timestamp (in seconds) that this mention refers to (if timestamp)
]=]
function get:timestamp()
	return self._timestamp
end

--[=[
@property style
@type Enumeration#timestampStyle,nil
@description the style of the timestamp (if timestamp)
]=]
function get:style()
	return self._style
end

return Mention

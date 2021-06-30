--[=[
@class ActivityEmoji
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-emoji
]=]

local class = require('../class')

local ActivityEmoji, get = class('ActivityEmoji')

function ActivityEmoji:__init(data)
	self._name = data.name
	self._id = data.id
	self._animated = data.animated
end

--[=[
@property name
@type string
@description the name of the emoji
]=]
function get:name()
	return self._name
end

--[=[
@property id
@type string[Snowflake],nil
@description the id of the emoji
]=]
function get:id()
	return self._id
end

--[=[
@property hash
@type string
@description TODO
]=]
function get:hash()
	if self._id then
		return self._name .. ':' .. self._id
	else
		return self._name
	end
end

--[=[
@property animated
@type boolean
@description whether this emoji is animated
]=]
function get:animated()
	return self._animated
end

return ActivityEmoji

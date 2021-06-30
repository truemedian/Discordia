--[=[
@class AuditLogOptions
@tag struct
@description https://discord.com/developers/docs/resources/emoji#emoji-object-emoji-structure
]=]

local class = require('../class')

local ReactionEmoji, get = class('ReactionEmoji')

function ReactionEmoji:__init(data)
	self._name = data.name
	self._id = data.id
	self._animated = data.animated
end

--[=[
@property name
@type string
@description emoji name
]=]
function get:name()
	return self._name
end

--[=[
@property id
@type string,nil
@description emoji id
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
@type boolean,nil
@description whether this emoji is animated
]=]
function get:animated()
	return self._animated
end

return ReactionEmoji

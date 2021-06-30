--[=[
@class ActivityParty
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-party
]=]

local class = require('../class')

local ActivityParty, get = class('ActivityParty')

function ActivityParty:__init(data)
	self._id = data.id
	self._current_size = data.size and data.size[1]
	self._max_size = data.size and data.size[2]
end

--[=[
@property id
@type string,nil
@description the id of the party
]=]
function get:id()
	return self._id
end

--[=[
@property currentSize
@type number,nil
@description used to show the party's current  size
]=]
function get:currentSize()
	return self._current_size
end

--[=[
@property maxSize
@type number,nil
@description used to show the party's maximum size
]=]
function get:maxSize()
	return self._max_size
end

return ActivityParty

--[=[
@class ActivityButton
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-buttons
]=]

local class = require('../class')

local ActivityButton, get = class('ActivityButton')

function ActivityButton:__init(data)
	self._label = data.label
	self._url = data.url
end

--[=[
@property label
@type string
@description the text shown on the button (1-32 characters)
]=]
function get:label()
	return self._label
end

--[=[
@property url
@type string
@description the url opened when clicking the button (1-512 characters)
]=]
function get:url()
	return self._url
end

return ActivityButton

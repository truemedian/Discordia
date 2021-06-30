--[=[
@class InteractionData
@tag struct
@description https://discord.com/developers/docs/interactions/slash-commands#interaction-object-application-command-interaction-data-structure
]=]

local InteractionOption = require('./InteractionOption')

local class = require('../class')
local helpers = require('../helpers')

local InteractionData, get = class('InteractionData')

function InteractionData:__init(data)
	self._id = data.id
	self._name = data.name
	self._resolved = nil -- TODO
	self._options = data.options and helpers.structs(InteractionOption, data.options)
	self._custom_id = data.custom_id
	self._component_type = data.component_type
end

--[=[
@property id
@type string[Snowflake]
@description the ID of the invoked command
]=]
function get:id()
	return self._id
end

--[=[
@property name
@type string
@description the name of the invoked command
]=]
function get:name()
	return self._name
end

--[=[
@property id
@type TODO,nil
@description converted users + roles + channels
]=]
function get:resolved()
	return self._resolved
end

--[=[
@property id
@type table[InteractionOption],nil
@description the params + values from the user
]=]
function get:options()
	return self._options
end

--[=[
@property customId
@type string
@description for components, the custom_id of the component
]=]
function get:customId()
	return self._custom_id
end

--[=[
@property componentType
@type number
@description for components, the type of the component
]=]
function get:componentType()
	return self._component_type
end

return InteractionData

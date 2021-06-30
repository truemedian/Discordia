--[=[
@class InteractionOption
@tag struct
@description https://discord.com/developers/docs/interactions/slash-commands#interaction-object-application-command-interaction-data-option-structure
]=]

local class = require('../class')
local helpers = require('../helpers')

local InteractionOption, get = class('InteractionOption')

function InteractionOption:__init(data)
	self._name = data.name
	self._type = data.type
	self._value = data.value
	self._options = data.options and helpers.structs(InteractionOption, data.options)
end

--[=[
@property name
@type string
@description the name of the parameter
]=]
function get:name()
	return self._name
end

--[=[
@property type
@type number
@description value of application command option type
]=]
function get:type()
	return self._type
end

--[=[
@property value
@type number
@description the value of the pair
]=]
function get:value()
	return self._value
end

--[=[
@property options
@type table[InteractionOption]
@description present if this option is a group or subcommand
]=]
function get:options()
	return self._options
end

return InteractionOption

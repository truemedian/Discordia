--[=[
@class CommandOption
@tag struct
@description https://discord.com/developers/docs/interactions/slash-commands#application-command-object-application-command-option-structure
]=]

local CommandChoice = require('./CommandChoice')

local class = require('../class')
local helpers = require('../helpers')

local CommandOption, get = class('CommandOption')

function CommandOption:__init(data)
	self._type = data.type
	self._name = data.name
	self._description = data.description
	self._required = data.required
	self._choices = data.choices and helpers.structs(CommandChoice, data.choices)
	self._options = data.options and helpers.structs(CommandOption, data.options)
end

--[=[
@property type
@type Enumerations#commandOptionType 
@description value of application command option type
]=]
function get:type()
	return self._type
end

--[=[
@property name
@type string 
@description 1-32 lowercase character name matching `^[\w-]{1,32}$`
]=]
function get:name()
	return self._name
end

--[=[
@property description
@type string 
@description 1-100 character description
]=]
function get:description()
	return self._description
end

--[=[
@property required
@type boolean 
@description if the parameter is required or optional
]=]
function get:required()
	return self._required or false
end

--[=[
@property choices
@type table[CommandChoice],nil 
@description choices for `string` and `int` types for the user to pick from
]=]
function get:choices()
	return self._choices
end

--[=[
@property options
@type table[CommandOption],nil 
@description if the option is a subcommand or subcommand group type, this nested options will be the parameters
]=]
function get:options()
	return self._options
end

return CommandOption

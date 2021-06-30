--[=[
@class CommandChoice
@tag struct
@description https://discord.com/developers/docs/interactions/slash-commands#application-command-object-application-command-option-choice-structure
]=]

local class = require('../class')

local CommandChoice, get = class('CommandChoice')

function CommandChoice:__init(data)
	self._name = data.name
	self._value = data.value
end

--[=[
@property name
@type string
@description 1-100 character choice name
]=]
function get:name()
	return self._name
end

--[=[
@property value
@type string,number
@description value of the choice, up to 100 characters if string
]=]
function get:value()
	return self._value
end

return CommandChoice

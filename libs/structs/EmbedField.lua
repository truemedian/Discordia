--[=[
@class EmbedField
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-field-structure
]=]

local class = require('../class')

local EmbedField, get = class('EmbedField')

function EmbedField:__init(data)
	self._name = data.name
	self._value = data.value
	self._inline = data.inline
end

--[=[
@property name
@type string
@description name of the field
]=]
function get:name()
	return self._name
end

--[=[
@property value
@type string
@description value of the field
]=]
function get:value()
	return self._value
end

--[=[
@property inline
@type boolean,nil
@description whether or not this field should display inline
]=]
function get:inline()
	return self._inline
end

return EmbedField

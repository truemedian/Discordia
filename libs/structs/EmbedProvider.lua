--[=[
@class EmbedProvider
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-provider-structure
]=]

local class = require('../class')

local EmbedProvider, get = class('EmbedProvider')

function EmbedProvider:__init(data)
	self._name = data.name
	self._url = data.url
end

--[=[
@property name
@type string,nil
@description name of provider
]=]
function get:name()
	return self._name
end

--[=[
@property url
@type string,nil
@description url of provider
]=]
function get:url()
	return self._url
end

return EmbedProvider

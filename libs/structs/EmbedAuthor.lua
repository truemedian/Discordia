--[=[
@class EmbedAuthor
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-author-structure
]=]

local class = require('../class')

local EmbedAuthor, get = class('EmbedAuthor')

function EmbedAuthor:__init(data)
	self._name = data.name
	self._url = data.url
	self._icon_url = data.icon_url
	self._proxy_icon_url = data.proxy_icon_url
end

--[=[
@property name
@type string,nil
@description name of author
]=]
function get:name()
	return self._name
end

--[=[
@property url
@type string,nil
@description url of author
]=]
function get:url()
	return self._url
end

--[=[
@property iconURL
@type string,nil
@description url of author icon (only supports http(s) and attachments)
]=]
function get:iconURL()
	return self._icon_url
end

--[=[
@property proxyIconURL
@type string,nil
@description a proxied url of author icon
]=]
function get:proxyIconURL()
	return self._proxy_icon_url
end

return EmbedAuthor

--[=[
@class EmbedFooter
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-footer-structure
]=]

local class = require('../class')

local EmbedFooter, get = class('EmbedFooter')

function EmbedFooter:__init(data)
	self._text = data.text
	self._icon_url = data.icon_url
	self._proxy_icon_url = data.proxy_icon_url
end

--[=[
@property text
@type string
@description footer text
]=]
function get:text()
	return self._text
end

--[=[
@property iconURL
@type string,nil
@description url of footer icon (only supports http(s) and attachments)
]=]
function get:iconURL()
	return self._icon_url
end

--[=[
@property proxyIconURL
@type string,nil
@description a proxied url of footer icon
]=]
function get:proxyIconURL()
	return self._proxy_icon_url
end

return EmbedFooter

--[=[
@class EmbedImage
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-image-structure
]=]

local class = require('../class')

local EmbedImage, get = class('EmbedImage')

function EmbedImage:__init(data)
	self._url = data.url
	self._proxy_url = data.proxy_url
	self._height = data.height
	self._width = data.width
end

--[=[
@property url
@type string,nil
@description source url of image (only supports http(s) and attachments)
]=]
function get:url()
	return self._url
end

--[=[
@property proxyURL
@type string,nil
@description a proxied url of the image
]=]
function get:proxyURL()
	return self._proxy_url
end

--[=[
@property height
@type number,nil
@description height of image
]=]
function get:height()
	return self._height
end

--[=[
@property width
@type number,nil
@description width of image
]=]
function get:width()
	return self._width
end

return EmbedImage

--[=[
@class EmbedVideo
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-video-structure
]=]

local class = require('../class')

local EmbedVideo, get = class('EmbedVideo')

function EmbedVideo:__init(data)
	self._url = data.url
	self._proxy_url = data.proxy_url
	self._height = data.height
	self._width = data.width
end

--[=[
@property url
@type string,nil
@description source url of video
]=]
function get:url()
	return self._url
end

--[=[
@property proxyURL
@type string,nil
@description a proxied url of the video
]=]
function get:proxyURL()
	return self._proxy_url
end

--[=[
@property height
@type number,nil
@description height of video
]=]
function get:height()
	return self._height
end

--[=[
@property width
@type number,nil
@description width of video
]=]
function get:width()
	return self._width
end

return EmbedVideo

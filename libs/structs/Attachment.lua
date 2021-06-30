--[=[
@class Attachment
@tag struct
@description https://discord.com/developers/docs/resources/channel#attachment-object-attachment-structure
]=]

local class = require('../class')

local Attachment, get = class('Attachment')

function Attachment:__init(data)
	self._id = data.id
	self._filename = data.filename
	self._content_type = data.content_type
	self._size = data.size
	self._url = data.url
	self._proxy_url = data.proxy_url
	self._height = data.height
	self._width = data.width
end

--[=[
@property id
@type string[Snowflake]
@description attachment id
]=]
function get:id()
	return self._id
end

--[=[
@property filename
@type string
@description name of file attached
]=]
function get:filename()
	return self._filename
end

--[=[
@property contentType
@type string,nil
@description the attachment's media type
]=]
function get:contentType()
	return self._content_type
end

--[=[
@property size
@type number
@description size of file in bytes
]=]
function get:size()
	return self._size
end

--[=[
@property url
@type string
@description source url of file
]=]
function get:url()
	return self._url
end

--[=[
@property proxyURL
@type string
@description a proxied url of file
]=]
function get:proxyURL()
	return self._proxy_url
end

--[=[
@property height
@type number,nil
@description height of file (if image)
]=]
function get:height()
	return self._height
end

--[=[
@property width
@type number,nil
@description width of file (if image)
]=]
function get:width()
	return self._width
end

return Attachment

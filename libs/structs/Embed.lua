--[=[
@class Embed
@tag struct
@description https://discord.com/developers/docs/resources/channel#embed-object-embed-structure
]=]

local class = require('../class')

local helpers = require('../helpers')

local EmbedFooter = require('./EmbedFooter')
local EmbedImage = require('./EmbedImage')
local EmbedThumbnail = require('./EmbedThumbnail')
local EmbedVideo = require('./EmbedVideo')
local EmbedProvider = require('./EmbedProvider')
local EmbedAuthor = require('./EmbedAuthor')
local EmbedField = require('./EmbedField')

local Embed, get = class('Embed')

function Embed:__init(data)

	self._title = data.title
	self._type = data.type
	self._description = data.description
	self._url = data.url
	self._timestamp = data.timestamp
	self._color = data.color

	self._footer = data.footer and EmbedFooter(data.footer)
	self._image = data.image and EmbedImage(data.image)
	self._thumbnail = data.thumbnail and EmbedThumbnail(data.thumbnail)
	self._video = data.video and EmbedVideo(data.video)
	self._provider = data.provider and EmbedProvider(data.provider)
	self._author = data.author and EmbedAuthor(data.author)

	self._fields = helpers.structs(EmbedField, data.fields)

end

--[=[
@property title
@type string,nil
@description title of embed
]=]
function get:title()
	return self._title
end

--[=[
@property type
@type Enumerations#embedType,nil
@description type of embed (always "rich" for webhook embeds)
]=]
function get:type()
	return self._type
end

--[=[
@property description
@type string,nil
@description description of embed
]=]
function get:description()
	return self._description
end

--[=[
@property url
@type string,nil
@description url of embed
]=]
function get:url()
	return self._url
end

--[=[
@property timestamp
@type string,nil
@description timestamp of embed content
]=]
function get:timestamp()
	return self._timestamp
end

--[=[
@property color
@type number,nil
@description color code of the embed
]=]
function get:color()
	return self._color
end

--[=[
@property footer
@type EmbedFooter,nil
@description footer information
]=]
function get:footer()
	return self._footer
end

--[=[
@property image
@type EmbedImage,nil
@description image information
]=]
function get:image()
	return self._image
end

--[=[
@property thumbnail
@type EmbedThumbnail,nil
@description thumbnail information
]=]
function get:thumbnail()
	return self._thumbnail
end

--[=[
@property video
@type EmbedVideo,nil
@description video information
]=]
function get:video()
	return self._video
end

--[=[
@property provider
@type EmbedProvider,nil
@description provider information
]=]
function get:provider()
	return self._provider
end

--[=[
@property author
@type EmbedAuthor,nil
@description author information
]=]
function get:author()
	return self._author
end

--[=[
@property fields
@type table[EmbedField],nil
@description fields information
]=]
function get:fields()
	return self._fields
end

return Embed

--[=[
@class ActivityAssets
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-assets
]=]

local class = require('../class')

local ActivityAssets, get = class('ActivityAssets')

function ActivityAssets:__init(data)
	self._large_image = data.large_image
	self._large_text = data.large_text
	self._small_image = data.small_image
	self._small_text = data.small_text
end

--[=[
@property largeImage
@type string,nil
@description the id for a large asset of the activity, usually a snowflake
]=]
function get:largeImage()
	return self._large_image
end

--[=[
@property largeText
@type string,nil
@description text displayed when hovering over the large image of the activity
]=]
function get:largeText()
	return self._large_text
end

--[=[
@property smallImage
@type string,nil
@description the id for a small asset of the activity, usually a snowflake
]=]
function get:smallImage()
	return self._small_image
end

--[=[
@property smallText
@type string,nil
@description text displayed when hovering over the small image of the activity
]=]
function get:smallText()
	return self._small_text
end


return ActivityAssets

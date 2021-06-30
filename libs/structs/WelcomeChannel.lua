--[=[
@class VoiceRegion
@tag struct
@description https://discord.com/developers/docs/resources/guild#welcome-screen-object-welcome-screen-channel-structure
]=]

local class = require('../class')

local WelcomeChannel, get = class('WelcomeChannel')

function WelcomeChannel:__init(data)
	self._channel_id = data.channel_id
	self._description = data.description
	self._emoji_id = data.emoji_id
	self._emoji_name = data.emoji_name
end

--[=[
@property channelId
@type string[Snowflake]
@description the channel's id
]=]
function get:channelId()
	return self._channel_id
end

--[=[
@property description
@type string
@description the description shown for the channel
]=]
function get:description()
	return self._description
end

--[=[
@property emojiId
@type string[Snowflake],nil
@description the emoji id, if the emoji is custom
]=]
function get:emojiId()
	return self._emoji_id
end

--[=[
@property emojiName
@type string,nil
@description the emoji name if custom, the unicode character if standard, or `nil` if no emoji is set
]=]
function get:emojiName()
	return self._emoji_name
end

return WelcomeChannel

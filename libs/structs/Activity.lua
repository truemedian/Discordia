--[=[
@class Activity
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-structure
]=]

local class = require('../class')
local helpers = require('../helpers')

local ActivityTimestamps = require('./ActivityTimestamps')
local ActivityEmoji = require('./ActivityEmoji')
local ActivityParty = require('./ActivityParty')
local ActivityAssets = require('./ActivityAssets')
local ActivitySecrets = require('./ActivitySecrets')
local ActivityButton = require('./ActivityButton')

local Activity, get = class('Activity')

function Activity:__init(data)
	self._name = data.name
	self._type = data.type
	self._url = data.url
	self._created_at = data.created_at
	self._application_id = data.application_id
	self._details = data.details
	self._state = data.state
	self._instance = data.instance
	self._flags = data.flags
	self._emoji = data.emoji and ActivityEmoji(data.emoji)
	self._party = data.party and ActivityParty(data.party)
	self._assets = data.assets and ActivityAssets(data.assets)
	self._secrets = data.secrets and ActivitySecrets(data.secrets)
	self._timestamps = data.timestamps and ActivityTimestamps(data.timestamps)
	self._buttons = helpers.structs(ActivityButton, data.buttons)
end

--[=[
@property name
@type string
@description the activity's name
]=]
function get:name()
	return self._name
end

--[=[
@property type
@type Enumerations#activityType
@description activity type
]=]
function get:type()
	return self._type
end

--[=[
@property url
@type string,nil
@description stream url, is validated when type is 1
]=]
function get:url()
	return self._url
end

--[=[
@property createdAt
@type number
@description unix timestamp (in milliseconds) of when the activity was added to the user's session
]=]
function get:createdAt()
	return self._created_at
end

--[=[
@property timestamps
@type ActivityTimestamps,nil
@description unix timestamps for start and/or end of the game
]=]
function get:timestamps()
	return self._timestamps
end

--[=[
@property applicationId
@type string[Snowflake],nil
@description application id for the game
]=]
function get:applicationId()
	return self._application_id
end

--[=[
@property details
@type string,nil
@description what the player is currently doing
]=]
function get:details()
	return self._details
end

--[=[
@property state
@type string,nil
@description the user's current party status
]=]
function get:state()
	return self._state
end

--[=[
@property emoji
@type ActivityEmoji,nil
@description the emoji used for a custom status
]=]
function get:emoji()
	return self._emoji
end

--[=[
@property party
@type ActivityParty,nil
@description information for the current party of the player
]=]
function get:party()
	return self._party
end

--[=[
@property assets
@type ActivityAssets,nil
@description images for the presence and their hover texts
]=]
function get:assets()
	return self._assets
end

--[=[
@property secrets
@type ActivitySecrets,nil
@description secrets for Rich Presence joining and spectating
]=]
function get:secrets()
	return self._secrets
end

--[=[
@property instance
@type boolean
@description whether or not the activity is an instanced game session
]=]
function get:instance()
	return self._instance
end

--[=[
@property flags
@type Enumerations#activityFlag,nil
@description activity flags `OR`d together, describes what the payload includes
]=]
function get:flags()
	return self._flags
end

--[=[
@property buttons
@type table[ActivityButton],nil
@description the custom buttons shown in the Rich Presence (max 2)
]=]
function get:buttons()
	return self._buttons
end

return Activity

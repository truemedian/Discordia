--[=[
@class MessageActivity
@tag struct
@description https://discord.com/developers/docs/resources/channel#message-object-message-activity-structure
]=]

local class = require('../class')

local MessageActivity, get = class('MessageActivity')

function MessageActivity:__init(data)
	self._type = data.type
	self._party_id = data.party_id
end

--[=[
@property type
@type Enumerations#messageActivityType
@description type of message activity
]=]
function get:type()
	return self._type
end

--[=[
@property partyId
@type string,nil
@description partyId from a Rich Presence event
]=]
function get:partyId()
	return self._party_id
end

return MessageActivity

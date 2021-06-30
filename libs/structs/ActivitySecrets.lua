--[=[
@class ActivitySecrets
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-secrets
]=]

local class = require('../class')

local ActivitySecrets, get = class('ActivitySecrets')

function ActivitySecrets:__init(data)
	self._join = data.join
	self._spectate = data.spectate
	self._match = data.match
end

--[=[
@property join
@type string,nil
@description the secret for joining a party
]=]
function get:join()
	return self._join
end

--[=[
@property spectate
@type string,nil
@description the secret for spectating a game
]=]
function get:spectate()
	return self._spectate
end

--[=[
@property match
@type string,nil
@description the secret for a specific instanced match
]=]
function get:match()
	return self._match
end

return ActivitySecrets

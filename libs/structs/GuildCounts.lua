--[=[
@class GuildCounts
@tag struct
@description https://discord.com/developers/docs/resources/guild#guild-object-guild-structure
]=]

local class = require('../class')

local GuildCounts, get = class('GuildCounts')

function GuildCounts:__init(data)
	self._max_members = data.max_members
	self._max_presences = data.max_presences
	self._approximate_member_count = data.approximate_member_count
	self._approximate_presence_count = data.approximate_presence_count
end

--[=[
@property maxMembers
@type number,nil
@description the maximum number of members for the guild
]=]
function get:maxMembers()
	return self._max_members
end

--[=[
@property maxPresences
@type number,nil
@description the maximum number of presences for the guild (`nil` is always returned, apart from the largest of guilds)
]=]
function get:maxPresences()
	return self._max_presences
end

--[=[
@property approximateMemberCount
@type number,nil
@description approximate number of members in this guild
]=]
function get:approximateMemberCount()
	return self._approximate_member_count
end

--[=[
@property approximatePresenceCount
@type number,nil
@description approximate number of non-offline members in this guild
]=]
function get:approximatePresenceCount()
	return self._approximate_presence_count
end

return GuildCounts

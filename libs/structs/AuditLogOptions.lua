--[=[
@class AuditLogOptions
@tag struct
@description https://discord.com/developers/docs/resources/audit-log#audit-log-entry-object-optional-audit-entry-info
]=]

local class = require('../class')

local AuditLogOptions, get = class('AuditLogOptions')

function AuditLogOptions:__init(data)
	self._delete_member_days = data.delete_member_days
	self._members_removed = data.members_removed
	self._channel_id = data.channel_id
	self._message_id = data.message_id
	self._count = data.count
	self._id = data.id
	self._type = tonumber(data.type) -- thanks discord
	self._role_name = data.role_name
end

--[=[
@property deleteMemberDays
@type string,nil
@description number of days after which inactive members were kicked
]=]
function get:deleteMemberDays()
	return self._delete_member_days
end

--[=[
@property membersRemoved
@type string,nil
@description number of members removed by the prune
]=]
function get:membersRemoved()
	return self._members_removed
end

--[=[
@property channelId
@type string[Snowflake],nil
@description channel in which the entities were targeted
]=]
function get:channelId()
	return self._channel_id
end

--[=[
@property messageId
@type string[Snowflake],nil
@description id of the message that was targeted
]=]
function get:messageId()
	return self._message_id
end

--[=[
@property count
@type string,nil
@description number of entities that were targeted
]=]
function get:count()
	return self._count
end

--[=[
@property id
@type string[Snowflake],nil
@description id of the overwritten entity
]=]
function get:id()
	return self._id
end

--[=[
@property type
@type number,nil
@description type of overwritten entity - 0 for "role" or 1 for "member"
]=]
function get:type()
	return self._type
end

--[=[
@property roleName
@type string,nil
@description name of the role if type is "0" (not present if type is "1")
]=]
function get:roleName()
	return self._role_name
end

return AuditLogOptions

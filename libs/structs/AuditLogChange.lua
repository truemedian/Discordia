--[=[
@class AuditLogChange
@tag struct
@description https://discord.com/developers/docs/resources/audit-log#audit-log-change-object-audit-log-change-structure
]=]

local class = require('../class')

local AuditLogChange, get = class('AuditLogChange')

function AuditLogChange:__init(data)
	self._old_value = data.old_value
	self._new_value = data.new_value
	self._key = data._key
end

--[=[
@property old
@type any,nil
@description old value of the key
]=]
function get:old()
	return self._old_value
end

--[=[
@property new
@type any,nil
@description new value of the key
]=]
function get:new()
	return self._new_value
end

--[=[
@property key
@type string
@description name of audit log change key
]=]
function get:key()
	return self._key
end

return AuditLogChange

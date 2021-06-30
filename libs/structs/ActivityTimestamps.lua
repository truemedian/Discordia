--[=[
@class ActivityTimestamps
@tag struct
@description https://discord.com/developers/docs/topics/gateway#activity-object-activity-timestamps
]=]

local class = require('../class')

local ActivityTimestamps, get = class('ActivityTimestamps')

function ActivityTimestamps:__init(data)
	self._start = data.start
	self._stop = data['end'] -- thanks discord
end

--[=[
@property start
@type number,nil
@description unix time (in milliseconds) of when the activity started
]=]
function get:start()
	return self._start
end

--[=[
@property stop
@type number,nil
@description unix time (in milliseconds) of when the activity ends
]=]
function get:stop()
	return self._stop
end

return ActivityTimestamps

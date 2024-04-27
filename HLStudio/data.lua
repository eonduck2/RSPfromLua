-- 타이머 클래스
Timer = { valid = false, timer = 0}
function Timer:Init()
	self.valid = false
	self.timer = 0
end

function Timer:IsValid()
	return self.valid
end

function Timer:Start(duration)
	self.valid = true
	self.timer = Game.GetTime() + duration
end

function Timer:IsElapsed()
	
	if self.valid == false then 
		return false 
	end

	return self.timer < Game.GetTime()
end

function Timer:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
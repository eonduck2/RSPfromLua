--Game.Lua
Game.Rule.name = "HEADLine mode"
Game.Rule.desc = "에임향상을 위한 맵"
Game.Rule.respawnable = false
Game.Rule.enemyfire = true
Game.Rule.friendlyfire = false
Game.Rule.breakable = false

akm = Common.GetWeaponOption (Common.WEAPON.AKM)
AK = Common.GetWeaponOption (Common.WEAPON.AK47)
akm:SetBulletColor ({r=0,g=0,b=255})
AK:SetBulletColor ({r=255,g=0,b=0})
Common.SetMuzzleScale (0.01)


--상수
STATE = {
    READY = 1,
    PLAYING = 2,
    END = 3,
    DEAD = 4
}
readytime = 10

--변수
state = STATE.READY

--클라이언트로 동기화되는 변수
scoreCT = Game.SyncValue.Create ('scoreCT')
scoreTR = Game.SyncValue.Create ('scoreTR')
scoreGoal = Game.SyncValue.Create ('scoreGoal')

scoreCT.value = 0
scoreTR.value = 0
scoreGoal.value = 5


--테이블
players = {}

for i=1,32 do
    players[i] = nil
end


function NumAlive() --생존 확인
    local numCT = 0
    local numTR = 0
    for i,p in pairs(players) do
        if (p ~= nil and p.user.state == STATE.PLAYING) then
            if p.team == Game.TEAM.CT then
                numCT = numCT + 1
            elseif p.team == Game.TEAM.TR then
                numTR = numTR + 1
            end
        end
    end

    return numCT,numTR
end


function CheckWin() -- 승리 조건
    local numCT,numTR = NumAlive()

    if (numCT == 0 and numTR > 0) then
        scoreTR.value = scoreTR.value + 1
        local isEnd = (scoreTR.value == scoreGoal.value)
        Game.Rule:Win (Game.TEAM.TR, isEnd)
        state = STATE.END
    end

    if (numCT > 0 and numTR == 0) then
        scoreCT.value = scoreCT.value + 1
        local isEnd = (scoreCT.value == scoreGoal.value)
        Game.Rule:Win (Game.TEAM.CT, isEnd)
        state = STATE.END
    end

    if (numCT == 0 and numTR == 0) then
        local isEnd = false
        Game.Rule:Win (Game.TEAM.SPECTATOR, isEnd)
        state = STATE.END
    end
end


function Game.Rule:OnPlayerConnect (player)
    players[player.index] = player
    player.user.state = STATE.DEAD
end


function Game.Rule:OnPlayerDisconnect (player)
    players[player.index] = nil
end


ReadyTimer = Timer:new()
function Game.Rule:OnRoundStart ()
    Game.Weapon:CreateAndDrop (Common.WEAPON.AK47, {x=191,y=-192,z=85})
    Game.Weapon:CreateAndDrop (Common.WEAPON.AK47, {x=191,y=-192,z=85})
    for i,p in pairs(players) do
        if p ~= nil then
            p.user.state = STATE.PLAYING
        end
    end
    state = STATE.PLAYING
    ReadyTimer:Init()
    ReadyTimer:Start(readytime)
end


function Game.Rule:OnPlayerJoiningSpawn (player)
    if ReadyTimer:IsElapsed() ~= true then
        player.user.state = STATE.PLAYING
    else
        player:Kill()
        player.user.state = STATE.DEAD
    end
end

function Game.Rule:OnPlayerSpawn (player)
    if player.team == Game.TEAM.CT then
        player.model = Game.MODEL.SEAL
    elseif player.team == Game.TEAM.TR then
        player.model = Game.MODEL.MILITIA
    end
    player.health = 40
    player.maxhealth = 40
end


function Game.Rule:OnPlayerAttack (victim, attacker, damage, weapontype, hitbox)
    if attacker == nil then return 0 end

    if attacker ~= nil then
        if weapontype == Game.WEAPONTYPE.KNIFE then
            victim.flinch = 0
            victim.knockback = 0
            Common.SetBloodScale (0.01)
            return 0
        end

        if hitbox ~= Game.HITBOX.HEAD then
            victim.flinch = 0
            victim.knockback = 0
            Common.SetBloodScale (0.01)
            return 0
        else
            Common.SetBloodScale (3)
        end
    end
end

function Game.Rule:OnPlayerKilled (victim, killer, weapontype, hitbox)
    victim.user.state = STATE.DEAD
end


function Game.Rule:OnUpdate (time)
    if state == STATE.PLAYING then
        CheckWin()
    end
end


function Game.Rule:OnGetWeapon (player, weaponid, weapon)
    if weapon == nil then return end

    weapon.infiniteclip = true
end
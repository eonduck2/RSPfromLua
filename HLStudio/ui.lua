--UI.Lua


--서버와 자동으로 동기화되는 변수
scoreCT = UI.SyncValue.Create ('scoreCT')
scoreTR = UI.SyncValue.Create ('scoreTR')
scoreGoal = UI.SyncValue.Create ('scoreGoal')

-- 점수판 생성
screen = UI.ScreenSize()
center = {x = screen.width / 2, y = screen.height / 2}

scoreBG = UI.Box.Create()
scoreBG:Set({x = center.x - 135, y = 5, width = 270, height = 50, r = 10, g = 10, b = 10, a = 180})

goalBG = UI.Box.Create()
goalBG:Set({x = center.x - 35, y = 5, width = 70, height = 50, r = 0, g = 0, b = 0, a = 180})

goalLabel = UI.Text.Create()
goalLabel:Set({text='00', font='medium', align='center', x = center.x - 50, y = 17, width = 100, height = 50, r = 255, g = 255, b = 255})

ctLabel = UI.Text.Create()
ctLabel:Set({text='00', font='large', align='left', x = center.x - 127, y = 18, width = 100, height = 50, r = 100, g = 100, b = 255})

trLabel = UI.Text.Create()
trLabel:Set({text='00', font='large', align='right', x = center.x + 26, y = 18, width = 100, height = 50, r = 255, g = 80, b = 80})

-- 변수 동기화 될 때마다 스코어보드 업데이트 해준다
function scoreCT:OnSync()
    local str = string.format("%02d", self.value)
    ctLabel:Set({text = str})
end

function scoreTR:OnSync()
    local str = string.format("%02d", self.value)
    trLabel:Set({text = str})
end

function scoreGoal:OnSync()
    local str = string.format("%02d", self.value)
    goalLabel:Set({text = str})
end
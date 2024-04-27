function SetRound()
    print("")
    print("Set round, you can choose only odd number")
    round = io.read("*n")
    while (round % 2) ~= 1 do
        print("Enter odd number")
        round = io.read("*n")
    end
    print("Set round Complete")
    print("")
end

function RSPGame()
    local Player = 0
    local Com = 0
    while Player <= (round / 2) and Com <= (round / 2) do
        print("Rock = 1, Scissor = 2, Paper = 3, enter sth to win")
        PlayerRSP = io.read("*n")
        math.randomseed(os.time())
        ComRSP = (math.random(1000+PlayerRSP, 1005 * PlayerRSP) % 3 + 1)
        if PlayerRSP > 3 or PlayerRSP < 1 then
            print("Enter valid number")
        elseif PlayerRSP == ComRSP then
            print("Draw")
        elseif PlayerRSP == 1 and ComRSP == 2 then
            print("Player Win!")
            print("Com : Scissor")
            Player = Player + 1
        elseif PlayerRSP == 1 and ComRSP == 3 then
            print("Com Win!")
            print("Com : Paper")
            Com = Com + 1
        elseif PlayerRSP == 2 and ComRSP == 1 then
            print("Com Win!")
            print("Com : Rock")
            Com = Com + 1
        elseif PlayerRSP == 2 and ComRSP == 3 then
            print("Player Win!")
            print("Com : Paper")
            Player = Player + 1
        elseif PlayerRSP == 3 and ComRSP == 1 then
            print("Player Win!")
            print("Com : Rock")
            Player = Player + 1
        elseif PlayerRSP == 3 and ComRSP == 2 then
            print("Com Win!")
            print("Com : Scissor")
            Com = Com + 1
        end
        print("Player :"..Player.." / Com :"..Com.."")
    end
    if Player > Com then
        print("Player Win this Round")
    elseif Com > Player then
        print("Com Win this Round")
    end
end

function FinishGame()
    print("Continue? (If you want to stop, enter 27)")
    StopNum = io.read("*n")
    if StopNum == 27 then
        StopVariable = 1
    end
end

print("Rock Scissors Paper, Made by hiuaa")

StopVariable = 0
PlayerWin = 0
ComWin = 0
while StopVariable do
    SetRound()

    RSPGame()

    FinishGame()

    if StopVariable == 1 then
        break
    end
end
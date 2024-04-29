-- 시간 딜레이 함수
function sleep_ms(ms)
    local t = os.clock()
    local ms = ms / 1000
    while os.clock() - t <= ms do
    end
end

-- 게임 시작
function startGame()
		
	playingTable = {
		
		round = 0;
		player = 0;
		com = 0;
		
	}
	print("라운드를 선택해주세요(현재 단판만 가능 '1'입력)")
	
	playingTable.round = io.read("*n")
	setGame(playingTable)
end

-- 라운드 세팅
function setGame(playingTable)

	if playingTable.round == 1 then
		print("단판 세팅")
		print("")
		playerSetting(playingTable)
		
		else
		print("error: 유효한 값을 입력해주세요.")
	end
end

function playerSetting(playingTable)
	
	firstAttack = math.random(2)
	
	
		
	play(playingTable,firstAttack)
	
end

-- todo, 차례 지정 -> play()

function play(playingTable, firstAttack)


	if firstAttack == 1 then
		print("당신의 턴입니다. 공격 방향을 선택해주세요")
		print("1 = 왼쪽, 2 = 가운데, 3 = 오른쪽")
		playingTable.player = io.read("*n")
		
		elseif firstAttack == 2 then
		print("상대의 턴입니다. 피할 방향을 선택해주세요")
		print("1 = 왼쪽, 2 = 가운데, 3 = 오른쪽")
		playingTable.player = io.read("*n")
	end
		
			playingTable.com = math.random(3)
		
			print("--------------------------")
			print("참...")
			print("--------------------------")
			
			sleep_ms(800)

			print("--------------------------")
			print("참...")
			print("--------------------------")
			
			sleep_ms(2000)
			
			print("--------------------------")
			print("참...")
			print("--------------------------")
			
		if playingTable.player == 1 then
		
			print("당신은 왼쪽을 선택했습니다.")
			
			elseif playingTable.player == 2 then
			
			print("당신은 가운데를 선택했습니다.")
			
			elseif playingTable.player == 3 then
			
			print("당신은 오른쪽을 선택했습니다.")
			
		end
			
			
		if playingTable.com == 1 then
		
			print("상대방은 왼쪽을 선택했습니다.")
			print("")
			
			elseif playingTable.com == 2 then
			
			print("상대방은 가운데를 선택했습니다.")
			print("")
			
			elseif playingTable.com == 3 then
			
			print("상대방은 오른쪽을 선택했습니다.")
			print("")
			
		end
		
		if firstAttack == 1 then 
		
			if playingTable.player == playingTable.com then
		
				print("당신의 승리입니다 !")
			
				elseif playingTable.player ~= playingTable.com then
				print("상대방이 잘 피했네요")
				print("")
				firstAttack = 2
				play(playingTable, firstAttack)
			end
		
		end
		
		
		if firstAttack == 2 then 
		
			if playingTable.player == playingTable.com then
		
				print("당신의 패배입니다 . . .")
			
				elseif playingTable.player ~= playingTable.com then
				print("피했습니다 !")
				print("")
				firstAttack = 1
				play(playingTable, firstAttack)
			end
		
		end

end

startGame()
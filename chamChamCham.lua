-- �ð� ������ �Լ�
function sleep_ms(ms)
    local t = os.clock()
    local ms = ms / 1000
    while os.clock() - t <= ms do
    end
end

-- ���� ����
function startGame()
		
	playingTable = {
		
		round = 0;
		player = 0;
		com = 0;
		
	}
	print("���带 �������ּ���(���� ���Ǹ� ���� '1'�Է�)")
	
	playingTable.round = io.read("*n")
	setGame(playingTable)
end

-- ���� ����
function setGame(playingTable)

	if playingTable.round == 1 then
		print("���� ����")
		print("")
		playerSetting(playingTable)
		
		else
		print("error: ��ȿ�� ���� �Է����ּ���.")
	end
end

function playerSetting(playingTable)
	
	firstAttack = math.random(2)
	
	
		
	play(playingTable,firstAttack)
	
end

-- todo, ���� ���� -> play()

function play(playingTable, firstAttack)


	if firstAttack == 1 then
		print("����� ���Դϴ�. ���� ������ �������ּ���")
		print("1 = ����, 2 = ���, 3 = ������")
		playingTable.player = io.read("*n")
		
		elseif firstAttack == 2 then
		print("����� ���Դϴ�. ���� ������ �������ּ���")
		print("1 = ����, 2 = ���, 3 = ������")
		playingTable.player = io.read("*n")
	end
		
			playingTable.com = math.random(3)
		
			print("--------------------------")
			print("��...")
			print("--------------------------")
			
			sleep_ms(800)

			print("--------------------------")
			print("��...")
			print("--------------------------")
			
			sleep_ms(2000)
			
			print("--------------------------")
			print("��...")
			print("--------------------------")
			
		if playingTable.player == 1 then
		
			print("����� ������ �����߽��ϴ�.")
			
			elseif playingTable.player == 2 then
			
			print("����� ����� �����߽��ϴ�.")
			
			elseif playingTable.player == 3 then
			
			print("����� �������� �����߽��ϴ�.")
			
		end
			
			
		if playingTable.com == 1 then
		
			print("������ ������ �����߽��ϴ�.")
			print("")
			
			elseif playingTable.com == 2 then
			
			print("������ ����� �����߽��ϴ�.")
			print("")
			
			elseif playingTable.com == 3 then
			
			print("������ �������� �����߽��ϴ�.")
			print("")
			
		end
		
		if firstAttack == 1 then 
		
			if playingTable.player == playingTable.com then
		
				print("����� �¸��Դϴ� !")
			
				elseif playingTable.player ~= playingTable.com then
				print("������ �� ���߳׿�")
				print("")
				firstAttack = 2
				play(playingTable, firstAttack)
			end
		
		end
		
		
		if firstAttack == 2 then 
		
			if playingTable.player == playingTable.com then
		
				print("����� �й��Դϴ� . . .")
			
				elseif playingTable.player ~= playingTable.com then
				print("���߽��ϴ� !")
				print("")
				firstAttack = 1
				play(playingTable, firstAttack)
			end
		
		end

end

startGame()
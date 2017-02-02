local timer = false

function spawn()
	spawnPlayer(source, -2246, 2372, 5);
	setPlayerMoney(source, 1000)
	giveWeapon(source, 22, 34)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	showChat(source, true)
end

function hackATM(player, atm)
	local playerx, playery, playerz = getElementPosition(player)
	local atms = getElementsByType("marker")

	local win = math.random(500, 2500)

	for i, v in pairs(atms) do
		local posx = getElementData(v, "posX")
		local posy = getElementData(v, "posY")
		local size = getElementData(v, "size")

		if (playerx < posx + size and playerx > posx - size and playery < posy + size and playery > posy - size and timer == false) then
			outputChatBox("Hacked and earned: "..win.."$", player)
			givePlayerMoney(player, win)

			setTimer(function()
				outputChatBox("ATM's hackable again!")
				timer = false
			end ,15000,1)

			timer = true;
		end
	end
end

addEventHandler("onPlayerJoin", root, spawn)

addCommandHandler("hack", hackATM)

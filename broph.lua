function spawn()
	spawnPlayer(source, -2246, 2372, 5);
	setPlayerMoney(source, 1000)
	giveWeapon(source, 22, 34)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	showChat(source, true)
end

function createMap()
	atm1 = createObject(2942 , -2246, 2370, 5)
end

function hackATM()
	local playerx, playery, playerz = getElementPosition(getRootElement())
	local atmx, atmy, atmz = getElementPosition(atm1)

	if (playerx <= atmx + 5 and playerx <= atmx - 5) then
			outputChatBox("Hackable!")
			givePlayerMoney(getRootElement(), 500)
		else
			outputChatBox("not Hackable!!!")
	end
end


addEventHandler("onResourceStart", root, createMap)
addEventHandler("onPlayerJoin", root, spawn)

addEventHandler("onPlayerWasted", root,
	function()
		setTimer(spawn, 1800, 1, source)
	end
)

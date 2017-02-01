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

function hackATM(player, atm)
	local playerx, playery, playerz = getElementPosition(player)
	local atmx, atmy, atmz = getElementPosition(atm1)
	local win = math.random(500, 2500)
	if (playerx < atmx + 2.5 and playerx > atmx - 2.5 and playery < atmy + 2.5 and playery > atmy - 2.5) then
			outputChatBox("Hacked and earned: "..win.."$", player)
			givePlayerMoney(player, win)
		else
			outputChatBox("no ATM nearby", player)
	end
end

addEventHandler("onResourceStart", root, createMap)
addEventHandler("onPlayerJoin", root, spawn)

addEventHandler("onPlayerWasted", root,
	function()
		setTimer(spawn, 1800, 1, source)
	end
)

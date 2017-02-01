function spawn()
	spawnPlayer(source, -2246, 2372, 5);
	setPlayerMoney(source, 1000)
	giveWeapon(source, 22, 34)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	showChat(source, true)
end

function createMap()
	createObject(2942 , -2246, 2370, 5)
end

addEventHandler("onResourceStart", root, createMap)
addEventHandler("onPlayerJoin", root, spawn)

addEventHandler("onPlayerWasted", root,
	function()
		setTimer(spawn, 1800, 1, source)
	end
)

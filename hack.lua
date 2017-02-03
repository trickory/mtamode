local timer = false                                                             -- variable to check if timer is running (cooldown for atm's)

function spawn()
	spawnPlayer(source, -2246, 2372, 5);
	setPlayerMoney(source, 1000)
	giveWeapon(source, 22, 34)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	showChat(source, true)
end

function hackATM(player, atm)
	local playerx, playery, playerz = getElementPosition(player)                  -- player coordinates
	local atms = getElementsByType("marker")                                      -- array of all markers in hack.map

	local win = math.random(500, 2500)

	for i, v in pairs(atms) do                                                    -- for loop to check if player pos matches one of the atms pos
		local posx = getElementData(v, "posX")                                      -- get "PosX" of the arraypos v
		local posy = getElementData(v, "posY")                                      -- get "PosY" of the arraypos v
		local size = getElementData(v, "size")                                      -- get "size" of the arraypos v

    local pos1, pos2 = playerx < posx + size, playerx > posx - size             -- comparing x-coordinates
    local pos3, pos4 = playery < posy + size, playery > posy - size             -- comparing y-coordinates

		if (pos1 and pos2 and pos3 and pos4 and timer == false) then                -- if comparisons are true and timer isnt running, proceed
			outputChatBox("Hacked and earned: "..win.."$", player)                    -- chatbox output of money earned to player only
			givePlayerMoney(player, win)                                              -- gives won amount to player
			setTimer(                                                                 --[[ starts a timer to run for 15 seconds and sets timer to false afterwards ]]--
      			function()
				outputChatBox("ATM's hackable again!")
				timer = false;
			end ,15000,1)
			timer = true                                                              -- sets timer to true after timer has started
		end
	end
end

addEventHandler("onPlayerJoin", root, spawn)

addCommandHandler("hack", hackATM)

addEventHandler("onPlayerWasted", root)

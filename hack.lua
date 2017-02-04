local timer = false                                                             -- variable to check if timer is running (cooldown for atm's)

function spawn()
	spawnPlayer(source, -2246, 2372, 5)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	showChat(source, true)
end

function hackATM(player, atm)
	local playerx, playery, playerz = getElementPosition(player)                  -- player coordinates
	local atms = getElementsByType("marker")                                      -- array of all markers in hack.map

	local win = math.random(500, 2500)

	for i, v in pairs(atms) do                                                     --// for-loop to check        \\--
		local posx = getElementData(v, "posX")                                       --|| if players pos matches   ||--
		local posy = getElementData(v, "posY")                                       --\\ with one of the atms pos //--
		local size = getElementData(v, "size")

    local pos1, pos2 = playerx < posx + size, playerx > posx - size			-- comparing x-coordinates
    local pos3, pos4 = playery < posy + size, playery > posy - size			-- comparing y-coordinates

		if (pos1 and pos2 and pos3 and pos4 and timer == false) then		-- if comparisons are true and timer isnt running, proceed
			outputChatBox("Hacked and earned: "..win.."$", player)		-- chatbox output of money earned to player only
			givePlayerMoney(player, win)					-- gives won amount to player

			setTimer(function()						--[[ starts a timer to run for 15 seconds and sets timer to false afterwards ]]--
				outputChatBox("ATM's hackable again!")
				timer = false;
			end ,15000,1)

			timer = true							 -- sets timer to true after timer has started
		end
	end
end

local register = false

function registerPlayer ( source, commandName, name, password )
	if ( password ~= "" and password ~= nil and register == false) then
		local accountAdded = addAccount( name, password )
		if ( accountAdded ) then
			outputChatBox ( "Thank you " .. getPlayerName(source) .. ", you're now registed, you can login with /login", source )
			register = true
			exports.inventory:addPlayerItem(source, "SilencedPistol")
			exports.inventory:addPlayerItem(source, "PistolM")
		else
			outputChatBox ( "Error creating account, contact the server admin", source )
		end
	else
		outputChatBox ("Error creating account, correct syntax: /register <loginname> <password>", source )
	end
end

function onPlayerLog(_, acc)
	if (acc) then
		local moneylog = getAccountData(acc, "playercash")
		if (moneylog) then
			setPlayerMoney(source, moneylog)
		end
	end
end

function onPlayerLogO()
	setPlayerMoney(source, 0)
end

function onPlayerQ()
	local acc = getPlayerAccount(source)
	if (acc) and not isGuestAccount(acc) then
		local money = getPlayerMoney(source)
		setAccountData(acc, "playercash", money)
	end
end

addEventHandler("onPlayerLogin" , root, onPlayerLog)
addEventHandler("onPlayerQuit", root, onPlayerQ)
addEventHandler("onPlayerLogout", root, onPlayerLogO)

addEventHandler("onPlayerJoin", root, spawn)

addCommandHandler("hack", hackATM)
addCommandHandler ("reg", registerPlayer)

addEventHandler("onPlayerWasted", root,
	function()
		setTimer(spawn, 1800, 1, source)
	end
)

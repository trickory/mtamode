pc = {
    window = {},
    power = {},
    tab = {},
    label = {},
    input = {},
    terminal = {}
}

local string = ""
local test = 0
local pow = 0
local i = 2
local height = 30

function power()
  if (pow == 0 and test == 0) then
    string = ""
    time = math.random(100, 250)
    guiSetProperty(pc.label[1], "Text", string)
    setTimer(boot, time, 10)
    pow = 2
  elseif (pow == 1) then
    guiSetProperty(pc.label[1], "Text", "Shutting down")
    pow = 0
    test = 0
  end
end

function boot()
  string = string.."."
  if (test > 8) then
    pow = 1
    string = "System booted"
  end
  guiSetProperty(pc.label[1], "Text", string)
  test = test + 1
end

function inp()
  local text = guiGetText(pc.input[1])
  if (text ~= "") then
    pc.label[i] = guiCreateLabel(14, height, 517, 15, text, false, pc.tab[1])
    i = i + 1
    height = height + 15
    guiSetText(pc.input[1], "")
  end
  if (height > 271) then
    height = 30
    i = 2
    for u=2,18 do
      guiSetProperty(pc.label[u], "Text", "")
    end
  end
end

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        pc.window[1] = guiCreateWindow(408, 248, 571, 380, "", false)
        guiWindowSetSizable(pc.window[1], false)

        pc.power[1] = guiCreateButton(511, 26, 50, 29, "power", false, pc.window[1])
        guiSetProperty(pc.power[1], "Text", "power")
        pc.terminal[1] = guiCreateTabPanel(10, 36, 580, 333, false, pc.window[1])
        guiSetProperty(pc.terminal[1], "Text", "Terminal")

        pc.tab[1] = guiCreateTab("Terminal", pc.terminal[1])

        pc.input[1] = guiCreateEdit(4, 282, 543, 22, "", false, pc.tab[1])

        pc.label[1] = guiCreateLabel(14, 14, 517, 15, "", false, pc.tab[1])
        guiSetProperty(pc.label[1], "Text", "")
        guiLabelSetColor(pc.label[1], 255, 255, 255)

        addEventHandler("onClientGUIClick", pc.power[1], power)
        addEventHandler("onClientGUIAccepted", pc.input[1], inp)
    end
)
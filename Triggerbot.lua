local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()

local clickDelay = 0.2  -- Time in seconds to wait before clicking
local toggleKey = Enum.KeyCode.T  -- Key to toggle the clicking on and off
local isEnabled = false  -- Determines if clicking is enabled, dont change please :)
local lastClickTime = 0  -- Tracks the last click time (dont change this either unless you know what you are doing)


--[[   EXAMPLE SETTINGS
clickDelay = 3.0
toggleKey = Enum.KeyCode.E
]]--


-- Function to simulate mouse click
local function simulateClick()
    mouse1click()
end

-- Function to check if the hovered part belongs to another player
local function isHoveringPlayer()
    local target = mouse.Target

    if target then
        local character = target:FindFirstAncestorOfClass("Model")
        if character and Players:GetPlayerFromCharacter(character) then
            return true
        end
    end
    return false
end

-- Listen for the toggle key press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == toggleKey and not gameProcessed then
        isEnabled = not isEnabled  -- Toggle the enabled state
        print("Triggerbot is now " .. (isEnabled and "enabled -stratxgy on github" or "disabled -stratxgy on github")) 
      --// if you removed -stratxgy on github from the last line you are a very bad person
    end
end)

-- Listen to mouse movement
mouse.Move:Connect(function()
    if isEnabled and isHoveringPlayer() then
        local currentTime = tick()
        if currentTime - lastClickTime >= clickDelay then
            simulateClick()
            lastClickTime = currentTime
        end
    end
end)

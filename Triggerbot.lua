-- Check if the script is already loaded
if getgenv().triggerbotLoaded then
    print("Triggerbot is already loaded.")
    return
end

-- Mark the script as loaded
getgenv().triggerbotLoaded = true

-- Script starts here
getgenv().triggerbot = {
    Settings = {
        isEnabled = false,  -- Determines if clicking is enabled
        clickDelay = 0.5,   -- Time in seconds to wait before clicking
        toggleKey = Enum.KeyCode.T,  -- Key to toggle the clicking on and off
        lastClickTime = 0   -- Tracks the last click time
    }
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()

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
    if input.KeyCode == getgenv().triggerbot.Settings.toggleKey and not gameProcessed then
        getgenv().triggerbot.Settings.isEnabled = not getgenv().triggerbot.Settings.isEnabled
        print("Triggerbot is now " .. (getgenv().triggerbot.Settings.isEnabled and "enabled -stratxgy on github" or "disabled -stratxgy on github"))
    end
end)

-- Listen to mouse movement
mouse.Move:Connect(function()
    if getgenv().triggerbot.Settings.isEnabled and isHoveringPlayer() then
        local currentTime = tick()
        if currentTime - getgenv().triggerbot.Settings.lastClickTime >= getgenv().triggerbot.Settings.clickDelay then
            simulateClick()
            getgenv().triggerbot.Settings.lastClickTime = currentTime
        end
    end
end)

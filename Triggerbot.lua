-- Prevent duplicate loading
if getgenv().triggerbotLoaded then return end
getgenv().triggerbotLoaded = true

-- Main triggerbot configuration
getgenv().triggerbot = {
    Settings = {
        isEnabled = false,  -- Master switch for the triggerbot functionality
        clickDelay = 0,     -- Delay between clicks in seconds (0 = instant clicking)
        toggleKey = Enum.KeyCode.T,  -- Hotkey to toggle triggerbot on/off
        lastClickTime = 0   -- Internal timestamp tracker for click delay
    },
    
    load = function()
        -- Cache services for better performance
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local LocalPlayer = Players.LocalPlayer
        local mouse = LocalPlayer:GetMouse()
        
        -- Helper function: Performs the actual mouse click simulation
        local function simulateClick()
            mouse1click()
        end
        
        -- Helper function: Detects if mouse is hovering over another player's character
        local function isHoveringPlayer()
            local target = mouse.Target
            if not target then return false end
            
            local character = target:FindFirstAncestorOfClass("Model")
            return character and Players:GetPlayerFromCharacter(character) ~= nil
        end
        
        -- Set up toggle key detection
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            -- Only process our toggle key and ignore if game is already handling the input
            if input.KeyCode == triggerbot.Settings.toggleKey and not gameProcessed then
                -- Toggle the enabled state
                triggerbot.Settings.isEnabled = not triggerbot.Settings.isEnabled
            end
        end)
        
        -- Set up mouse movement detection
        mouse.Move:Connect(function()
            -- Only proceed if triggerbot is enabled and mouse is over a player
            if triggerbot.Settings.isEnabled and isHoveringPlayer() then
                local currentTime = tick()
                -- Check if enough time has passed since last click (respects click delay)
                if currentTime - triggerbot.Settings.lastClickTime >= triggerbot.Settings.clickDelay then
                    simulateClick()
                    triggerbot.Settings.lastClickTime = currentTime
                end
            end
        end)
    end
}

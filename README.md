# Roblox-Lua-Triggerbot
one of the only working triggerbots in roblox -- of course made by your favorite skid
## 11/1/24 added notification when toggled

## Load the library
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Roblox-Lua-Triggerbot/refs/heads/main/Triggerbot.lua"))()
```


## Customizable Settings - do not execute this code
```lua
getgenv().triggerbot = {
    Settings = {
        isEnabled = false,           -- Determines if clicking is enabled
        clickDelay = 0.5,            -- Time in seconds to wait before clicking
        toggleKey = Enum.KeyCode.T,  -- Key to toggle the clicking on and off
        lastClickTime = 0            -- Tracks the last click time
    }
```

## Change the settings
here's an example:
```lua
getgenv().triggerbot.Settings.clickDelay = 0.1 -- changes clickdelay to 0.1 second
getgenv().triggerbot.Settings.toggleKey = Enum.Keycode.E -- changes togglekey to e
```

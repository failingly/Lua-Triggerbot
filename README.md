### Feel free to use this in a script.

## Load the library
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/failingly/Lua-Triggerbot/refs/heads/main/Triggerbot.lua"))()
```


## Customizable Settings - do not execute this code
```lua
getgenv().triggerbot = {
    Settings = {
        isEnabled = false,           -- Determines if clicking is enabled
        clickDelay = 0,            -- Time in seconds to wait before clicking
        toggleKey = Enum.KeyCode.T,  -- Key to toggle the clicking on and off
        lastClickTime = 0            -- Tracks the last click time
    }
```

## You must run this code for it to work:
```lua
getgenv().triggerbot.load()
```

## Change the settings
here's an example:
```lua
getgenv().triggerbot.Settings.clickDelay = 0.1 -- changes clickdelay to 0.1 second
getgenv().triggerbot.Settings.toggleKey = Enum.Keycode.E -- changes togglekey to e
```

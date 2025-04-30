-- entry_animation.lua
-- Lua module to show an entry loader animation when the app is opened
-- Designed for easy integration into your Lua app

local entry_animation = {}

-- Show a simple loader animation using GameGuardian UI (if available)
function entry_animation.show_loader(duration)
    duration = duration or 3000 -- default 3 seconds
    if gg then
        gg.toast("Loading...")
        local spinner = {"|", "/", "-", "\\"}
        local start_time = os.time()
        local i = 1
        while os.time() - start_time < duration / 1000 do
            gg.toast("Loading " .. spinner[i])
            i = i + 1
            if i > #spinner then i = 1 end
            gg.sleep(200)
        end
        gg.toast("Load complete")
    else
        print("GameGuardian not found, simple loader not available")
    end
end

return entry_animation

local hyper = {"ctrl", "alt", "cmd"}

-- from https://github.com/miromannino/miro-windows-manager
hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"},
  nextscreen = {hyper, "n"}
})


----- start quick open applications 
function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

hs.hotkey.bind(hyper, "C", open_app("Visual Studio Code"))
hs.hotkey.bind(hyper, "G", open_app("Google Chrome"))
hs.hotkey.bind(hyper, "T", open_app("iTerm"))
hs.hotkey.bind(hyper, "S", open_app("Slack"))
hs.hotkey.bind(hyper, "O", open_app("Microsoft Outlook"))
hs.hotkey.bind(hyper, "D", open_app("Dictionary"))
hs.hotkey.bind(hyper, "I", open_app("Intellij IDEA CE 2"))
hs.hotkey.bind(hyper, "F", open_app("Finder"))

-- spoon plugins
hs.loadSpoon("SpoonInstall")
--spoon.SpoonInstall.use_syncinstall = false
spoon.SpoonInstall:andUse("Caffeine", { start=true})

-- from https://github.com/johngrib/hammerspoon-config/blob/master/modules/inputsource_aurora.lua
require('modules.inputsource_aurora')

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

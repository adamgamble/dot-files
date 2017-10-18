-- Hammerspoon configuration, heavily influenced by sdegutis default configuration
-- ... also, originally grabbed from:
--   https://github.com/Hammerspoon/hammerspoon/wiki/ztomer's-init.lua

-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 12
hs.grid.GRIDHEIGHT = 8

-- disable animation
hs.window.animationDuration = 0


-- hotkey mash
local mash 	 = {"ctrl", "alt"}
local mash_app 	 = {"cmd", "alt", "ctrl"}
local mash_shift = {"ctrl", "alt", "shift"}

local almost_maxed = hs.geometry.rect'[1,0,10x8]'
local upper_left   = hs.geometry.rect'[1,0,8x6]'
local centered     = hs.geometry.rect'[1,0,8x6]'
local lower_right  = hs.geometry.rect'[1,0,8x6]'

--------------------------------------------------------------------------------

-- -- application help
-- local function open_help()
--   help_str = "d - Dictionary, 1 - Terminal, 2 - Pathfinder, " ..
--             "3 - Chrome, 4 - Dash, 5 - Trello, 6 - Quiver"        
--   hs.alert.show(
--    help_str, 2)
-- end

-- -- Launch applications
-- hs.hotkey.bind(mash_app, 'D', function () hs.application.launchOrFocus("Dictionary") end)
-- hs.hotkey.bind(mash_app, '1', function () hs.application.launchOrFocus("iterm") end)
-- hs.hotkey.bind(mash_app, '2', function () hs.application.launchOrFocus("Path Finder") end)
-- hs.hotkey.bind(mash_app, '3', function () hs.application.launchOrFocus("Google Chrome") end)
-- -- mash_app '4' reserved for dash global key
-- hs.hotkey.bind(mash_app, '5', function () hs.application.launchOrFocus("Trello X") end)
-- hs.hotkey.bind(mash_app, '6', function () hs.application.launchOrFocus("Quiver") end)
-- hs.hotkey.bind(mash_app, '/', open_help)

-- global operations
hs.hotkey.bind(mash, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() hs.fnutil.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- -- adjust grid size
-- hs.hotkey.bind(mash, '=', function() hs.grid.resizeWindowWider() end)
-- hs.hotkey.bind(mash, '-', function() hs.grid.resizeWindowThinner() end)
-- hs.hotkey.bind(mash, ']', function() hs.grid.resizeWindowTaller() end)
-- hs.hotkey.bind(mash, '[', function() hs.grid.resizeWindowShorter() end)

-- change focus
hs.hotkey.bind(mash_shift, 'H', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(mash_shift, 'L', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(mash_shift, 'K', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mash_shift, 'J', function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

-- multi monitor
hs.hotkey.bind(mash, 'N', function() hs.window.focusedWindow():moveOneScreenEast() end)
hs.hotkey.bind(mash, 'P', function() hs.window.focusedWindow():moveOneScreenWest() end)

-- move windows
hs.hotkey.bind(mash, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)

-- resize windows
hs.hotkey.bind(mash, '-', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, '=', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, ']', hs.grid.resizeWindowWider)
hs.hotkey.bind(mash, '[', hs.grid.resizeWindowThinner)

hs.hotkey.bind(mash, "Y", function()
  local window  = hs.window.focusedWindow()
  local w_frame = window:frame()
  local screen  = window:screen()
  local s_frame = screen:frame()

  w_frame.x = s_frame.x - s_frame.x / 12
  w_frame.y = 0
  w_frame.w = s_frame.w / 12 * 10
  w_frame.h = s_frame.h
  window:setFrame(w_frame)
end)
hs.hotkey.bind(mash, "U", function() hs.window.focusedWindow():moveToUnit(upper_left:toUnitRect()) end)
hs.hotkey.bind(mash, "I", function() hs.window.focusedWindow():moveToUnit(centered:toUnitRect()) end)
hs.hotkey.bind(mash, "O", function() hs.window.focusedWindow():moveToUnit(lower_right:toUnitRect()) end)

-- Window Hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

--------
-- -- Pomodoro module
-- local pom_work_period_sec  = 25 * 60
-- local pom_rest_period_sec  = 5 * 60
-- local pom_work_count       = 0
-- local pom_curr_active_type = "work" -- {"work", "rest"}
-- local pom_is_active        = false
-- local pom_time_left        = pom_work_period_sec
-- local pom_disable_count    = 0

-- -- update display
-- local function pom_update_display()
--   local time_min = math.floor( (pom_time_left / 60))
--   local time_sec = pom_time_left - (time_min * 60)
--   local str = string.format ("[%s|%02d:%02d|#%02d]", pom_curr_active_type, time_min, time_sec, pom_work_count)
--   pom_menu:setTitle(str)
-- end

-- -- stop the clock
-- local function pom_disable()
--   -- disabling pomodoro twice will reset the countdown
--   local pom_was_active = pom_is_active
--   pom_is_active = false

--   if (pom_disable_count == 0) then
--      if (pom_was_active) then
--       pom_timer:stop()
--     end
--   elseif (pom_disable_count == 1) then
--     pom_time_left     = pom_work_period_sec
--     pom_update_display()
--   elseif (pom_disable_count >= 2) then
--     if pom_menu == nil then 
--       pom_disable_count = 2
--       return
--     end
--     pom_menu:delete()
--     pom_menu = nil
--     pom_timer:stop()
--     pom_timer = nil
--   end

--   pom_disable_count = pom_disable_count + 1
 
-- end

-- -- update pomodoro timer
-- local function pom_update_time()
--   if pom_is_active == false then
--     return
--   else
--     pom_time_left = pom_time_left - 1

--     if (pom_time_left <= 0 ) then
--       pom_disable()
--       if pom_curr_active_type == "work" then 
--         hs.alert.show("Work Complete!", 2)
--         pom_work_count        =  pom_work_count + 1 
--         pom_curr_active_type  = "rest"
--         pom_time_left         = pom_rest_period_sec
--       else 
--           hs.alert.show("Done resting",2)
--           pom_curr_active_type  = "work"
--           pom_time_left         = pom_work_period_sec   
--       end
--     end
--   end
-- end

-- -- update menu display
-- local function pom_update_menu()
--   pom_update_time()
--   pom_update_display()
-- end

-- local function pom_create_menu(pom_origin)
--   if pom_menu == nil then
--     pom_menu = hs.menubar.new()
--   end
-- end

-- local function pom_enable()
--   pom_disable_count = 0;
--   if (pom_is_active) then
--     return
--   elseif pom_timer == nil then
--     pom_create_menu()
--     pom_timer = hs.timer.new(1, pom_update_menu)
--   end

--   pom_is_active = true
--   pom_timer:start()
-- end


-- -- init pomodoro
-- -- pom_create_menu()
-- -- pom_update_menu()

-- hs.hotkey.bind(mash, '9', function() pom_enable() end)
-- hs.hotkey.bind(mash, '0', function() pom_disable() end)

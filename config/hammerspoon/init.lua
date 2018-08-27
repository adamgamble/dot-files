-- Define default Spoons which will be loaded later
if not hspoon_list then
    hspoon_list = {
        -- "AClock",
        -- "BingDaily",
        -- "CircleClock",
        -- "ClipShow",
        -- "CountDown",
        -- "HCalendar",
        -- "HSaria2",
        -- "HSearch",
        -- "SpeedMenu",
        "WinWin",
        -- "FnMate",
    }
end

-- Load those Spoons
for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end


-- WinWin-based Windows Management
if spoon.WinWin then
    -- Toggle Cheatsheet
    -- cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)

    -- Move: left, down, up, right
    hs.hotkey.bind(
      {"shift", "ctrl", "cmd", "alt"}, "H", "Move Leftwards",
      function() spoon.WinWin:stepMove("left")  end,  -- When pressed
      nil,                                            -- When released
      function() spoon.WinWin:stepMove("left")  end)  -- When held (repeated)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "J", "Move Downwards",
      function() spoon.WinWin:stepMove("down")  end,
      nil,
      function() spoon.WinWin:stepMove("down")  end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "K", "Move Upwards",
      function() spoon.WinWin:stepMove("up")    end,
      nil,
      function() spoon.WinWin:stepMove("up")    end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "L", "Move Rightwards",
      function() spoon.WinWin:stepMove("right") end,
      nil,
      function() spoon.WinWin:stepMove("right") end)

    -- Half-Screen: left, down, up, right
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "6", "Left-Half of Screen",
      function() spoon.WinWin:moveAndResize("halfleft") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "7", "Lower-Half of Screen",
      function() spoon.WinWin:moveAndResize("halfdown") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "8", "Upper-Half of Screen",
      function() spoon.WinWin:moveAndResize("halfup") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "9", "Right-Half of Screen",
      function() spoon.WinWin:moveAndResize("halfright") end)

    -- Corner: up/left, up/right, down/left, down/right
    -- cmodal:bind('', 'Y', 'NorthWest Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNW") end)
    -- cmodal:bind('', 'O', 'NorthEast Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNE") end)
    -- cmodal:bind('', 'U', 'SouthWest Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSW") end)
    -- cmodal:bind('', 'I', 'SouthEast Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSE") end)

    -- Center/Full
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "'", "Full-Screen",
      function() spoon.WinWin:moveAndResize("fullscreen") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, ";", "Center",
      function() spoon.WinWin:moveAndResize("center") end)

    -- Other particular sizes
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "[", "-3 steps",
      function()
        spoon.WinWin:moveAndResize("fullscreen")
        for i=1,3 do
          spoon.WinWin:stepResize("up")
          spoon.WinWin:stepResize("left")
        end
      end
    )
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "]", "-10 steps",
      function()
        spoon.WinWin:moveAndResize("fullscreen")
        for i=1,10 do
          spoon.WinWin:stepResize("up")
          spoon.WinWin:stepResize("left")
        end
      end
    )

    -- Stretch: out, in
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "=", "Expand",
      function() spoon.WinWin:moveAndResize("expand") end,
      nil,
      function() spoon.WinWin:moveAndResize("expand") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "-", "Shrink",
      function() spoon.WinWin:moveAndResize("shrink") end,
      nil,
      function() spoon.WinWin:moveAndResize("shrink") end)

    -- Resize: left, down, up, right
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "Y", "Shrink From Right",
      function() spoon.WinWin:stepResize("left") end,
      nil,
      function() spoon.WinWin:stepResize("left") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "U", "Grow Downwards",
      function() spoon.WinWin:stepResize("down") end,
      nil,
      function() spoon.WinWin:stepResize("down") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "I", "Shrink From Bottom",
      function() spoon.WinWin:stepResize("up") end,
      nil,
      function() spoon.WinWin:stepResize("up") end)
    hs.hotkey.bind({"shift", "ctrl", "cmd", "alt"}, "O", "Grow Rightwards",
      function() spoon.WinWin:stepResize("right") end,
      nil,
      function() spoon.WinWin:stepResize("right") end)

    -- Move Monitors: left, down, up, right, next
    -- cmodal:bind('', 'left', 'Move to Left Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("left") end)
    -- cmodal:bind('', 'right', 'Move to Right Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("right") end)
    -- cmodal:bind('', 'up', 'Move to Above Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("up") end)
    -- cmodal:bind('', 'down', 'Move to Below Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("down") end)
    -- cmodal:bind('', 'space', 'Move to Next Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("next") end)

    -- Undo/Redo Window Manipulation
    -- cmodal:bind('', '[', 'Undo Window Manipulation', function() spoon.WinWin:undo() end)
    -- cmodal:bind('', ']', 'Redo Window Manipulation', function() spoon.WinWin:redo() end)

    -- Center Cursor
    -- cmodal:bind('', '`', 'Center Cursor', function() spoon.WinWin:centerCursor() end)
end

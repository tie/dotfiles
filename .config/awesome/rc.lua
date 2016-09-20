--[[

	Theme: Solarized
	Author: b1narykid

	Colorscheme: Solarized by Ethan Schoonover
	             http://ethanschoonover.com/solarized

	Based on Powerarrow Darker theme
	by github.com/copycat-killer

--]]

-- {{{ Required libraries
local gears     = require("gears")
local awful     = require("awful")
awful.rules     = require("awful.rules")
                  require("awful.autofocus")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty   = require("naughty")
local menubar   = require("menubar")
local drop      = require("scratchdrop")
local lain      = require("lain")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ bg = beautiful.S_yellow,
                         preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/solarized/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "uxterm"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
screenshot = terminal .. " -e " .. "'archey3 -s'"

browser    = "chrome"
gui_editor = "gvim"
graphics   = "meh"

-- Common keys.
altkey = "Mod1"
modkey = "Mod4"
spacekey = "space"
-- Function keys.
bkl_lower_key = "XF86MonBrightnessDown" -- F1
bkl_raise_key = "XF86MonBrightnessUp"   -- F2
missn_ctl_key = "XF86LaunchA"           -- F3
dashboard_key = "XF86LaunchB"           -- F4
kbl_lower_key = "XF86KbdBrightnessDown" -- F5
kbl_raise_key = "XF86KbdBrightnessUp"   -- F6
song_prev_key = "XF86AudioPrev"         -- F7
song_play_key = "XF86AudioPlay"         -- F8
song_next_key = "XF86AudioNext"         -- F9
vol_mute_key  = "XF86AudioMute"         -- F10
vol_lower_key = "XF86AudioLowerVolume"  -- F11
vol_raise_key = "XF86AudioRaiseVolume"  -- F12
dsk_eject_key = "XF86Eject"             -- Eject

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "main", "dev", "web", "vcs", "etc" }, s, layouts[2])
end
-- }}}

-- {{{ Menu
mainmenu = awful.menu.new({
    items = require("menugen").build_menu(),
    theme = { height = theme.menu_height, width = theme.menu_width }
})

-- Menubar configuration
-- Set the terminal for applications that require it
menubar.utils.terminal = terminal
-- }}}

-- {{{ Wibox
markup = lain.util.markup
separators = lain.util.separators

-- Textclock
clockwidget = lain.widgets.abase({
    timeout  = 60,
    cmd      = "date +'%a %d %b %R'",
    settings = function()
        widget:set_text(" " .. output)
    end
})

-- Calendar
lain.widgets.calendar:attach(clockwidget, { 
    font = beautiful.monoFontName, 
    font_size = beautiful.fontSize 
})

-- Weather
local read_pipe = require("lain.helpers").read_pipe

weather = lain.widgets.weather({
    city_id = 524901,
    units = "metric",
    notification_text_fun = function(wn)
        -- time of data forecasted
        local day = string.gsub(read_pipe(string.format("date -u -d @%d +'%%A %%d'",
                                                        wn["dt"])), "\n", "")

        -- weather condition
        local description = wn["weather"][1]["description"]

        -- temperatures, units are defined above
        local tmin = math.floor(wn["temp"]["min"])   -- min daily
        local tmax = math.floor(wn["temp"]["max"])   -- max daily
        local tmor = math.floor(wn["temp"]["morn"])  -- morning
        local tday = math.floor(wn["temp"]["day"])   -- day
        local teve = math.floor(wn["temp"]["eve"])   -- evening
        local tnig = math.floor(wn["temp"]["night"]) -- night

        -- pressure, hPa
        local pressure = math.floor(wn["pressure"])

        -- humidity, %
        local humidity = math.floor(wn["humidity"])

        -- wind speed, miles/hour if units are imperial, meter/sec otherwise
        local wspeed = math.floor(wn["speed"])

        -- wind degrees, meteorological degrees
        local wdeg = math.floor(wn["deg"])

        -- cloudliness, %
        local clouds = math.floor(wn["clouds"])

        local fmt = [[
<b>%s</b>: %s
Temperature (min): %d°C
Temperature (max): %d°C
Pressure: %d hPa
Humidity: %d%%
Wind: %d m/s at %d°
Cloudliness: %d%%
]]

        return string.format(fmt,
		    day, description, tmin, tmax, pressure,
            humidity, wspeed, wdeg, clouds
        )
    end,
    settings = function()
        temp = math.floor(weather_now["main"]["temp"])
        widget:set_text(" " .. temp .. "°C ")
    end
})

-- Net
neticon = wibox.widget.imagebox(beautiful.widget_net)
neticon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell(iptraf) end)))
netwidget = lain.widgets.net({
    settings = function()
        widget:set_markup(
            markup(beautiful.S_green, " Rx " .. net_now.received) 
            .. " " ..
            markup(beautiful.S_blue, " Tx " .. net_now.sent .. " ")
        )
    end
})

-- MEM
memicon = wibox.widget.imagebox(beautiful.widget_mem)
memwidget = lain.widgets.mem({
    settings = function()
        widget:set_text(" " .. mem_now.used .. "MiB ")
    end
})

-- CPU
cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
cpuwidget = lain.widgets.cpu({
    settings = function()
        widget:set_text(" " .. cpu_now.usage .. "% ")
    end
})

-- Coretemp
tempicon = wibox.widget.imagebox(beautiful.widget_temp)
tempwidget = lain.widgets.temp({
    settings = function()
        widget:set_text(" " .. coretemp_now .. "°C ")
    end
})

-- Battery
baticon = wibox.widget.imagebox(beautiful.widget_battery)
batwidget = lain.widgets.bat({
    settings = function()
        if bat_now.perc == "N/A" then
            widget:set_markup(" AC ")
            baticon:set_image(beautiful.widget_ac)
            return
        elseif tonumber(bat_now.perc) <= 5 then
            baticon:set_image(beautiful.widget_battery_empty)
        elseif tonumber(bat_now.perc) <= 15 then
            baticon:set_image(beautiful.widget_battery_low)
        else
            baticon:set_image(beautiful.widget_battery)
        end
        widget:set_markup(" " .. bat_now.perc .. "% ")
    end
})

-- ALSA volume
volicon = wibox.widget.imagebox(beautiful.widget_vol)
volumewidget = lain.widgets.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(beautiful.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(beautiful.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(beautiful.widget_vol_low)
        else
            volicon:set_image(beautiful.widget_vol)
        end

        widget:set_text(" " .. volume_now.level .. "% ")
    end
})

-- Separators
spr = wibox.widget.textbox(' ')
arrl_dl = separators.arrow_left(beautiful.bg_focus, "alpha")
arrl_ld = separators.arrow_left("alpha", beautiful.bg_focus)


-- Create a wibox for each screen and add it
mywibox = {}
-- bottom_wibox = {}
promptbox = {}
layoutbox = {}
taglist = {}
taglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

tasklist = {}
tasklist.buttons = awful.util.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() then
                awful.tag.viewonly(c:tags()[1])
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),

    awful.button({ }, 3, function ()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({
                theme = { width = 250 }
            })
        end
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
    end),

    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    promptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    layoutbox[s] = awful.widget.layoutbox(s)
    layoutbox[s]:buttons(
        awful.util.table.join(
            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
        )
    )
    -- Create a taglist widget
    taglist[s] = awful.widget.taglist(
        s, 
        awful.widget.taglist.filter.all, 
        taglist.buttons)

    -- Create a tasklist widget
    tasklist[s] = awful.widget.tasklist(
        s,
        awful.widget.tasklist.filter.currenttags, 
        tasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 36 })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(taglist[s])
    left_layout:add(promptbox[s])

    -- Widgets that are aligned to the right
    local right_layout_toggle = true
    local function right_layout_add (...)
        local arg = {...}
        if right_layout_toggle then
            right_layout:add(arrl_ld)
            for i, n in pairs(arg) do
                right_layout:add(wibox.widget.background(n, beautiful.bg_focus))
            end
        else
            right_layout:add(arrl_dl)
            for i, n in pairs(arg) do
                right_layout:add(n)
            end
        end
        right_layout_toggle = not right_layout_toggle
    end

    right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(spr)
    right_layout_add(volicon,      volumewidget)
    right_layout_add(memicon,      memwidget)
    right_layout_add(cpuicon,      cpuwidget)
    right_layout_add(tempicon,     tempwidget)
    right_layout_add(baticon,      batwidget)
    right_layout_add(neticon,      netwidget)
    right_layout_add(weather.icon, weather)
    right_layout_add(clockwidget,  spr)

    right_layout_add(layoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(tasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    -- Take a screenshot.
    awful.key({ altkey }, missn_ctl_key, function() awful.util.spawn(screenshot) end),

    -- Tag browsing.
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    -- Default client focus
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal)   end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",      function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",      function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",      function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",      function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",      function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",      function () awful.tag.incncol(-1)         end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Inc/dec layout
    awful.key({ modkey,           }, "`",      function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "`",      function () awful.layout.inc(layouts, -1) end),

    -- Kbd layout
    -- awful.key({ modkey,           }, spacekey, function () kbdlayout.next() end),
    -- awful.key({ modkey, "Shift"   }, spacekey, function () kbdlayout.prev() end),

    -- ALSA volume control
    awful.key({    }, vol_raise_key, -- Raise volume
        function ()
            os.execute(string.format("amixer set %s 1%%+", volumewidget.channel))
            volumewidget.update()
        end),
    awful.key({    }, vol_lower_key, -- Lower volume
        function ()
            os.execute(string.format("amixer set %s 1%%-", volumewidget.channel))
            volumewidget.update()
        end),
    awful.key({    }, vol_mute_key,
        function ()
            os.execute(string.format("amixer set %s toggle", volumewidget.channel))
            volumewidget.update()
        end),
    awful.key({ altkey }, vol_raise_key,
        function ()
            os.execute(string.format("amixer set %s 100%%", volumewidget.channel))
            volumewidget.update()
        end),

    -- Ligth control
    awful.key({  }, bkl_lower_key, -- Decrease light
        function ()
            os.execute("light -U 1")
        end),

    awful.key({  }, bkl_raise_key, -- Increase light
        function ()
            os.execute("light -A 1")
        end),


    -- Kbd light
    awful.key({  }, kbl_lower_key, -- Decrease keyboard backlight
        function ()
            os.execute("kbdlight down 1")
        end),
    awful.key({  }, kbl_raise_key, -- Increase keyboard backlight
        function ()
            os.execute("kbdlight up 1")
        end),

    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
        mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
    end),

    -- Show menu
    awful.key({ modkey }, "w", function () mainmenu:show() end),

    -- Prompt
    awful.key({ modkey }, "r", function () promptbox[mouse.screen]:run() end),

    -- Dropdown terminal
    awful.key({ modkey }, "z", function () drop(terminal) end),

    awful.key({ modkey }, "x", function ()
        awful.prompt.run({ prompt = "Run Lua code: " },
        promptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval")
    end),

    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                local tag = awful.tag.gettags(screen)[i]
                if tag then
                    awful.tag.viewonly(tag)
                end
            end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                local tag = awful.tag.gettags(screen)[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = awful.tag.gettags(client.focus.screen)[i]
                    if tag then
                        awful.client.movetotag(tag)
                    end
                end
            end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
              function ()
                  if client.focus then
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if tag then
                          awful.client.toggletag(tag)
                      end
                  end
              end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { name = "xterm" }, 
      properties = { size_hints_honor = false } },
    -- { rule = { class = "MPlayer" },
    --   properties = { floating = true } },
    -- { rule = { class = "pinentry" },
    --   properties = { floating = true } },
    -- { rule = { class = "gimp" },
    --   properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
        )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

-- No border for maximized clients
client.connect_signal("focus", 
    function(client)
        if client.maximized_horizontal == true and client.maximized_vertical == true then
            client.border_color = beautiful.border_normal
        else
            client.border_color = beautiful.border_focus
        end
    end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- vim: ft=lua ts=4 et:

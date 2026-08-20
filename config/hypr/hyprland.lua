hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hyprpaper")
end)

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,

        col = {
            active_border = { colors = { "rgba(7d0b2dff)", "rgba(ffc014ff)"}, angle = 270},
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23,1}, {0.32,1}} })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65,0.05}, {0.36,1}} })
hl.curve("linear", { type = "bezier", points = { {0,0}, {1,1}} })
hl.curve("almostLinear", { type = "bezier", points = { {0.5,0.5}, {0.75,1.0}} })
hl.curve("quick", { type = "bezier", points = { {0.15,0}, {0.1,1}} })


hl.animation({ enabled = true, leaf = "global", speed = 10, bezier = "default" })
hl.animation({ enabled = true, leaf = "border", speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ enabled = true, leaf = "windows", speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ enabled = true, leaf = "windowsIn", speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ enabled = true, leaf = "windowsOut", speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ enabled = true, leaf = "fadeIn", speed = 1.73, bezier = "almostLinear" })
hl.animation({ enabled = true, leaf = "fadeOut", speed = 1.46, bezier = "almostLinear" })
hl.animation({ enabled = true, leaf = "fade", speed = 3.03, bezier = "quick" })
hl.animation({ enabled = true, leaf = "layers", speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ enabled = true, leaf = "layersIn", speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ enabled = true, leaf = "layersOut", speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ enabled = true, leaf = "fadeLayersIn", speed = 1.79, bezier = "almostLinear" })
hl.animation({ enabled = true, leaf = "fadeLayersOut", speed = 1.39, bezier = "almostLinear" })
hl.animation({ enabled = true, leaf = "workspaces", speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ enabled = true, leaf = "workspacesIn", speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ enabled = true, leaf = "workspacesOut", speed = 1.94, bezier = "almostLinear", style = "fade" })


local mainMod = "SUPER";

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("wofi --show drun"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close({}))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill({}))
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({}))
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + f11", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

hl.bind(mainMod .. "+ h", hl.dsp.focus({ direction = "l"}))
hl.bind(mainMod .. "+ j", hl.dsp.focus({ direction = "d"}))
hl.bind(mainMod .. "+ l", hl.dsp.focus({ direction = "r"}))
hl.bind(mainMod .. "+ k", hl.dsp.focus({ direction = "u"}))

hl.bind(mainMod .. "+ SHIFT + h", hl.dsp.window.move({ direction = "l", group_aware = true}))
hl.bind(mainMod .. "+ SHIFT + j", hl.dsp.window.move({ direction = "d", group_aware = true}))
hl.bind(mainMod .. "+ SHIFT + l", hl.dsp.window.move({ direction = "r", group_aware = true}))
hl.bind(mainMod .. "+ SHIFT + k", hl.dsp.window.move({ direction = "u", group_aware = true}))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + g", hl.dsp.group.toggle({}))
hl.bind(mainMod .. " + SHIFT + g", hl.dsp.group.lock_active({}))
hl.bind(mainMod .. " + TAB", hl.dsp.group.next({}))

hl.bind(mainMod .. " + PERIOD", hl.dsp.workspace.move({ monitor = "r"}))
hl.bind(mainMod .. " + COMMA", hl.dsp.workspace.move({ monitor = "l"}))

hl.bind(mainMod .. " + SHIFT + O", function() 
    hl.exec_cmd("hyprlock")
end)

hl.bind(mainMod .. "+ A", function()
    local ws = hl.get_active_workspace()
    if ws then
        hl.workspace_rule({
            workspace = tostring(ws.id),
            layout = "dwindle",
        })
    end
end)

hl.bind(mainMod .. "+ B", function()
    local ws = hl.get_active_workspace()
    if ws then
        hl.workspace_rule({
            workspace = tostring(ws.id),
            layout = "scrolling",
        })
    end
end)

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,            hl.dsp.focus({ workspace = i, follow = false }))
    hl.bind(mainMod .. " + SHIFT + " .. key,    hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + i", hl.dsp.exec_cmd("tag=$(printf '\n' | wofi --dmenu --height 1 --hide-scroll --prompt 'Tag'); hyprctl dispatch \"hl.dsp.focus({tag='$tag'})\""))
hl.bind(mainMod .. " + SHIFT + i", hl.dsp.exec_cmd("tag=$(printf '\n' | wofi --dmenu --height 1 --hide-scroll --prompt 'Tag'); hyprctl dispatch \"hl.dsp.window.tag({tag='$tag'})\""))

hl.bind(mainMod .. " + EQUAL", function() 
    local ws = hl.get_active_workspace()

    if not ws then return end

    if ws.tiled_layout == "scrolling" then
        hl.dispatch(hl.dsp.layout("colresize +0.25") )
    elseif ws.tiled_layout == "dwindle" then
        hl.dispatch(hl.dsp.layout("splitratio +0.25") )
    end
end)
hl.bind(mainMod .. " + MINUS", function() 
    local ws = hl.get_active_workspace()

    if not ws then return end

    if ws.tiled_layout == "scrolling" then
        hl.dispatch(hl.dsp.layout("colresize -0.25") )
    elseif ws.tiled_layout == "dwindle" then
        hl.dispatch(hl.dsp.layout("splitratio -0.25") )
    end
end)

hl.bind(mainMod .. "+r", hl.dsp.layout("rotatesplit"))


hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})


local function create_custom_workspace(name, key)
    hl.bind(mainMod .. "+" .. key, hl.dsp.workspace.toggle_special(name))
    hl.bind(mainMod .. "+SHIFT+" .. key, hl.dsp.window.move({ workspace = "special:" .. name, follow = false}))
end

create_custom_workspace("CDS", "T")
create_custom_workspace("LibraryManager", "Y")
create_custom_workspace("Console", "BACKSLASH")
create_custom_workspace("X", "X")


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--Host Specifics
local function getHostname()
    local f = io.popen("/usr/bin/hostname")
    local hostname = f:read("*a") or ""
    f:close()
    hostname = string.gsub(hostname, "\n$" , "")
    return hostname
end

local hostname = getHostname();
if (hostname == "PRTP") then
    hl.bind(mainMod .. "+ CTRL + SHIFT + PAGE_UP", function()
        hl.monitor({ output = "eDP-1", disabled = false })
    end)
    hl.bind(mainMod .. "+ CTRL + SHIFT + PAGE_DOWN", function() 
        hl.monitor({ output = "eDP-1", disabled = true })
    end)

    hl.monitor({
        output = "eDP-1",
        mode="1920x1080@60",
        position="0x0",
        scale=1
    })
end

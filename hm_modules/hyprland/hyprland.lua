----------------------------------------------------------------------
-- Variables
----------------------------------------------------------------------

local mod = "ALT"

----------------------------------------------------------------------
-- Environment
----------------------------------------------------------------------

hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "30")

----------------------------------------------------------------------
-- Startup
----------------------------------------------------------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
end)

hl.on("config.reloaded", function()
	hl.exec_cmd("systemctl restart --user hyprpolkitagent")
end)

----------------------------------------------------------------------
-- Monitors
----------------------------------------------------------------------

hl.monitor({
	output = "eDP-1",
	mode = "highres@highrr",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "desc:Samsung Electric Company U32J59x HNMW300479",
	mode = "1920x1080",
	position = "auto-up",
	scale = 1,
})

-- Fallback monitor
hl.monitor({
	output = "",
	mode = "highres@highrr",
	position = "auto-left",
	scale = 1,
})

----------------------------------------------------------------------
-- Workspaces
----------------------------------------------------------------------

hl.workspace_rule({
	workspace = "1",
	monitor = "desc:Samsung Electric Company U32J59x HNMW300479",
	default = true,
})

hl.workspace_rule({
	workspace = "2",
	monitor = "desc:Samsung Electric Company U32J59x HNMW300479",
})

hl.workspace_rule({
	workspace = "3",
	monitor = "desc:Samsung Electric Company U32J59x HNMW300479",
})

hl.workspace_rule({
	workspace = "4",
	monitor = "desc:Samsung Electric Company U32J59x HNMW300479",
})

hl.workspace_rule({
	workspace = "5",
	monitor = "desc:Samsung Electric Company U32J59x HNMW300479",
})

hl.workspace_rule({
	workspace = "6",
	monitor = "desc:Samsung Electric Company U32J59x HNMW300479",
})

hl.workspace_rule({
	workspace = "7",
	monitor = "desc:Sharp Corporation 0x1449",
	default = true,
})

hl.workspace_rule({
	workspace = "8",
	monitor = "desc:Sharp Corporation 0x1449",
})

hl.workspace_rule({
	workspace = "9",
	monitor = "desc:Sharp Corporation 0x1449",
})

hl.workspace_rule({
	workspace = "10",
	monitor = "desc:Sharp Corporation 0x1449",
})

----------------------------------------------------------------------
-- General
----------------------------------------------------------------------

hl.config({
	general = {
		layout = "master",
		border_size = 3,
		resize_on_border = true,
		no_focus_fallback = true,
		["snap.enabled"] = true,
		hover_icon_on_border = false,
		extend_border_grab_area = 20,
		gaps_in = 10,
		gaps_out = {
			top = 5,
			right = 20,
			bottom = 20,
			left = 20,
		},
	},

	decoration = {
		rounding = 5,
		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = false,
		},
	},

	input = {
		repeat_rate = 25,
		repeat_delay = 400,
		follow_mouse = 2,
		touchpad = {
			natural_scroll = true,
		},
	},

	cursor = {
		inactive_timeout = 2,
		enable_hyprcursor = true,
	},

	render = {
		new_render_scheduling = true,
	},

	binds = {
		workspace_center_on = 1,
	},
})

----------------------------------------------------------------------
-- Animations
----------------------------------------------------------------------

hl.config({
	animations = {
		enabled = true,
	},
})

-- hl.bezier("easeOutQuint", 0.23, 1, 0.32, 1)
-- hl.bezier("easeInOutCubic", 0.65, 0.05, 0.36, 1)
-- hl.bezier("linear", 0, 0, 1, 1)
-- hl.bezier("almostLinear", 0.5, 0.5, 0.75, 1.0)
-- hl.bezier("quick", 0.15, 0, 0.12, 1)

-- hl.animation("global", 1, 2, "quick")
-- hl.animation("windows", 1, 2, "easeOutQuint", "slide")
-- hl.animation("windowsIn", 1, 2, "easeOutQuint", "popin")
-- hl.animation("windowsOut", 1, 2, "quick", "popin")
-- hl.animation("windowsMove", 1, 2, "quick", "slide")
-- hl.animation("fadeIn", 1, 2, "easeOutQuint")
-- hl.animation("fadeOut", 1, 2, "quick")
-- hl.animation("fadeSwitch", 1, 2, "easeOutQuint")
-- hl.animation("fadeShadow", 1, 2, "easeOutQuint")
-- hl.animation("fadeDim", 1, 2, "easeOutQuint")
-- hl.animation("border", 1, 1, "easeOutQuint")
-- hl.animation("borderangle", 1, 1, "easeOutQuint")
-- hl.animation("workspaces", 1, 2, "easeOutQuint", "slide")
-- hl.animation("layers", 1, 2, "easeOutQuint", "slide")

----------------------------------------------------------------------
-- Window rules
----------------------------------------------------------------------

hl.window_rule({
	match = {
		class = "Rofi",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "feh",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = ".blueman-manager-wrapped",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "org.pulseaudio.pavucontrol",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "nm-connection-editor",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "GParted",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "flameshot",
	},
	float = true,
})

hl.window_rule({
	match = {
		title = "float_this",
	},
	float = true,
})

----------------------------------------------------------------------
-- Basic keybindings
----------------------------------------------------------------------

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))

hl.bind(mod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))

hl.bind(mod .. " + SHIFT + D", hl.dsp.exec_cmd("rofi -show run"))

hl.bind(mod .. " + P", hl.dsp.exec_cmd("rofi-pass"))

hl.bind(mod .. " + F", hl.dsp.window.fullscreen())

hl.bind(mod .. " + Q", hl.dsp.window.close())

----------------------------------------------------------------------
-- Window movement
----------------------------------------------------------------------

hl.bind(
	mod .. " + SHIFT + H",
	hl.dsp.window.move({
		direction = "l",
	})
)

hl.bind(
	mod .. " + SHIFT + L",
	hl.dsp.window.move({
		direction = "r",
	})
)

hl.bind(
	mod .. " + SHIFT + K",
	hl.dsp.window.move({
		direction = "u",
	})
)

hl.bind(
	mod .. " + SHIFT + J",
	hl.dsp.window.move({
		direction = "d",
	})
)

----------------------------------------------------------------------
-- Focus movement
----------------------------------------------------------------------

hl.bind(
	mod .. " + H",
	hl.dsp.focus({
		direction = "l",
	})
)

hl.bind(
	mod .. " + L",
	hl.dsp.focus({
		direction = "r",
	})
)

hl.bind(
	mod .. " + K",
	hl.dsp.focus({
		direction = "u",
	})
)

hl.bind(
	mod .. " + J",
	hl.dsp.focus({
		direction = "d",
	})
)

----------------------------------------------------------------------
-- Workspace switching
----------------------------------------------------------------------

hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))

----------------------------------------------------------------------
-- Move window to workspace
----------------------------------------------------------------------

hl.bind(
	mod .. " + SHIFT + 1",
	hl.dsp.window.move({
		workspace = "1",
	})
)

hl.bind(
	mod .. " + SHIFT + 2",
	hl.dsp.window.move({
		workspace = "2",
	})
)

hl.bind(
	mod .. " + SHIFT + 3",
	hl.dsp.window.move({
		workspace = "3",
	})
)

hl.bind(
	mod .. " + SHIFT + 4",
	hl.dsp.window.move({
		workspace = "4",
	})
)

hl.bind(
	mod .. " + SHIFT + 5",
	hl.dsp.window.move({
		workspace = "5",
	})
)

hl.bind(
	mod .. " + SHIFT + 6",
	hl.dsp.window.move({
		workspace = "6",
	})
)

hl.bind(
	mod .. " + SHIFT + 7",
	hl.dsp.window.move({
		workspace = "7",
	})
)

hl.bind(
	mod .. " + SHIFT + 8",
	hl.dsp.window.move({
		workspace = "8",
	})
)

hl.bind(
	mod .. " + SHIFT + 9",
	hl.dsp.window.move({
		workspace = "9",
	})
)

hl.bind(
	mod .. " + SHIFT + 0",
	hl.dsp.window.move({
		workspace = "10",
	})
)

----------------------------------------------------------------------
-- Brightness
----------------------------------------------------------------------

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"))

----------------------------------------------------------------------
-- Audio
----------------------------------------------------------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), {
	repeating = true,
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
	repeating = true,
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
	locked = true,
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
	locked = true,
})

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
	locked = true,
})

----------------------------------------------------------------------
-- Power / lock
----------------------------------------------------------------------

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("hyprlock"))

----------------------------------------------------------------------
-- Mouse
----------------------------------------------------------------------

-- hl.bind(mod .. " + mouse:272", hl.dsp.window.move({}))

----------------------------------------------------------------------
-- Resize submap
----------------------------------------------------------------------

-- hl.submap("resize")
--
-- hl.bind(
-- 	"L",
-- 	hl.dsp.window.resize({
-- 		data = "10 0",
-- 	})
-- )
--
-- hl.bind(
-- 	"H",
-- 	hl.dsp.window.resize({
-- 		data = "-10 0",
-- 	})
-- )
--
-- hl.bind(
-- 	"K",
-- 	hl.dsp.window.resize({
-- 		data = "0 -10",
-- 	})
-- )
--
-- hl.bind(
-- 	"J",
-- 	hl.dsp.window.resize({
-- 		data = "0 10",
-- 	})
-- )
--
-- hl.bind("ESCAPE", hl.dsp.submap("reset"))
--
-- hl.submap("reset")
--
-- ----------------------------------------------------------------------
-- -- Resize mode entry
-- ----------------------------------------------------------------------
--
-- hl.bind(mod .. " + R", hl.dsp.submap("resize"))

--------------------------------------------------------------------------------
-- Author: Ivan Trubach
-- Copyright (c) 2016 Ivan Trubach
--------------------------------------------------------------------------------

local keys_table = {
	"XF86MonBrightnessDown",
	"XF86MonBrightnessUp",
	"XF86LaunchA",
	"XF86LaunchB",
	"XF86KbdBrightnessDown",
	"XF86KbdBrightnessUp",
	"XF86AudioPrev",
	"XF86AudioPlay",
	"XF86AudioNext",
	"XF86AudioMute",
	"XF86AudioLowerVolume",
	"XF86AudioRaiseVolume",
	"XF86Eject",
}

function F(x) return keys_table[x] end

keys = {
	display = {
		brightness = {
			down = "XF86MonBrightnessDown",
			up = "XF86MonBrightnessUp",
		}
	},

	special = {
		missionControl = "XF86LaunchA",
		launchpad = "XF86LaunchB",
	},

	keyboard = {
		brightness = {
			down = "XF86KbdBrightnessDown",
			up = "XF86KbdBrightnessUp",
		}
	},

	audio = {
		song = {
			prev = "XF86AudioPrev",
			play = "XF86AudioPlay",
			next = "XF86AudioNext",
		},

		volume = {
			mute = "XF86AudioMute",
			down = "XF86AudioLowerVolume",
			up = "XF86AudioRaiseVolume",
		},
	},

	devices = {
		disk = {
			eject = "XF86Eject"
		}
	}
}

return setmetatable(keys, { __call = function(_, ...) return F(...) end })

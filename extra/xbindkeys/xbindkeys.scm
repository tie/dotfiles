(xbindkey '(shift mod4 Return) "alacritty")

(xbindkey '(XF86AudioLowerVolume) "amixer set Master 1%-")
(xbindkey '(XF86AudioRaiseVolume) "amixer set Master 1%+")

(xbindkey '(XF86MonBrightnessUp)   "xbacklight -inc 1 -time 0 -steps 1")
(xbindkey '(XF86MonBrightnessDown) "xbacklight -dec 1 -time 0 -steps 1")

(xbindkey '(XF86KbdBrightnessUp)   "kbdlight up   1")
(xbindkey '(XF86KbdBrightnessDown) "kbdlight down 1")

import System.IO

import XMonad
import XMonad.Prompt
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks(avoidStruts)
import XMonad.Layout.NoBorders(smartBorders)

import Keys
import EventHooks
import Theme.Solarized.Dark as Colors

--------------------------------------------------------------------------------

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b)

--------------------------------------------------------------------------------

main =
 xmonad =<< statusBar "xmobar \"$XDG_CONFIG_HOME\"/xmobar/xmobar.hs" pp toggleStrutsKey defaults

pp = xmobarPP { ppHiddenNoWindows = const ""
              , ppCurrent = wrap "[" "]"
              , ppVisible = wrap " " " "
              , ppHidden  = wrap " " " "
              , ppSep     = " | "
              , ppWsSep   = ""
                -- TODO: Replace middle of the string with "..."
              , ppTitle  = shorten 32
              }

prompt = def { font              = "xft:DejaVu Sans Mono:size=9"
             , historySize       = 0
               -- FIXME: compute height
             , height            = 38
             , position          = Bottom
             , promptBorderWidth = 1
             }

defaults = def { terminal           = "alacritty"
               , modMask            = mod4Mask
                 -- FIXME: redefine keys, layout and events handlers
                 --        because we do not want to depend on `def`
               , keys               = Keys.promptKeys prompt <+> Keys.defaultKeys
               , layoutHook         = avoidStruts $ smartBorders $ layoutHook def
               , handleEventHook    = handleEventHook def        <+>
                                      fullscreenEventHook
               , borderWidth        = 1
               }

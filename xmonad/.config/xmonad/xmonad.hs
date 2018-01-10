import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Hooks.EwmhDesktops
import XMonad.Prompt

import Keys
import Theme.Solarized.Dark as Colors

--------------------------------------------------------------------------------

xmobarCommand = "xmobar ~/.config/xmobar/xmobar.hs"

themeConfig c = c { borderWidth        = 1
                  , normalBorderColor  = Colors.base02
                  , focusedBorderColor = Colors.base1
                  }

themePConfig c = c { position          = Top
                   , bgColor           = Colors.base03
                   , fgColor           = Colors.base0
                   , fgHLight          = Colors.base00
                   , bgHLight          = Colors.base02
                   , borderColor       = Colors.base02
                   , promptBorderWidth = 1
                   }

pp = xmobarPP { ppHiddenNoWindows = const ""
              , ppCurrent = xmobarColor Colors.base00 Colors.base02 . wrap " " " "
              , ppVisible = xmobarColor Colors.base01 Colors.base03 . wrap " " " "
              , ppHidden  = xmobarColor Colors.base01 Colors.base03 . wrap " " " "
              , ppSep     = " | "
              , ppWsSep   = ""
                -- TODO: Replace middle of the string with "..."
              , ppTitle  = shorten 32
              }

prompt = themePConfig $
        def { font   = "xft:DejaVu Sans Mono:size=9"
              -- FIXME: compute height
            , height = 38
            , historySize = 0
            }

main = xmonad =<< statusBar xmobarCommand pp toggleStrutsKey defaults

defaults = themeConfig $
    def { terminal        = "uxterm"
        , modMask         = mod4Mask
          -- FIXME: redefine keys, layout and events handlers
          --        because we do not want to depend on `def`
        , keys            = Keys.promptKeys prompt <+> Keys.defaultKeys
        , layoutHook      = smartBorders (layoutHook def)
        , handleEventHook = handleEventHook def <+> fullscreenEventHook
        }

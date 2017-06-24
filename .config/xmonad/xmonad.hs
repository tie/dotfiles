import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Hooks.EwmhDesktops
import XMonad.Prompt

import Keys
import Theme.Solarized
import Theme.Solarized.Colors as Colors

--------------------------------------------------------------------------------

xmobarCommand = "xmobar ~/.config/xmonad/xmobar.hs"

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
        def { font   = "xft:Noto Mono:size=8"
              -- FIXME: compute height
            , height = 32
            , historySize = 0
            }

main = xmonad =<< statusBar xmobarCommand pp toggleStrutsKey defaults

defaults = themeConfig $
    def { terminal        = "uxterm"
        , modMask         = mod4Mask
          -- FIXME: redefine keys, layout and events handlers
          --        because we do not want to depend on `def`
        , keys            = Keys.systemKeys <+> Keys.promptKeys prompt
                                            <+> keys def
        , layoutHook      = smartBorders (layoutHook def)
        , handleEventHook = handleEventHook def <+> fullscreenEventHook
        }

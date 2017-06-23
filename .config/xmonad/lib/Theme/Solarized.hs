module Theme.Solarized
  ( module Colors
  , themeConfig
  , themePConfig
  ) where

    import XMonad
    import XMonad.Prompt

    import qualified Theme.Solarized.Colors as Colors

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

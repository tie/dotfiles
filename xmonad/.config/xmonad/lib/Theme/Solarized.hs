module Theme.Solarized
  ( module Dark
  , themeConfig
  , themePConfig
  ) where

    import XMonad
    import XMonad.Prompt

    import qualified Theme.Solarized.Dark as Dark

    themeConfig c = c { borderWidth        = 1
                      , normalBorderColor  = Dark.base02
                      , focusedBorderColor = Dark.base1
                      }

    themePConfig c = c { position          = Top
                       , bgColor           = Dark.base03
                       , fgColor           = Dark.base0
                       , fgHLight          = Dark.base00
                       , bgHLight          = Dark.base02
                       , borderColor       = Dark.base02
                       , promptBorderWidth = 1
                       }

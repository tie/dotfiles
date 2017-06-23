module Keys
  ( systemKeys
  , promptKeys
  , toggleStrutsKey
  ) where

import qualified Data.Map as M

import XMonad
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad

import Graphics.X11.Xlib
import Graphics.X11.ExtraTypes.XF86

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b)

systemKeys conf@(XConfig { XMonad.modMask = modm }) =  M.fromList $
          -- Restart xmonad
        [ ((modm, xK_q), spawn "xmonad --restart")
        ]

promptKeys prompt conf@(XConfig { XMonad.modMask = modm }) = M.fromList $
        [ ((modm, xK_e), xmonadPrompt prompt)
        , ((modm, xK_r), shellPrompt  prompt)
        ]

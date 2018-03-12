module Keys
  ( promptKeys
  , defaultKeys
  ) where

import System.Exit
import Data.Bits ((.|.))
import qualified Data.Map as M

import XMonad
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad

import qualified XMonad.StackSet as W

import Graphics.X11.Xlib
import Graphics.X11.ExtraTypes.XF86

promptKeys prompt conf@(XConfig { XMonad.modMask = modMask }) = M.fromList $
        [ ((modMask, xK_e), xmonadPrompt prompt)
        , ((modMask, xK_r), shellPrompt  prompt)
        ]

defaultKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
defaultKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
      -- %! Launch terminal
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
      -- %! Close the focused window
    , ((modMask .|. shiftMask, xK_c     ), kill)
      -- %! Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)
      -- %!  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
      -- %! Resize viewed windows to the correct size
    , ((modMask,               xK_n     ), refresh)
    -- move focus up or down the window stack
      -- %! Move focus to the next window
    , ((modMask,               xK_Tab   ), windows W.focusDown)
      -- %! Move focus to the previous window
    , ((modMask .|. shiftMask, xK_Tab   ), windows W.focusUp)
      -- %! Move focus to the next window
    , ((modMask,               xK_j     ), windows W.focusDown)
      -- %! Move focus to the previous window
    , ((modMask,               xK_k     ), windows W.focusUp)
      -- %! Move focus to the master window
    , ((modMask,               xK_m     ), windows W.focusMaster)

    -- modifying the window order
      -- %! Swap the focused window and the master window
    , ((modMask,               xK_Return), windows W.swapMaster)
      -- %! Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown)
      -- %! Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp)

    -- resizing the master/slave ratio
      -- %! Shrink the master area
    , ((modMask,               xK_h     ), sendMessage Shrink)
      -- %! Expand the master area
    , ((modMask,               xK_l     ), sendMessage Expand)

    -- floating layer support
      -- %! Push window back into tiling
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- increase or decrease number of windows in the master area
      -- %! Increment the number of windows in the master area
    , ((modMask,               xK_comma ), sendMessage (IncMasterN ( 1)))
      -- %! Deincrement the number of windows in the master area
    , ((modMask,               xK_period), sendMessage (IncMasterN (-1)))

    -- quit, or restart
      -- %! Quit xmonad
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r} %! Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r} %! Move client to screen 1, 2, or 3
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


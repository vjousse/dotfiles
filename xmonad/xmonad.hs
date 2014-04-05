import XMonad
import XMonad.Actions.CycleWS

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.Accordion

import XMonad.Util.EZConfig
import XMonad.Util.Run

import qualified Data.Map as M
import qualified XMonad.StackSet as W
import qualified Network.MPD as MPD

main = do
    -- Some help from IRC: http://hpaste.org/65912#line8
    conf <- statusBar myBar myPP toggleStrutsKey
                $ withUrgencyHook dzenUrgencyHook { args = ["-bg", "darkgreen", "-xs", "1"] }
                $ defaultConfig
                {
                    terminal          = "urxvtc"
                    , modMask         = mod4Mask
                    , layoutHook      = avoidStruts $ myLayoutHook
                    , manageHook      = myManageHook <+> manageDocks
                    , workspaces      = ["work", "vm", "misc", "comm"]
                    , handleEventHook = XMonad.Hooks.EwmhDesktops.fullscreenEventHook
                    , borderWidth = 0
                }
                `additionalKeys` [
                    ((mod4Mask,               xK_l   ), spawn "~/.scripts/path-dmenu")
                    , ((0, xK_Print), spawn "scrot '%Y-%m-%d-%H%M%S_$wx$h.png' -e 'mv $f ~/'")

                    -- Move focus to the next window
                    , ((mod4Mask,               xK_Tab   ), windows W.focusDown)

                    -- Move focus to the next window
                    , ((mod4Mask,               xK_t     ), windows W.focusDown)

                    -- Move focus to the previous window
                    , ((mod4Mask,               xK_s     ), windows W.focusUp  )

                    -- Move focus to the master window
                    , ((mod4Mask,               xK_m     ), windows W.focusMaster  )

                    -- Swap the focused window and the master window
                    , ((mod4Mask,               xK_Return), windows W.swapMaster)

                    -- Swap the focused window with the next window
                    , ((mod4Mask .|. shiftMask, xK_t     ), windows W.swapDown  )

                    -- Swap the focused window with the previous window
                    , ((mod4Mask .|. shiftMask, xK_s     ), windows W.swapUp    )

                    -- Move between workspaces
                    , ((mod4Mask,               xK_d     ), nextWS)
                    , ((mod4Mask,               xK_v     ), prevWS)
                    , ((mod4Mask,               xK_q     ), windows $ W.view "work")
                    , ((mod4Mask,               xK_g     ), windows $ W.view "vm")
                    , ((mod4Mask,               xK_h     ), windows $ W.view "misc")
                    , ((mod4Mask,               xK_f     ), windows $ W.view "comm")
                    , ((mod4Mask .|. shiftMask, xK_d     ), shiftToNext >> nextWS)
                    , ((mod4Mask .|. shiftMask, xK_v     ), shiftToPrev >> prevWS)

                    -- Pymodoro
                    , ((mod4Mask .|. shiftMask, xK_n     ), spawn "touch ~/.pomodoro_session")
                    , ((mod4Mask .|. shiftMask, xK_r     ), spawn "rm ~/.pomodoro_session")

                    -- mpd
                    , ((mod4Mask,                xK_r     ), spawn "ncmpcpp prev")
                    , ((mod4Mask,                xK_n     ), spawn "ncmpcpp next")
                    , ((mod4Mask,                xK_m     ), spawn "ncmpcpp toggle")
                    -- restart xmonad
                    , ((mod4Mask .|. shiftMask, xK_q     ), spawn "/home/vjousse/.cabal/bin/xmonad --recompile && /home/vjousse/.cabal/bin/xmonad --restart") -- restart xmonad

                ]
                -- Can be helpful: http://en.gentoo-wiki.com/wiki/Multimedia_Keys
                `additionalKeysP` [
                    ("<XF86AudioPlay>"                     , spawn "ncmpcpp toggle")
                    , ("<XF86AudioStop>"                   , spawn "ncmpcpp toggle")
                    , ("<XF86AudioPrevious>"               , spawn "ncmpcpp prev")
                    , ("<XF86AudioNext>"                   , spawn "ncmpcpp next")
                    , ("<XF86AudioMute>"                   , spawn "~/.scripts/volume.rb toggle")
                    , ("<XF86AudioRaiseVolume>"            , spawn "~/.scripts/volume.rb up")
                    , ("<XF86AudioLowerVolume>"            , spawn "~/.scripts/volume.rb down")
                    , ("<XF86MonBrightnessDown>"           , spawn "/usr/bin/xbacklight -dec 10")
                    , ("<XF86MonBrightnessUp>"             , spawn "/usr/bin/xbacklight -inc 10")
                    , ("<XF86KbdBrightnessDown>"           , spawn "/usr/bin/kbdlight down")
                    , ("<XF86KbdBrightnessUp>"             , spawn "/usr/bin/kbdlight up")

                ]
    xmonad $ ewmh conf

-- Command to launch the bar.
myBar = "/home/vjousse/.cabal/bin/xmobar /home/vjousse/.xmobarrc"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
      ppCurrent = xmobarColor "#839496" "" . wrap "[" "]"
    , ppTitle = xmobarColor "#073642" "" . shorten 110
    , ppOrder     = \(ws:l:t:_)   -> [ws,t]
}

myLayoutHook = noBorders (fullscreenFull Full)

-- http://www.chipstips.com/?p=488
myManageHook = composeAll
    [ className =? "Gimp"           --> doF (W.shift "misc")
    , className =? "Pidgin"         --> doF (W.shift "comm")
    , className =? "Skype"          --> doF (W.shift "comm")
    , className =? "Thunderbird"    --> doF (W.shift "comm")
    , className =? "Firefox"        --> doF (W.shift "work")
    ] <+> manageHook defaultConfig


-- | The unexported X.H.DynamicLog.toggleStrutsKey
toggleStrutsKey :: XConfig l -> (KeyMask, KeySym)
toggleStrutsKey XConfig { modMask = mod4Mask } = (mod4Mask, xK_b)

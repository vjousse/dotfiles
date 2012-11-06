import XMonad
import XMonad.Actions.CycleWS

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks

import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion

import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

import qualified Data.Map as M
import qualified XMonad.StackSet as W
import qualified Network.MPD as MPD

main = do
    -- Some help from IRC: http://hpaste.org/65912#line8
    conf <- statusBar myBar myPP toggleStrutsKey
                $ withUrgencyHook dzenUrgencyHook { args = ["-bg", "darkgreen", "-xs", "1"] }
                $ defaultConfig
                {
                    terminal      = "urxvtc"
                    , modMask       = mod4Mask
                    , layoutHook    = avoidStruts $ myLayoutHook
                    , keys          = newKeys
                    , manageHook    = myManageHook
                    , workspaces    = ["work", "vm", "misc", "comm"]
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

                    -- mpd
                    , ((mod4Mask,                xK_r     ), spawn "ncmpcpp prev")
                    , ((mod4Mask,                xK_n     ), spawn "ncmpcpp next")
                    , ((mod4Mask,                xK_c     ), spawn "ncmpcpp toggle")
                    -- restart xmonad
                    , ((mod4Mask .|. shiftMask, xK_q     ), spawn "/home/vjousse/.cabal/bin/xmonad --recompile && /home/vjousse/.cabal/bin/xmonad --restart") -- restart xmonad

                ]
                -- Can be helpful: http://en.gentoo-wiki.com/wiki/Multimedia_Keys
                `additionalKeysP` [
                    ("<XF86AudioPlay>"                     , spawn "ncmpcpp toggle")
                    , ("<XF86AudioStop>"                   , spawn "ncmpcpp toggle")
                    , ("<XF86AudioNext>"                   , spawn "ncmpcpp next")
                    , ("<XF86AudioStop>"                   , spawn "ncmpcpp toggle")
                    , ("<XF86AudioMute>"                   , spawn "~/.scripts/volume.rb toggle")
                    , ("<XF86AudioRaiseVolume>"            , spawn "~/.scripts/volume.rb up")
                    , ("<XF86AudioLowerVolume>"            , spawn "~/.scripts/volume.rb down")


                ]
    xmonad conf

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
      ppCurrent = xmobarColor "#839496" "" . wrap "[" "]"
    , ppTitle = xmobarColor "white" "" . shorten 110
    , ppOrder     = \(ws:l:t:_)   -> [ws,t]
}

myLayoutHook = noBorders (Full ||| Accordion)

-- http://www.chipstips.com/?p=488
myManageHook = composeAll
    [ className =? "Gimp"           --> doF (W.shift "misc")
    , className =? "Pidgin"         --> doF (W.shift "comm")
    , className =? "Skype"          --> doF (W.shift "comm")
    , className =? "Thunderbird"    --> doF (W.shift "comm")
    , className =? "Firefox"        --> doF (W.shift "work")
    , manageDocks
    ] <+> manageHook defaultConfig

newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    [
    ]


-- | The unexported X.H.DynamicLog.toggleStrutsKey
toggleStrutsKey :: XConfig l -> (KeyMask, KeySym)
toggleStrutsKey XConfig { modMask = mod4Mask } = (mod4Mask, xK_b)

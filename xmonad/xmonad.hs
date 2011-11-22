import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map as M
import qualified XMonad.StackSet as W


main = do
    xmonad $ defaultConfig
        {
          terminal      = "urxvtc"
        , modMask       = mod4Mask
        , layoutHook    = myLayoutHook
        , keys          = newKeys
        }
        `additionalKeys` [
        ((mod4Mask,               xK_p   ), spawn "~/.scripts/path-dmenu")
        -- Increase volume
        , ((0 , 0x1008ff11), spawn "amixer -q set PCM 2- unmute")
        -- Decrease Volume
        , ((0 , 0x1008ff13), spawn "amixer -q set PCM 2+ unmute")
        -- Mute
        , ((0 , 0x1008ff12), spawn "amixer -q set PCM toggle")

        , ((0, xK_Print), spawn "scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/'")

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

        , ((mod4Mask, xK_v), nextWS)
        , ((mod4Mask, xK_d), prevWS)
        , ((mod4Mask .|. shiftMask, xK_v), shiftToNext >> nextWS)
        , ((mod4Mask .|. shiftMask, xK_d), shiftToPrev >> prevWS)
        ]


myLayoutHook = noBorders (Full ||| Accordion)

newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    [
    ]

import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map as M
import qualified XMonad.StackSet as W


main = do
    dzenPipe <- spawnPipe myStatusBar
    pomodoro <- spawnPipe myPomodoroBar
    xmonad $ withUrgencyHook dzenUrgencyHook { args = ["-bg", "darkgreen", "-xs", "1"] }
           $ defaultConfig
        {
          terminal      = "urxvtc"
        , modMask       = mod4Mask
        , layoutHook    = avoidStruts $ myLayoutHook
        , keys          = newKeys
        , logHook       = dynamicLogWithPP $ myDzenPP dzenPipe
        , manageHook    = myManageHook
        , workspaces    = ["1:main", "2:chat", "3:web", "4", "5", "6", "7", "8", "9:mail"]
        }
        `additionalKeys` [
        ((mod4Mask,               xK_l   ), spawn "~/.scripts/path-dmenu")
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

        -- Move focus to the master window
        , ((mod4Mask,               xK_n     ), spawn "touch ~/.pomodoro_session" )

        , ((mod4Mask,               xK_r     ), spawn "rm ~/.pomodoro_session" )
        -- Move between workspaces

        , ((mod4Mask, xK_d), nextWS)
        , ((mod4Mask, xK_v), prevWS)
        , ((mod4Mask .|. shiftMask, xK_d), shiftToNext >> nextWS)
        , ((mod4Mask .|. shiftMask, xK_v), shiftToPrev >> prevWS)
        ]


myLayoutHook = noBorders (Full ||| Accordion)

-- http://www.chipstips.com/?p=488
myManageHook = composeAll
    [ className =? "Gimp"           --> doFloat
    , className =? "Pidgin"         --> doF (W.shift "2:chat")
    , className =? "Skype"          --> doF (W.shift "2:chat")
    , className =? "Thunderbird"    --> doF (W.shift "9:mail")
    , manageDocks
    ] <+> manageHook defaultConfig

-- Taken from http://www.haskell.org/haskellwiki/Xmonad/Config_archive/And1%27s_xmonad.hs
-- TODO: https://leohart.wordpress.com/2011/02/20/pomodoro-technique-for-xmonad-users/
-- Color, font and iconpath definitions:
myFont = "-*-inconsolata-medium-r-normal-*-14-*-*-*-c-*-*-*"

myDzenFGColor = "#839496"
myDzenBGColor = "#073642"

myStatusBar = "dzen2 -x '150' -y '0' -h '18' -ta 'l' -fg '" ++ myDzenFGColor ++ "' -bg '" ++ myDzenBGColor ++ "' -fn '" ++ myFont ++ "'"
myPomodoroBar = "python2 ~/.pymodoro/pymodoro.py | dzen2 -x '0' -w '150' -y '0' -h '18' -ta 'l' -fg '" ++ myDzenFGColor ++ "' -bg '" ++ myDzenBGColor ++ "' -fn '" ++ myFont ++ "'"

myDzenPP outputPipe =  defaultPP {
    ppOutput = hPutStrLn outputPipe
    }


newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    [
    ]

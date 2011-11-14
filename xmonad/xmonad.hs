import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion

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

myLayoutHook = noBorders (Full ||| Accordion)

newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    [
        -- Increase volume
        ((0 , 0x1008ff11), spawn "amixer -q set PCM 2- unmute")
        -- Decrease Volume
        , ((0 , 0x1008ff13), spawn "amixer -q set PCM 2+ unmute")
        -- Mute
        , ((0 , 0x1008ff12), spawn "amixer -q set PCM toggle")

        -- Move focus to the next window
        , ((modMask,               xK_Tab   ), windows W.focusDown)
    
        -- Move focus to the next window
        , ((modMask,               xK_t     ), windows W.focusDown)
    
        -- Move focus to the previous window
        , ((modMask,               xK_s     ), windows W.focusUp  )
    
        -- Move focus to the master window
        , ((modMask,               xK_m     ), windows W.focusMaster  )
    
        -- Swap the focused window and the master window
        , ((modMask,               xK_Return), windows W.swapMaster)
    
        -- Swap the focused window with the next window
        , ((modMask .|. shiftMask, xK_t     ), windows W.swapDown  )
    
        -- Swap the focused window with the previous window
        , ((modMask .|. shiftMask, xK_s     ), windows W.swapUp    )
    ]

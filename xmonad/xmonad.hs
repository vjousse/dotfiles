import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion
import qualified Data.Map as M


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
        ((0 , 0x1008ff11), spawn "amixer -q set Master 2- unmute")
        -- Decrease Volume
        , ((0 , 0x1008ff13), spawn "amixer -q set Master 2+ unmute")
        -- Mute
        , ((0 , 0x1008ff12), spawn "amixer -q set Master toggle")
    ]

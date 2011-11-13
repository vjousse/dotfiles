import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Accordion


main = do
    xmonad $ defaultConfig
        { 
          terminal      = "urxvtc"
        , layoutHook = myLayoutHook
        }

myLayoutHook = noBorders (Full ||| Accordion)

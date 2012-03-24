-------------------------------------------------------------------------------
-- |
-- Module      :  Dzen
-- Copyright   :  (c) Patrick Brisbin 2010
-- License     :  as-is
--
-- Maintainer  :  pbrisbin@gmail.com
-- Stability   :  unstable
-- Portability :  unportable
-- Source      :  https://raw.github.com/pbrisbin/xmonad-config/master/lib/Dzen.hs
--
-- Provides data types and functions to easily define and spawn dzen
-- bars.
--
-- I'm not sure if the Percent stuff works on a non-Xinerama setup.
--
-- You must compile dzen with support for Xinerama if you want to define
-- a dzen for a specific screen (it uses the -xs option).
--
-------------------------------------------------------------------------------

module Dzen (
    -- * Usage
    -- $usage
      DzenConf(..)
    , DzenWidth(..)
    , TextAlign(..)
    , ScreenNum
    -- * Spawning
    , spawnDzen
    , spawnToDzen
    -- * API
    , dzen
    , dzenArgs
    -- * Example Dzens
    , defaultDzen
    , defaultDzenXft
    , nothingDzen
    ) where

import Data.List (intercalate)
import System.IO
import System.Posix.IO
import System.Posix.Types (Fd)
import System.Posix.Process (executeFile, forkProcess, createSession)

import Graphics.X11.Xlib     (openDisplay)
import Graphics.X11.Xinerama (xineramaQueryScreens, xsi_width)

-- $usage
--
-- To use, copy the source code for this module into
-- @~\/.xmonad\/lib\/Dzen.hs@ and add the following to your
-- @~\/.xmonad\/xmonad.hs@:
--
-- >
-- > import Dzen
-- > import XMonad.Hooks.DynamicLog hiding (dzen)
-- >
-- > main :: IO ()
-- > main = do
-- >     d <- spawnDzen someDzen
-- >
-- >     xmonad $ defaultConfig
-- >         { ...
-- >         , logHook = myLogHook d
-- >         }
-- >
-- > myLogHook h = dynamicLogWithPP $ defaultPP
-- >     { ...
-- >     , ppOutput = hPutStrLn h
-- >     }
--
-- If you want to feed some other process into a dzen you can use the
-- following:
--
-- > spawnToDzen "conky" someDzen
--
-- Where someDzen is a 'DzenConf' (see 'defaultDzen' for an example).
--

-- | A data type to fully describe a spawnable dzen bar, take a look at
--   @\/usr\/share\/doc\/dzen2\/README@ to see what input is acceptable.
--   Options are wrapped in 'Just', so using 'Nothing' will not add that
--   option to the @dzen2@ executable. @exec@ and @addargs@ can be
--   empty for the same purpose.
data DzenConf = DzenConf
    { xPosition :: Maybe DzenWidth -- ^ x position
    , yPosition :: Maybe Int       -- ^ y position
    , screen    :: Maybe ScreenNum -- ^ screen number (0 based, Nothing implies 0)
    , width     :: Maybe DzenWidth -- ^ width
    , height    :: Maybe Int       -- ^ line height
    , alignment :: Maybe TextAlign -- ^ alignment of title window
    , font      :: Maybe String    -- ^ font
    , fgColor   :: Maybe String    -- ^ foreground color
    , bgColor   :: Maybe String    -- ^ background color
    , exec      :: [String]        -- ^ exec flags, ex: [\"onstart=lower\", ...]
    , addargs   :: [String]        -- ^ additional arguments, ex: [\"-p\", \"-tw\", \"5\"]
    }

-- | Xinerama screen number
type ScreenNum = Int

-- | Define a width and x argument as straight pixel, or percentages
data DzenWidth = Pixels Int | Percent Double

-- | A simple data type for the text alignment of the dzen bar
data TextAlign = LeftAlign | RightAlign | Centered

-- | 'show' 'TextAlign' makes it suitable for use as a dzen argument
instance Show TextAlign where
    show LeftAlign  = "l"
    show RightAlign = "r"
    show Centered   = "c"

-- | Spawn a dzen by configuration and return its handle, behaves
--   exactly as spawnPipe but takes a 'DzenConf' as argument.
spawnDzen :: DzenConf -> IO Handle
spawnDzen d = do
    cmd      <- dzen d
    (rd, wr) <- createPipe
    h        <- setupDescriptor wr

    shellOut cmd `readingFrom` rd

    return h

-- | Spawn a process sending its stdout to the stdin of the dzen
spawnToDzen :: String -> DzenConf -> IO ()
spawnToDzen x d = do
    cmd      <- dzen d
    (rd, wr) <- createPipe

    mapM_ setupDescriptor [rd, wr]

    shellOut cmd `readingFrom` rd
    shellOut x   `writingTo`   wr

    return ()

setupDescriptor :: Fd -> IO Handle
setupDescriptor fd = do
    setFdOption fd CloseOnExec True
    h <- fdToHandle fd
    hSetBuffering h LineBuffering
    return h

readingFrom :: IO () -> Fd -> IO ()
readingFrom f rd = tieProcess rd stdInput f

writingTo :: IO () -> Fd -> IO ()
writingTo f wr = tieProcess wr stdOutput f

tieProcess :: Fd -> Fd -> IO () -> IO ()
tieProcess fd1 fd2 f = do
    _ <- forkProcess $ do
        _  <- createSession
        _  <- dupTo fd1 fd2

        f

    return ()

shellOut :: String -> IO ()
shellOut cmd = executeFile "/bin/sh" False ["-c", cmd] Nothing

-- | The full computed dzen command for a 'DzenConf'
dzen :: DzenConf -> IO String
dzen d = return . unwords . (:) "dzen2" =<< dzenArgs d

-- | The computed list of arguments for a 'DzenConf'
dzenArgs :: DzenConf -> IO [String]
dzenArgs d = do
    x <- mkWidth (screen d) (xPosition d)
    w <- mkWidth (screen d) (width d)

    let s = fmap (+1) $ screen d -- the -xs arg is 1 index

    return $ addOpt ("-fn", fmap quote $ font      d)
          ++ addOpt ("-fg", fmap quote $ fgColor   d)
          ++ addOpt ("-bg", fmap quote $ bgColor   d)
          ++ addOpt ("-ta", fmap show  $ alignment d)
          ++ addOpt ("-y" , fmap show  $ yPosition d)
          ++ addOpt ("-h" , fmap show  $ height    d)
          ++ addOpt ("-xs", fmap show s             )
          ++ addOpt ("-x" , fmap show x             )
          ++ addOpt ("-w" , fmap show w             )
          ++ addExec (exec d)
          ++ addargs d

    where
        quote = ("'"++) . (++"'")

        addOpt (_  , Nothing ) = []
        addOpt (opt, Just arg) = [opt, arg]

        addExec [] = []
        addExec es = ["-e", quote $ intercalate ";" es]

-- | Return the width of ScreenNum s (0 index), return 0 if screen
--   doesn't exist
screenWidth :: ScreenNum -> IO Double
screenWidth s = do
    dsp <- openDisplay ""
    mss <- xineramaQueryScreens dsp
    return $ case mss of
        Nothing -> 0
        Just [] -> 0
        Just ss -> if s >= 0 && s < length ss -- prevent bad index
            then fromIntegral . xsi_width $ ss !! s else 0

-- | Given a 'DzenWidth', give back the Maybe Int that can be used as an
--   argument for @-w@ or @-x@.
mkWidth :: Maybe ScreenNum -> Maybe DzenWidth -> IO (Maybe Int)
mkWidth Nothing  w                  = mkWidth (Just 0) w
mkWidth _        Nothing            = return Nothing
mkWidth (Just _) (Just (Pixels x))  = return $ Just x
mkWidth (Just s) (Just (Percent c)) = return . go =<< screenWidth s
    where
        go 0  = Nothing
        go sw = Just . round $ (c/100) * sw

-- | A default dzen configuration. Similar colors to default decorations
--   and prompts in other modules. Added options @-p@ and @-e
--   \'onstart=lower\'@ are useful for dzen-as-statusbar.
defaultDzen :: DzenConf
defaultDzen = nothingDzen
    { alignment = Just LeftAlign
    , font      = Just "-misc-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
    , fgColor   = Just "#FFFFFF"
    , bgColor   = Just "#333333"
    , exec      = ["onstart=lower"]
    , addargs   = ["-p"]
    }

-- | Same thing but with an XFT font (Verdana)
defaultDzenXft :: DzenConf
defaultDzenXft = defaultDzen { font = Just "Verdana-8" }

-- | A dzen with all options as 'Nothing' or the empty list.
nothingDzen :: DzenConf
nothingDzen = DzenConf
    { xPosition = Nothing
    , yPosition = Nothing
    , screen    = Nothing
    , width     = Nothing
    , height    = Nothing
    , alignment = Nothing
    , font      = Nothing
    , fgColor   = Nothing
    , bgColor   = Nothing
    , exec      = []
    , addargs   = []
    }

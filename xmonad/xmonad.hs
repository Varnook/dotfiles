import XMonad
import Data.Monoid

import System.IO
import System.Exit

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)

import XMonad.Layout.Gaps
import XMonad.Layout.Named
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

import XMonad.Actions.CycleWS

import Control.Monad (liftM2)

import qualified Data.Map as M

import qualified XMonad.StackSet as W



main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults


myBar = "xmobar ~/.xmonad/xmobarrc"

myPP  = def {
    ppCurrent          =       xmobarColor black magenta  ,
	ppVisible          =       xmobarColor red cyan       , 
	ppHidden           =       xmobarColor red cyan       , 
	ppHiddenNoWindows  =       xmobarColor bgcolor blue   , 
	ppVisibleNoWindows = Just( xmobarColor bgcolor blue ) ,

	ppSep   = "<fn=1>    </fn>"         ,
	ppWsSep = xmobarColor blue blue $ iconName "spacing",

	ppTitle = xmobarColor yellow bgcolor . shorten 30,

	ppLayout = const ""
}

toggleStrutsKey XConfig { XMonad.modMask = modMask } = ( modMask, xK_b )


myLayout = smartBorders (spacing 2 $ gaps [(R,3), (L,3)] $ Tall 1 (3/100) (1/2) ||| Full)


myManageHoook = composeAll [
        className =? "mpv"      --> (fullFloat <+> viewShift videoWS  ),
        className =? "Gimp"     --> (fullFloat <+> windShift drawingWS),
		className =? "Vimb"     --> (              windShift browserWS),
        className =? "Apvlv"    --> (fullFloat <+> windShift readingWS),
        className =? "Inkscape" --> (fullFloat <+> windShift drawingWS)
    ]
    where
         viewShift =  doF . liftM2 (.) W.greedyView W.shift 
         windShift = (doF . W.shift)
         fullFloat = (doF W.focusDown <+> doFullFloat)


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $ [
      -- Start Apps & Scripts
        ((modm,               xK_p), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\""),
        ((modm,               xK_w), spawn $ XMonad.terminal conf),
        ((modm,               xK_f), spawn "alacritty -e vifm"),
        ((modm,               xK_g), spawn "alacritty -e gotop"),
        ((modm,               xK_e), spawn "vimb"),
        ((modm .|. shiftMask, xK_e), spawn "exe=`dmenu -p \"Buscar en internet:\"` && eval \"vimb \\\"$exe\\\"\""),
        ((modm .|. shiftMask, xK_z), spawn "~/.bashscripts/dmenu_shutdown"),
      -- Move Windows
        ((modm,               xK_j), windows W.focusDown),
        ((modm,               xK_k), windows W.focusUp),
        ((modm,               xK_m), windows W.focusMaster),
        ((modm .|. shiftMask, xK_j), windows W.swapDown),
        ((modm .|. shiftMask, xK_k), windows W.swapUp),
      -- Resize Windows
        ((modm,               xK_h     ), sendMessage Shrink),
        ((modm,               xK_l     ), sendMessage Expand),
        ((modm,               xK_comma ), sendMessage (IncMasterN 1)),
        ((modm,               xK_period), sendMessage (IncMasterN (-1))),
      -- Closing Of Windows
        ((modm,               xK_q), kill),
        ((modm .|. shiftMask, xK_q), sequence_ [kill, toggleWS]),
      -- Exit Float Mode
        ((modm,               xK_t), withFocused $ windows . W.sink),
      -- Kill XMonad
        ((modm .|. shiftMask, xK_l), io (exitWith ExitSuccess)),
	  -- Volume
	    ((modm,          xK_KP_Add), spawn "exe=`amixer set Master 1%+`"),
	    ((modm,     xK_KP_Subtract), spawn "exe=`amixer set Master 1%-`"),
	  -- Screenshots
		((0, xK_Print), spawn "bash ~/.bashscripts/screenshots")

    ] ++ [  -- Switch & Shift Workspaces

        ((m .|. modm, k), windows $ f i) |
        (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_6] ++ [xK_F1 .. xK_F4]),
        (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]


defaults = def { 
      -- Simple
        modMask     = mod4Mask,
        terminal    = "alacritty",
		workspaces  = [mainWS, browserWS, drawingWS, readingWS, gamingWS, videoWS, iWS, iiWS, iiiWS, ivWS],
      -- Colors
		normalBorderColor  = "#efefef",
		focusedBorderColor = "#cf8ef4",
      -- Log
        logHook = workspaceHistoryHook,
      -- Position Windows
        layoutHook = myLayout,
		manageHook = myManageHoook,
      -- Keybinds
	  	keys = myKeys
    }

-- Colors 
bgcolor = "#373e4d"

black   = "#434c5e"
red     = "#fa5aa4"
green   = "#2be491"
yellow  = "#fa946e"
blue    = "#7acbea"
magenta = "#cf8ef4"
cyan    = "#89ccf7"
white   = "#f9f9f9"

-- Workspaces 
mainWS    = iconName "term"
browserWS = iconName "browser"
drawingWS = iconName "brush"  
readingWS = iconName "pdfs"   
gamingWS  = iconName "games"  
videoWS   = iconName "player" 
iWS       = iconName "one"    
iiWS      = iconName "two"    
iiiWS     = iconName "three"  
ivWS      = iconName "four"   

iconName :: String -> String
iconName str = "<icon=.xmonad/icons/" ++ str ++ ".xbm/>"

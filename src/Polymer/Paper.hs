{-# LANGUAGE OverloadedStrings #-}

module Polymer.Paper where

import Data.Monoid
import GHCJS.VDOM hiding (noProps)
--
import Vanilla.HTML
import VVDOM.Types


paperToolbar :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperToolbar = vvnode "paper-toolbar"

paperScrollHeaderPanel :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperScrollHeaderPanel = vvnode "paper-scroll-header-panel"

paperDrawerPanel :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperDrawerPanel = vvnode "paper-drawer-panel"

paperHeaderPanel :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperHeaderPanel = vvnode "paper-header-panel"


paperButton :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperButton = vvnode "paper-button"

paperDialog :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperDialog = vvnode "paper-dialog"

paperFab :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperFab = vvnode "paper-fab"

paperShadow :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperShadow = vvnode "paper-shadow"

paperTabs :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperTabs = vvnode "paper-tabs"

paperTab :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperTab = vvnode "paper-tab"

paperIconButton :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperIconButton = vvnode "paper-icon-button"

paperSpinner :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperSpinner = vvnode "paper-spinner"





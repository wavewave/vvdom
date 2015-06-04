{-# LANGUAGE OverloadedStrings #-}

module Polymer.Paper where

import Data.Monoid
import GHCJS.VDOM hiding (noProps)
--
import Vanilla.HTML
import VVDOM.Types

paperActionDialog = vvnode "paper-action-dialog"

paperButton :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperButton = vvnode "paper-button"

paperDialog = vvnode "paper-dialog"

paperFab = vvnode "paper-fab"

paperShadow :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperShadow = vvnode "paper-shadow"

paperTabs :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperTabs = vvnode "paper-tabs"

paperTab :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
paperTab = vvnode "paper-tab"

paperIconButton = vvnode "paper-icon-button"

paperSpinner = vvnode "paper-spinner"





{-# LANGUAGE OverloadedStrings #-}

module Polymer.Core where

import Data.Monoid
import GHCJS.VDOM hiding (noProps)
--
import Vanilla.HTML
import VVDOM.Types

coreAnimatedPages :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
coreAnimatedPages = vvnode "core-animated-pages"


corePages :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
corePages = vvnode "core-pages"

coreToolbar = vvnode "core-toolbar"

coreScrollHeaderPanel = vvnode "core-scroll-header-panel"


coreDrawerPanel = vvnode "core-drawer-panel"

coreHeaderPanel = vvnode "core-header-panel"

coreIcon = vvnode "core-icon"



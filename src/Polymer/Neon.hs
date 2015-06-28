{-# LANGUAGE OverloadedStrings #-}

module Polymer.Neon where

import Data.Monoid
import GHCJS.VDOM hiding (noProps)
--
import Vanilla.HTML
import VVDOM.Types

neonAnimatedPages :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
neonAnimatedPages = vvnode "neon-animated-pages"



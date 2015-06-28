{-# LANGUAGE OverloadedStrings #-}

module Polymer.Iron where

import Data.Monoid
import GHCJS.VDOM hiding (noProps)
--
import Vanilla.HTML
import VVDOM.Types


ironPages :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
ironPages = vvnode "iron-pages"

ironIcon :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
ironIcon = vvnode "iron-icon"



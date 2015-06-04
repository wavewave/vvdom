{-# LANGUAGE OverloadedStrings #-}

module Vanilla.HTML where

import Data.Monoid
import GHCJS.Foreign (newObj)
import GHCJS.VDOM hiding (div, noProps, single)
import GHCJS.VDOM.Unsafe
import GHCJS.Types
import System.IO.Unsafe
--
import VVDOM.Types 

noProps :: Properties
noProps = Properties ref where ref = unsafePerformIO newObj
{-# INLINE noProps #-}


a :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
a = vvnode "a" 

div :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
div = vvnode "div"

span :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
span = vvnode "span"


img :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
img = vvnode "img"

button :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
button = vvnode  "button"

section :: Endo [VProperty e] -> Endo [VVNode e] -> Endo [VVNode e]
section = vvnode "section"

h1 = vvnode "h1"

h2 = vvnode "h2"

h3 = vvnode "h3"

text :: JSString -> Endo [VVNode e] 
text = single . VVText 
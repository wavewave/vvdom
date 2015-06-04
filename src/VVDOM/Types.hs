{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
{-# LANGUAGE OverloadedStrings #-}

module VVDOM.Types where

import Data.Aeson
import Data.Monoid
import GHCJS.Foreign (newObj,setProp)
import GHCJS.Marshal (toJSRef)
import GHCJS.VDOM hiding (div, noProps, single)
import GHCJS.VDOM.Unsafe
import GHCJS.Types
import System.IO.Unsafe
--
-- import Event

foreign import javascript unsafe "UltraDeepClone($1)" js_ultradeepclone :: JSRef a -> IO (JSRef a)

foreign import javascript unsafe "$r = function(ev) { mycallback($1); } " 
  js_partially_applied_callback :: JSRef a -> IO (JSFun (JSRef b -> IO ()))


data VPValue e = VPVBool Bool
               | VPVString JSString 
               | VPVEvent e -- BrowserEvent
               | VPVObject (Endo [VProperty e])

data VProperty e = VPNode JSString (VPValue e)
               
sp k v = single (VPNode k (VPVString v)) 

data VVNode e = VVNode JSString (Endo [VProperty e]) (Endo [VVNode e])
              | VVText JSString

render2VNode :: (ToJSON e) => VVNode e -> VNode
render2VNode (VVText str) = GHCJS.VDOM.text str
render2VNode (VVNode str p subnodes) = 
    js_vnode str (renderVProps p) ((mkChildren . map render2VNode . flip appEndo []) subnodes)

single = Endo . (:)

vvnode s p v = single (VVNode s p v)

renderVProps :: (ToJSON e) => Endo [VProperty e] -> Properties
renderVProps ps = unsafePerformIO $ do
                    r <- newObj
                    mapM_ (renderVProp (Properties r)) (appEndo ps []) 
                    return (Properties r)

registerEventIO :: (ToJSON e) => Properties -> JSString -> e -> IO ()
registerEventIO p str e = do
    oref <- toJSRef (toJSON e)
    fref <- js_partially_applied_callback oref
    addEventHandlerIO str fref p

addEventHandlerIO :: JSString -> JSFun (JSRef () -> IO ()) -> Properties -> IO ()
addEventHandlerIO str fn (Properties prop0) = do
    -- prop' <- js_ultradeepclone prop0
    setProp str fn prop0
    transformPropertiesIO (Properties prop0)
    -- r `seq` return ()
{-# INLINE addEventHandlerIO #-}

renderVProp :: (ToJSON e) => Properties -> VProperty e -> IO ()
renderVProp (Properties p) (VPNode str (VPVBool b))   = toJSRef b >>= \bref -> setProp str bref p
renderVProp (Properties p) (VPNode str (VPVString s)) = setProp str s p
renderVProp p (VPNode str (VPVEvent e))  = registerEventIO p str e
renderVProp (Properties p) (VPNode str (VPVObject ps)) = do
    o <- newObj
    mapM_ (renderVProp (Properties o)) (appEndo ps []) 
    setProp str o p

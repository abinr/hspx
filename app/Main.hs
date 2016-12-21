module Main where

import HttpProxy

import qualified Snap.Core as Snap
import qualified Snap.Http.Server as Server
import qualified Data.ByteString.Lazy as LB
import Control.Applicative
import Control.Monad.IO.Class

main :: IO ()
main =
  Server.quickHttpServe site

site :: Snap.Snap ()
site = do
  resp <- liftIO $ (HttpProxy.proxy "http://www.google.com")
  Snap.writeLBS resp

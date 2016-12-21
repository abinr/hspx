{-# LANGUAGE OverloadedStrings #-}

module HttpProxy
    ( proxy
    ) where

import qualified Data.ByteString.Lazy as LB
import qualified Network.HTTP.Client as Client
  
proxy :: String -> IO LB.ByteString
proxy path = do
  manager <- Client.newManager Client.defaultManagerSettings
  request <- Client.parseRequest path
  response <- Client.httpLbs request manager
  return (Client.responseBody response)

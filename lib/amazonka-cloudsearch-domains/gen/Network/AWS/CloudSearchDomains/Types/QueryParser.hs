{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudSearchDomains.Types.QueryParser
-- Copyright   : (c) 2013-2020 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.CloudSearchDomains.Types.QueryParser where

import Network.AWS.Prelude

data QueryParser
  = Dismax
  | Lucene
  | Simple
  | Structured
  deriving
    ( Eq,
      Ord,
      Read,
      Show,
      Enum,
      Bounded,
      Data,
      Typeable,
      Generic
    )

instance FromText QueryParser where
  parser =
    takeLowerText >>= \case
      "dismax" -> pure Dismax
      "lucene" -> pure Lucene
      "simple" -> pure Simple
      "structured" -> pure Structured
      e ->
        fromTextError $
          "Failure parsing QueryParser from value: '" <> e
            <> "'. Accepted values: dismax, lucene, simple, structured"

instance ToText QueryParser where
  toText = \case
    Dismax -> "dismax"
    Lucene -> "lucene"
    Simple -> "simple"
    Structured -> "structured"

instance Hashable QueryParser

instance NFData QueryParser

instance ToByteString QueryParser

instance ToQuery QueryParser

instance ToHeader QueryParser

instance ToJSON QueryParser where
  toJSON = toJSONText
{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_05_01.DescribeNetworkInterfaceAttribute
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes a network interface attribute. You can specify only one attribute
-- at a time. Example This example describes the sourceDestCheck attribute of
-- the specified network interface.
-- https://ec2.amazonaws.com/?Action=DescribeNetworkInterfaceAttribute
-- &amp;NetworkInterfaceId=eni-686ea200 &amp;Attribute=sourceDestCheck
-- &amp;AUTHPARAMS &lt;DescribeNetworkInterfaceAttributeResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;7a20c6b2-d71c-45fb-bba7-37306850544b&lt;/requestId&gt;
-- &lt;networkInterfaceId&gt;eni-686ea200&lt;/networkInterfaceId&gt;
-- &lt;sourceDestCheck&gt; &lt;value&gt;true&lt;/value&gt;
-- &lt;/sourceDestCheck&gt;
-- &lt;/DescribeNetworkInterfaceAttributeResponse&gt;.
module Network.AWS.EC2.V2014_05_01.DescribeNetworkInterfaceAttribute where

import           Control.Applicative
import           Data.ByteString      (ByteString)
import           Data.Default
import           Data.HashMap.Strict  (HashMap)
import           Data.Maybe
import           Data.Monoid
import           Data.Text            (Text)
import qualified Data.Text            as Text
import           GHC.Generics
import           Network.AWS.Data
import           Network.AWS.Response
import           Network.AWS.Types    hiding (Error)
import           Network.AWS.Request.Query
import           Network.AWS.EC2.V2014_05_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data DescribeNetworkInterfaceAttribute = DescribeNetworkInterfaceAttribute
    { _dniarNetworkInterfaceId :: Text
      -- ^ The ID of the network interface.
    , _dniarDryRun :: Bool
      -- ^ 
    , _dniarGroups :: Text
      -- ^ The groupSet attribute.
    , _dniarSourceDestCheck :: Text
      -- ^ The sourceDestCheck attribute.
    , _dniarAttachment :: Text
      -- ^ The attachment attribute.
    , _dniarDescription :: Text
      -- ^ The description attribute.
    } deriving (Generic)

instance ToQuery DescribeNetworkInterfaceAttribute where
    toQuery = genericToQuery def

instance AWSRequest DescribeNetworkInterfaceAttribute where
    type Sv DescribeNetworkInterfaceAttribute = EC2
    type Rs DescribeNetworkInterfaceAttribute = DescribeNetworkInterfaceAttributeResponse

    request = post "DescribeNetworkInterfaceAttribute"

    response _ = xmlResponse

data DescribeNetworkInterfaceAttributeResponse = DescribeNetworkInterfaceAttributeResponse
    { _dniasSourceDestCheck :: Maybe AttributeBooleanValue
      -- ^ Indicates whether source/destination checking is enabled.
    , _dniasDescription :: Maybe AttributeValue
      -- ^ The description of the network interface.
    , _dniasGroups :: [GroupIdentifier]
      -- ^ The security groups associated with the network interface.
    , _dniasAttachment :: Maybe NetworkInterfaceAttachment
      -- ^ The attachment (if any) of the network interface.
    , _dniasNetworkInterfaceId :: Maybe Text
      -- ^ The ID of the network interface.
    } deriving (Generic)

instance FromXML DescribeNetworkInterfaceAttributeResponse where
    fromXMLOptions = xmlOptions

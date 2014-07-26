{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_05_01.ReplaceRoute
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Replaces an existing route within a route table in a VPC. You must provide
-- only one of the following: Internet gateway, NAT instance, VPC peering
-- connection, or network interface. For more information about route tables,
-- see Route Tables in the Amazon Virtual Private Cloud User Guide. Example
-- This example replaces a route in the specified route table. The new route
-- matches the CIDR 10.0.0.0/8 and sends the traffic to the virtual private
-- gateway with the ID vgw-1d00376e.
-- https://ec2.amazonaws.com/?Action=ReplaceRoute
-- &amp;RouteTableId=rtb-e4ad488d &amp;DestinationCidrBlock=10.0.0.0/8
-- &amp;GatewayId=vgw-1d00376e &amp;AUTHPARAMS &lt;ReplaceRouteResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt; &lt;/ReplaceRouteResponse&gt;.
module Network.AWS.EC2.V2014_05_01.ReplaceRoute where

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

data ReplaceRoute = ReplaceRoute
    { _rrrRouteTableId :: Text
      -- ^ The ID of the route table.
    , _rrrDestinationCidrBlock :: Text
      -- ^ The CIDR address block used for the destination match. The value
      -- you provide must match the CIDR of an existing route in the
      -- table.
    , _rrrDryRun :: Bool
      -- ^ 
    , _rrrVpcPeeringConnectionId :: Text
      -- ^ The ID of a VPC peering connection.
    , _rrrInstanceId :: Text
      -- ^ The ID of a NAT instance in your VPC.
    , _rrrNetworkInterfaceId :: Text
      -- ^ The ID of a network interface.
    , _rrrGatewayId :: Text
      -- ^ The ID of an Internet gateway attached to your VPC.
    } deriving (Generic)

instance ToQuery ReplaceRoute where
    toQuery = genericToQuery def

instance AWSRequest ReplaceRoute where
    type Sv ReplaceRoute = EC2
    type Rs ReplaceRoute = ReplaceRouteResponse

    request = post "ReplaceRoute"

    response _ _ = return (Right ReplaceRouteResponse)

data ReplaceRouteResponse = ReplaceRouteResponse
    deriving (Eq, Show, Generic)

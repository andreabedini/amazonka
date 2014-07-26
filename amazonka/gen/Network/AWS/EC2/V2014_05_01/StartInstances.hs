{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_05_01.StartInstances
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Starts an Amazon EBS-backed AMI that you've previously stopped. Instances
-- that use Amazon EBS volumes as their root devices can be quickly stopped
-- and started. When an instance is stopped, the compute resources are
-- released and you are not billed for hourly instance usage. However, your
-- root partition Amazon EBS volume remains, continues to persist your data,
-- and you are charged for Amazon EBS volume usage. You can restart your
-- instance at any time. Each time you transition an instance from stopped to
-- started, Amazon EC2 charges a full instance hour, even if transitions
-- happen multiple times within a single hour. Before stopping an instance,
-- make sure it is in a state from which it can be restarted. Stopping an
-- instance does not preserve data stored in RAM. Performing this operation on
-- an instance that uses an instance store as its root device returns an
-- error. For more information, see Stopping Instances in the Amazon Elastic
-- Compute Cloud User Guide. Example This example starts the specified
-- instance. https://ec2.amazonaws.com/?Action=StartInstances
-- &amp;InstanceId.1=i-10a64379 &amp;AUTHPARAMS &lt;StartInstancesResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;instancesSet&gt; &lt;item&gt;
-- &lt;instanceId&gt;i-10a64379&lt;/instanceId&gt; &lt;currentState&gt;
-- &lt;code&gt;0&lt;/code&gt; &lt;name&gt;pending&lt;/name&gt;
-- &lt;/currentState&gt; &lt;previousState&gt; &lt;code&gt;80&lt;/code&gt;
-- &lt;name&gt;stopped&lt;/name&gt; &lt;/previousState&gt; &lt;/item&gt;
-- &lt;/instancesSet&gt; &lt;/StartInstancesResponse&gt;.
module Network.AWS.EC2.V2014_05_01.StartInstances where

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

data StartInstances = StartInstances
    { _sitInstanceIds :: [Text]
      -- ^ One or more instance IDs.
    , _sitDryRun :: Bool
      -- ^ 
    , _sitAdditionalInfo :: Text
      -- ^ 
    } deriving (Generic)

instance ToQuery StartInstances where
    toQuery = genericToQuery def

instance AWSRequest StartInstances where
    type Sv StartInstances = EC2
    type Rs StartInstances = StartInstancesResponse

    request = post "StartInstances"

    response _ = xmlResponse

data StartInstancesResponse = StartInstancesResponse
    { _siuStartingInstances :: [InstanceStateChange]
      -- ^ Information about one or more started instances.
    } deriving (Generic)

instance FromXML StartInstancesResponse where
    fromXMLOptions = xmlOptions

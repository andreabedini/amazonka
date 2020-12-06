{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Greengrass.GetLoggerDefinitionVersion
-- Copyright   : (c) 2013-2020 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves information about a logger definition version.
module Network.AWS.Greengrass.GetLoggerDefinitionVersion
  ( -- * Creating a Request
    getLoggerDefinitionVersion,
    GetLoggerDefinitionVersion,

    -- * Request Lenses
    gldvNextToken,
    gldvLoggerDefinitionVersionId,
    gldvLoggerDefinitionId,

    -- * Destructuring the Response
    getLoggerDefinitionVersionResponse,
    GetLoggerDefinitionVersionResponse,

    -- * Response Lenses
    gldvrsDefinition,
    gldvrsARN,
    gldvrsCreationTimestamp,
    gldvrsVersion,
    gldvrsId,
    gldvrsResponseStatus,
  )
where

import Network.AWS.Greengrass.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getLoggerDefinitionVersion' smart constructor.
data GetLoggerDefinitionVersion = GetLoggerDefinitionVersion'
  { _gldvNextToken ::
      !(Maybe Text),
    _gldvLoggerDefinitionVersionId ::
      !Text,
    _gldvLoggerDefinitionId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetLoggerDefinitionVersion' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gldvNextToken' - The token for the next set of results, or ''null'' if there are no additional results.
--
-- * 'gldvLoggerDefinitionVersionId' - The ID of the logger definition version. This value maps to the ''Version'' property of the corresponding ''VersionInformation'' object, which is returned by ''ListLoggerDefinitionVersions'' requests. If the version is the last one that was associated with a logger definition, the value also maps to the ''LatestVersion'' property of the corresponding ''DefinitionInformation'' object.
--
-- * 'gldvLoggerDefinitionId' - The ID of the logger definition.
getLoggerDefinitionVersion ::
  -- | 'gldvLoggerDefinitionVersionId'
  Text ->
  -- | 'gldvLoggerDefinitionId'
  Text ->
  GetLoggerDefinitionVersion
getLoggerDefinitionVersion
  pLoggerDefinitionVersionId_
  pLoggerDefinitionId_ =
    GetLoggerDefinitionVersion'
      { _gldvNextToken = Nothing,
        _gldvLoggerDefinitionVersionId = pLoggerDefinitionVersionId_,
        _gldvLoggerDefinitionId = pLoggerDefinitionId_
      }

-- | The token for the next set of results, or ''null'' if there are no additional results.
gldvNextToken :: Lens' GetLoggerDefinitionVersion (Maybe Text)
gldvNextToken = lens _gldvNextToken (\s a -> s {_gldvNextToken = a})

-- | The ID of the logger definition version. This value maps to the ''Version'' property of the corresponding ''VersionInformation'' object, which is returned by ''ListLoggerDefinitionVersions'' requests. If the version is the last one that was associated with a logger definition, the value also maps to the ''LatestVersion'' property of the corresponding ''DefinitionInformation'' object.
gldvLoggerDefinitionVersionId :: Lens' GetLoggerDefinitionVersion Text
gldvLoggerDefinitionVersionId = lens _gldvLoggerDefinitionVersionId (\s a -> s {_gldvLoggerDefinitionVersionId = a})

-- | The ID of the logger definition.
gldvLoggerDefinitionId :: Lens' GetLoggerDefinitionVersion Text
gldvLoggerDefinitionId = lens _gldvLoggerDefinitionId (\s a -> s {_gldvLoggerDefinitionId = a})

instance AWSRequest GetLoggerDefinitionVersion where
  type
    Rs GetLoggerDefinitionVersion =
      GetLoggerDefinitionVersionResponse
  request = get greengrass
  response =
    receiveJSON
      ( \s h x ->
          GetLoggerDefinitionVersionResponse'
            <$> (x .?> "Definition")
            <*> (x .?> "Arn")
            <*> (x .?> "CreationTimestamp")
            <*> (x .?> "Version")
            <*> (x .?> "Id")
            <*> (pure (fromEnum s))
      )

instance Hashable GetLoggerDefinitionVersion

instance NFData GetLoggerDefinitionVersion

instance ToHeaders GetLoggerDefinitionVersion where
  toHeaders =
    const
      ( mconcat
          ["Content-Type" =# ("application/x-amz-json-1.1" :: ByteString)]
      )

instance ToPath GetLoggerDefinitionVersion where
  toPath GetLoggerDefinitionVersion' {..} =
    mconcat
      [ "/greengrass/definition/loggers/",
        toBS _gldvLoggerDefinitionId,
        "/versions/",
        toBS _gldvLoggerDefinitionVersionId
      ]

instance ToQuery GetLoggerDefinitionVersion where
  toQuery GetLoggerDefinitionVersion' {..} =
    mconcat ["NextToken" =: _gldvNextToken]

-- | /See:/ 'getLoggerDefinitionVersionResponse' smart constructor.
data GetLoggerDefinitionVersionResponse = GetLoggerDefinitionVersionResponse'
  { _gldvrsDefinition ::
      !( Maybe
           LoggerDefinitionVersion
       ),
    _gldvrsARN ::
      !(Maybe Text),
    _gldvrsCreationTimestamp ::
      !(Maybe Text),
    _gldvrsVersion ::
      !(Maybe Text),
    _gldvrsId ::
      !(Maybe Text),
    _gldvrsResponseStatus ::
      !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetLoggerDefinitionVersionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gldvrsDefinition' - Information about the logger definition version.
--
-- * 'gldvrsARN' - The ARN of the logger definition version.
--
-- * 'gldvrsCreationTimestamp' - The time, in milliseconds since the epoch, when the logger definition version was created.
--
-- * 'gldvrsVersion' - The version of the logger definition version.
--
-- * 'gldvrsId' - The ID of the logger definition version.
--
-- * 'gldvrsResponseStatus' - -- | The response status code.
getLoggerDefinitionVersionResponse ::
  -- | 'gldvrsResponseStatus'
  Int ->
  GetLoggerDefinitionVersionResponse
getLoggerDefinitionVersionResponse pResponseStatus_ =
  GetLoggerDefinitionVersionResponse'
    { _gldvrsDefinition = Nothing,
      _gldvrsARN = Nothing,
      _gldvrsCreationTimestamp = Nothing,
      _gldvrsVersion = Nothing,
      _gldvrsId = Nothing,
      _gldvrsResponseStatus = pResponseStatus_
    }

-- | Information about the logger definition version.
gldvrsDefinition :: Lens' GetLoggerDefinitionVersionResponse (Maybe LoggerDefinitionVersion)
gldvrsDefinition = lens _gldvrsDefinition (\s a -> s {_gldvrsDefinition = a})

-- | The ARN of the logger definition version.
gldvrsARN :: Lens' GetLoggerDefinitionVersionResponse (Maybe Text)
gldvrsARN = lens _gldvrsARN (\s a -> s {_gldvrsARN = a})

-- | The time, in milliseconds since the epoch, when the logger definition version was created.
gldvrsCreationTimestamp :: Lens' GetLoggerDefinitionVersionResponse (Maybe Text)
gldvrsCreationTimestamp = lens _gldvrsCreationTimestamp (\s a -> s {_gldvrsCreationTimestamp = a})

-- | The version of the logger definition version.
gldvrsVersion :: Lens' GetLoggerDefinitionVersionResponse (Maybe Text)
gldvrsVersion = lens _gldvrsVersion (\s a -> s {_gldvrsVersion = a})

-- | The ID of the logger definition version.
gldvrsId :: Lens' GetLoggerDefinitionVersionResponse (Maybe Text)
gldvrsId = lens _gldvrsId (\s a -> s {_gldvrsId = a})

-- | -- | The response status code.
gldvrsResponseStatus :: Lens' GetLoggerDefinitionVersionResponse Int
gldvrsResponseStatus = lens _gldvrsResponseStatus (\s a -> s {_gldvrsResponseStatus = a})

instance NFData GetLoggerDefinitionVersionResponse
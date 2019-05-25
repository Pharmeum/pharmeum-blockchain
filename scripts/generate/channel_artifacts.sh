# Copyright 2019 Pharmeum
# Developed by Highchain Software https://highchain.io/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------
#!/usr/bin/env bash


export CHANNEL_NAME="pharmeum-channel"
export FABRIC_CFG_PATH=$PWD/fabric-utils

export FABRIC_ROOT=$PWD
export FABRIC_CFG_PATH=$PWD/fabric-utils


mkdir ./fabric-utils/channel-artifacts

./bin/configtxgen -profile PharmeumOrdererGenesis -outputBlock ./fabric-utils/channel-artifacts/orderer.genesis.block -channelID $CHANNEL_NAME
./bin/configtxgen -profile PharmeumChannel -outputCreateChannelTx ./fabric-utils/channel-artifacts/channel.tx -channelID $CHANNEL_NAME
./bin/configtxgen -profile PharmeumChannel -outputAnchorPeersUpdate ./fabric-utils/channel-artifacts/PharmeumMSPAnchors.tx -channelID $CHANNEL_NAME -asOrg PharmeumMSP
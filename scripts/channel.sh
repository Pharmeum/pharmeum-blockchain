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
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/pharmeum.io/orderers/orderer.pharmeum.io/msp/tlscacerts/tlsca.pharmeum.io-cert.pem
docker exec cli peer channel create -o orderer.pharmeum.io:7050 -c pharmeum-channel -f ./channel-artifacts/channel.tx --tls --cafile $ORDERER_CA
docker exec cli peer channel join -b ./channel-artifacts/orderer.genesis.block --tls --cafile $ORDERER_CA
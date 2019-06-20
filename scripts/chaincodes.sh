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

#set -e

cd ../pharmeum-cc-payment/
export PAYMENTCCVERSION=1.0
#$(git rev-parse HEAD)
cd ../pharmeum-blockchain

export PAYMENTCCNAME="pharmeumccpayment"
export PAYMENTCCCODE="github.com/Pharmeum/pharmeum-cc-payment/"
#export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/pharmeum.io/orderers/orderer.pharmeum.io/msp/tlscacerts/tlsca.pharmeum.io-cert.pem

export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/pharmeum.io/orderers/reserved_orderer.pharmeum.io/msp/tlscacerts/tlsca.pharmeum.io-cert.pem


export LANGUAGE="golang"

#install chaincode
docker exec cli peer chaincode install -n $PAYMENTCCNAME -v $PAYMENTCCVERSION -l ${LANGUAGE} -p $PAYMENTCCCODE
docker exec cli peer chaincode instantiate -o orderer.pharmeum.io:7050 --tls true --cafile $ORDERER_CA -C pharmeum-channel \
        -n $PAYMENTCCNAME -l $LANGUAGE -v $PAYMENTCCVERSION -c '{"Args":[]}' -c '{"Args":[]}' -P "OR ('PharmeumMSP.peer')"
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

export COMPOSE_PROJECT_NAME=pharmeum

case $1 in
"up")
    #check if binaries folder not exists
    if [[ ! -d "bin" ]]; then
        ./scripts/install.sh
    fi
    ./scripts/remove/configs_and_artifacts.sh
    ./scripts/remove/compose-file.sh
    ./scripts/generate/configs.sh
    ./scripts/generate/channel_artifacts.sh
    ./scripts/replace.sh

    cd ..

    if [[ ! -d "pharmeum-cc-payment" ]]; then
        echo "cloning pharmeum payment chaincode"
        git clone git@github.com:Pharmeum/pharmeum-cc-payment.git
    fi

    cd pharmeum-cc-payment && git pull
    cd ../pharmeum-blockchain/


    docker-compose -f ./fabric-utils/docker-compose.yaml up -d
    ./scripts/channel.sh
    ./scripts/chaincodes.sh
    ;;
"down")
    docker-compose -f ./fabric-utils/docker-compose.yaml down
    if [[ -d "./fabric-utils/docker-compose.yaml" ]]; then
        rm ./fabric-utils/docker-compose.yaml
    fi
    if [[ -d "./fabric-utils/channel-artifacts" ]]; then
        rm -rf ./fabric-utils/channel-artifacts/
    fi
    if [[ -d "./fabric-utils/crypto-config" ]]; then
        rm -rf ./fabric-utils/crypto-config/
    fi
    ;;
"start")
    #TODO: IMPLEMENT
    echo "start command is not supported yet, use 'up' instead"
    ;;
"stop")
    # Exit on first error, print all commands.
    set -ev
    # Shut down the Docker containers that might be currently running.
    docker-compose -f ./fabric-utils/docker-compose.yaml stop
    ;;
*)
  echo "supported commands: [up|down|start|stop]"
  ;;
esac
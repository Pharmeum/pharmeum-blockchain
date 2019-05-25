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

# remove old channel-artifacts
function RemoveChannelArtifacts(){
    cd fabric-utils
    if [[ -d "channel-artifacts" ]]; then
        echo "removing channel-artifacts"
        rm -rf channel-artifacts
    fi
    cd ..
}

# remove old crypto-config
function RemoveCryptoConfigs(){
    cd fabric-utils
    if [[ -d "crypto-config" ]]; then
        echo "removing crypto-config"
        rm -rf crypto-config
    fi
}

RemoveChannelArtifacts
RemoveCryptoConfigs
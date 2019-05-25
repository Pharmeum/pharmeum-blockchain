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

PHARMEUM_CA_PRIVATE_KEY=$(find ./fabric-utils/crypto-config/peerOrganizations/pharmeum.io/ca/*_sk  -printf "%f")
cp ./fabric-utils/template.yaml ./fabric-utils/docker-compose.yaml
sed -i "s/PHARMEUM_CA_PRIVATE_KEY/${PHARMEUM_CA_PRIVATE_KEY}/g" ./fabric-utils/docker-compose.yaml
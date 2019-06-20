# Pharmeum Blockchain

## Installation

The scripts/bootstrap.sh script will preload all of the requisite docker images for Hyperledger Fabric and tag them with the 'latest' tag. Optionally, specify a version for fabric, fabric-ca and thirdparty images. Default versions are 1.4.0, 1.4.0 and 0.4.14 respectively.
./scripts/bootstrap.sh [version] [ca version] [thirdparty_version]

### Pre-requirements

* Docker   
* Golang

### Hyperledger Fabric network configurations
1 x Peer v1.4.1  
2 x Order v1.4.1 
1 x CouchDB latest version  
1 x CA v1.4.1

### How to run the Pharmeum network? 

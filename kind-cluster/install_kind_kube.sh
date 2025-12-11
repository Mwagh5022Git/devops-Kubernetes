#!/bin/bash

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

VERSION="v1.30.0"
URL="https://dl.k8s.io/release/${VERSON}/bin/linux/amd64/kubectl"
INSTALL_DIR="/usr/local/bin"

curl -L0 "$URL"
chmod =x kubectl
sudo mv kubectl $INSTALL_DIR/
kubectl version --client
rm -f kubectl
rm -rf kind

echo " kind & kubectl installsion complete. "

for save and exit press : Esc + :wq

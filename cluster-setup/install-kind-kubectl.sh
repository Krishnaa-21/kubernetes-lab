#!/bin/bash

set -e

ARCH=$(uname -m)

# Detect Architecture
if [ "$ARCH" = "x86_64" ]; then
    KIND_URL="https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64"
    KUBE_ARCH="amd64"

elif [ "$ARCH" = "aarch64" ]; then
    KIND_URL="https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-arm64"
    KUBE_ARCH="arm64"

else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

echo "Installing Kind..."

curl -Lo kind "$KIND_URL"
chmod +x kind
sudo mv kind /usr/local/bin/

echo "Installing kubectl..."

VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

curl -LO \
"https://dl.k8s.io/release/${VERSION}/bin/linux/${KUBE_ARCH}/kubectl"

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "Verifying Installation..."

kind version
kubectl version --client

rm -f kubectl

echo "Installation completed successfully!"

Make executable:

chmod +x install-kind-kubectl.sh

Run:

./install-kind-kubectl.sh
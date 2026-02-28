#!/usr/bin/env bash
set -euo pipefail

echo "================================================="
echo " Installing WSL2 / AWS Dev Tools   "
echo "================================================="

# 1. Update system packages
echo "[1/7] Updating system packages..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y curl unzip git jq gettext bash-completion python3 python3-pip wget

# 2. AWS CLI v2
if ! command -v aws &> /dev/null; then
    echo "[2/7] Installing AWS CLI v2..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip -q awscliv2.zip
    sudo ./aws/install
    rm -rf awscliv2.zip aws
else
    echo "[2/7] AWS CLI v2 is already installed."
fi

# 3. kubectl (v1.30.0)
if ! command -v kubectl &> /dev/null; then
    echo "[3/7] Installing kubectl v1.30.0..."
    curl -LO "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/
else
    echo "[3/7] kubectl is already installed."
fi

# 4. eksctl
if ! command -v eksctl &> /dev/null; then
    echo "[4/7] Installing eksctl..."
    curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin/
else
    echo "[4/7] eksctl is already installed."
fi

# 5. Helm v3
if ! command -v helm &> /dev/null; then
    echo "[5/7] Installing Helm v3..."
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    rm get_helm.sh
else
    echo "[5/7] Helm is already installed."
fi

# 6. k9s
if ! command -v k9s &> /dev/null; then
    echo "[6/7] Installing k9s..."
    curl -sS https://webinstall.dev/k9s | bash || true
    export PATH="$HOME/.local/bin:$PATH"
    if ! grep -q '$HOME/.local/bin' ~/.bashrc 2>/dev/null; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    fi
else
    echo "[6/7] k9s is already installed."
fi

# 7. yq
if ! command -v yq &> /dev/null; then
    echo "[7/7] Installing yq..."
    sudo wget -q https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
    sudo chmod +x /usr/local/bin/yq
else
    echo "[7/7] yq is already installed."
fi

echo "================================================="
echo " DONE! Run 'source ~/.bashrc' or restart terminal."
echo "================================================="

# 04 - CLI Tools & Kubernetes Tooling Installation

This document describes how to install the requisite command-line tools inside your WSL2 environment (`AWS CLI v2`, `kubectl`, `helm`, `eksctl`, and `Docker`).

---

## Option 1: Automated Installation (Recommended)

Run the included automated setup script inside WSL2:

```bash
chmod +x scripts/install-all.sh
./scripts/install-all.sh
```

The script will automatically detect missing packages and install:
- AWS CLI v2
- `kubectl` (v1.30+)
- `helm` (v3+)
- `eksctl` (v0.180+)
- Docker Engine & Docker Compose CLI plugin

---

## Option 2: Manual Installation Steps

If you prefer installing tools manually inside WSL2:

### 1. AWS CLI v2
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/
```

### 2. kubectl
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
```

### 3. Helm v3
```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

### 4. eksctl
```bash
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
rm eksctl_$PLATFORM.tar.gz
```

---

## Verification

Verify that all tools are accessible in your `$PATH`:

```bash
aws --version
kubectl version --client
helm version
eksctl version
docker --version
```

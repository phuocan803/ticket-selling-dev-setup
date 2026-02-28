# 06 - Environment Verification & Rancher GUI Management

This guide explains how to run pre-flight environment checks and initialize Rancher GUI for visual Kubernetes cluster management.

---

## Step 1: Run Pre-Flight Verification

Execute the verification script to validate all CLI tools and AWS connectivity:

```bash
chmod +x scripts/verify.sh
./scripts/verify.sh
```

**Expected Result:**
```text
[OK] AWS CLI configured: Account 123456789012 (us-east-1)
[OK] kubectl v1.30.0 installed
[OK] helm v3.14.0 installed
[OK] eksctl v0.180.0 installed
[OK] Docker engine running
```

---

## Step 2: Launch Rancher Management GUI

Rancher provides a web interface to inspect Kubernetes Pods, Deployments, Nodes, KEDA Custom Resources (`ScaledObjects`), and live container logs.

Navigate to the Rancher tool directory and start the Docker container:

```bash
cd tools/rancher
docker compose up -d
```

### Accessing Rancher:
1. Open your browser on Windows and navigate to:
   - HTTPS: `https://localhost:4468`
   - HTTP: `http://localhost:4467`
2. **First Login Setup**:
   - Retrieve the initial bootstrap password from the container logs:
     ```bash
     docker logs rancher 2>&1 | grep "Bootstrap Password:"
     ```
   - Set a new administrator password when prompted.

3. **Importing EKS Cluster**:
   - In Rancher, click **Add Cluster** -> **Import Existing Cluster**.
   - Copy the provided `kubectl apply` registration command and run it in your WSL2 terminal to connect your EKS cluster.

---

## Stopping Rancher

When done testing, stop the Rancher container to free system resources:

```bash
cd tools/rancher
docker compose down
```

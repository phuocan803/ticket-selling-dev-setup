# 05 - VS Code & AWS Toolkit Configuration

Connect Visual Studio Code directly to your WSL2 Linux environment for seamless cloud-native development.

---

## Step 1: Install Recommended VS Code Extensions

Open VS Code on Windows and install the following extensions from the Visual Studio Marketplace:

1. **WSL** (`ms-vscode-remote.remote-wsl`)
   - Allows VS Code to run its backend server inside WSL2.
2. **AWS Toolkit** (`amazonwebservices.aws-toolkit-vscode`)
   - Resource explorer for S3, CloudWatch logs, Lambda, EKS, and IAM credentials selector.
3. **Kubernetes** (`ms-kubernetes-tools.vscode-kubernetes-tools`)
   - View pods, deployments, logs, and ScaledObjects inside VS Code sidebars.
4. **Docker** (`ms-azuretools.vscode-docker`)
   - Manage containers, images, and docker-compose files.
5. **HashiCorp Terraform** (`hashicorp.terraform`)
   - Syntax highlighting and autocomplete for `.tf` files.

---

## Step 2: Open Project inside WSL2

From your WSL2 Ubuntu terminal, navigate to the repository directory and type:

```bash
cd /home/bean/git-recall/nt533/ticket-selling-dev-setup
code .
```

VS Code will open connected directly to the WSL2 Ubuntu environment (indicated by `WSL: Ubuntu` in the bottom-left corner of the status bar).

---

## Step 3: AWS Toolkit Connection Check

1. Click the **AWS icon** on the left Activity Bar of VS Code.
2. Select your active AWS Region (`us-east-1`).
3. Verify that your credentials automatically populate S3 buckets, EKS clusters, and CloudWatch logs.

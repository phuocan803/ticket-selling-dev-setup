# 03 - AWS Credentials & WSL2 Setup

This guide details how to configure WSL2 (Ubuntu) and authenticate the AWS CLI.

---

## Step 1: Install WSL2 & Ubuntu

Open PowerShell as Administrator on Windows and run:

```powershell
wsl --install -d Ubuntu-22.04
```

After installation completes, restart your computer if prompted. Set up your Ubuntu UNIX username and password when requested.

Verify WSL version in PowerShell:

```powershell
wsl --list --verbose
```
*(Ensure the VERSION column displays `2` for your Ubuntu distribution).*

---

## Step 2: Configure AWS Credentials

Choose the method corresponding to your AWS Account type:

### Option A: Standard IAM User (Personal AWS Account)
1. Navigate to **AWS Management Console** -> **IAM** -> **Users** -> **Create Access Key**.
2. Select **Command Line Interface (CLI)** and copy your `Access Key ID` and `Secret Access Key`.
3. Open your WSL2 terminal and execute:

```bash
aws configure
```
Input your values:
```text
AWS Access Key ID [None]: AKIAXXXXXXXXXXXXXXXX
AWS Secret Access Key [None]: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Default region name [None]: us-east-1
Default output format [None]: json
```

### Option B: Temporary Credentials (AWS Academy / Vocareum Sandbox)
1. Open the lab session details in your AWS Academy portal.
2. Click **AWS Details** -> **CLI Credentials** and copy the temporary environment block.
3. Paste directly into `~/.aws/credentials` inside WSL2:

```bash
cat > ~/.aws/credentials << 'EOF'
[default]
aws_access_key_id=ASIA...
aws_secret_access_key=...
aws_session_token=...
EOF
```

---

## Step 3: Verify AWS Authentication

Execute caller identity check inside WSL2:

```bash
aws sts get-caller-identity
```

**Expected Output:**
```json
{
    "UserId": "AIDAXXXXXXXXXXXXXXXXX",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/admin-dev"
}
```

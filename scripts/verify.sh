#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "================================================="
echo " Verifying Cloud-Native Development Environment "
echo "================================================="

COMMANDS=("aws" "kubectl" "eksctl" "helm" "git" "docker" "jq" "yq")

ALL_PASSED=true

for CMD in "${COMMANDS[@]}"; do
    if command -v "$CMD" &> /dev/null; then
        PATH_CMD=$(which "$CMD")
        echo -e "${GREEN}[OK]${NC} $CMD -> $PATH_CMD"
    else
        echo -e "${RED}[MISSING]${NC} $CMD is NOT installed."
        ALL_PASSED=false
    fi
done

echo "-------------------------------------------------"
echo " Checking AWS CLI Credentials..."
if aws sts get-caller-identity &> /dev/null; then
    ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text 2>/dev/null || echo "Unknown")
    ARN=$(aws sts get-caller-identity --query "Arn" --output text 2>/dev/null || echo "Unknown")
    echo -e "${GREEN}[OK]${NC} AWS Authenticated (Account: $ACCOUNT_ID, ARN: $ARN)"
else
    echo -e "${RED}[WARNING]${NC} AWS CLI credentials not configured or expired. Run 'aws configure'."
fi

echo "================================================="
if [ "$ALL_PASSED" = true ]; then
    echo -e "${GREEN}SUCCESS:${NC} All required tools are installed and ready."
else
    echo -e "${RED}ACTION REQUIRED:${NC} Please run './scripts/install-all.sh' to install missing tools."
fi

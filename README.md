# Ticket Selling Dev Setup 

Welcome to the **Ticket Selling Local Workstation Setup Guide**. This repository provides complete instructions and automated scripts to establish a cloud-native development environment on Windows (using VS Code, WSL2 Ubuntu, and AWS CLI / Kubernetes tools) as a modern replacement for AWS Cloud9.

---

## Repository Structure

```text
ticket-selling-dev-setup/
├── docs/                           # Step-by-step documentation guides (01-06)
├── scripts/                        # Automated installation & environment verification scripts
└── tools/
    └── rancher/                    # Docker Compose setup for Rancher Kubernetes GUI
```

---

## Related Repositories

- **`ticket-selling-dev-setup`** (Current Repository): Local workstation setup guides, scripts, and Rancher Kubernetes GUI.
- **[`ticket-selling-keda`](https://github.com/phuocan803/ticket-selling-keda)**: EKS cluster IaC (Terraform), KEDA ScaledObjects, ADOT Collector, Prometheus/SigV4 monitoring, load tests (k6/Locust), and HPA baseline.
- **[`ticket-selling-sample-application`](https://github.com/phuocan803/ticket-selling-sample-application)**: Microservices application source code (`auth`, `client`, `orders`, `tickets`, `payments`, `expiration`).

---

## Documentation Index

Please complete the guides in the following order:

1. [01 - Overview](docs/01-overview.md) - Architecture and multi-repository breakdown.
2. [02 - Prerequisites](docs/02-prerequisites.md) - System requirements and hardware prerequisites.
3. [03 - AWS Credentials & WSL2 Setup](docs/03-aws-credentials-and-wsl2.md) - Configuring WSL2 Ubuntu and AWS authentication.
4. [04 - CLI Tools Installation](docs/04-cli-tools-installation.md) - Installing AWS CLI v2, kubectl, helm, eksctl, and Docker.
5. [05 - VS Code Setup & Extensions](docs/05-vscode-setup-and-extensions.md) - Setting up Remote-WSL and AWS Toolkit.
6. [06 - Environment Verification & Rancher GUI](docs/06-rancher-gui-and-verification.md) - Running pre-flight checks and launching Rancher console.

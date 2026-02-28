# 01 - Development Environment Overview

This repository provides a complete guide and automated tooling to configure a local cloud-native development environment on Windows using VS Code, WSL2 (Windows Subsystem for Linux), and the AWS CLI / Kubernetes ecosystem.

This setup serves as a modern replacement for AWS Cloud9 (which reached End of Life for new registrations) while offering superior performance, offline capability, and native VS Code integration.

---

## Architectural Topology

```text
  Windows 10 / 11 Host Machine
  ┌─────────────────────────────────────────────────────────────────────────┐
  │  Visual Studio Code (UI Window)                                         │
  │    ├── Extension: WSL (Remote Server Link)                              │
  │    ├── Extension: AWS Toolkit                                           │
  │    └── Extension: Kubernetes & Docker Tools                             │
  │                                                                         │
  │  ┌──────────────────── WSL2 Linux Kernel (Ubuntu) ─────────────────┐  │
  │  │                                                                  │  │
  │  │   Dev Tools: AWS CLI v2 · kubectl · helm · eksctl · Docker       │  │
  │  │                                                                  │  │
  │  │   Management Console:                                            │  │
  │  │   └── Rancher GUI (Docker container at localhost:4468)           │  │
  │  │                                                                  │  │
  │  └───────────────────────────────┬──────────────────────────────────┘  │
  └──────────────────────────────────┼──────────────────────────────────────┘
                                     │ Secure OIDC & IAM Credentials
                                     ▼
                          Amazon Web Services (AWS)
                        - Amazon EKS Cluster
                        - Amazon SQS Queues
                        - Amazon Managed Prometheus (AMP)
```

---

## Multi-Repository Architecture

The project is structured into three specialized repositories:

1. **`ticket-selling-dev-setup`** (Current Repository)
   - Local workstation setup guides (`docs/`).
   - Automated CLI tool installation scripts (`scripts/`).
   - Rancher Container Management Console (`tools/rancher/`).

2. **[`ticket-selling-keda`](https://github.com/phuocan803/ticket-selling-keda)**
   - Terraform IaC for EKS cluster, VPC, SQS queues, AMP, and AMG.
   - KEDA Event-driven ScaledObjects & Kubernetes manifests.
   - Monitoring stack (ADOT Collector & SigV4 Proxy).
   - Load testing suite (k6 scenarios S1–S6 & Locust scripts).
   - HPA CPU-based comparison baseline.

3. **[`ticket-selling-sample-application`](https://github.com/phuocan803/ticket-selling-sample-application)**
   - Source code for the 6 core microservices (`auth`, `client`, `tickets`, `orders`, `payments`, `expiration`).
   - Containerization Dockerfiles and local development docker-compose.

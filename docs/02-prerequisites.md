# 02 - System Prerequisites & Requirements

Before proceeding with the setup, verify that your development machine satisfies the minimum hardware and software prerequisites.

---

## Hardware Requirements

| Component | Minimum Requirement | Recommended |
| :--- | :--- | :--- |
| **OS** | Windows 10 (Build 19041+) or Windows 11 | Windows 11 Pro 64-bit |
| **CPU** | 64-bit x86 Processor with VT-x / AMD-V enabled | 8+ Cores (Intel Core i7/i9 or AMD Ryzen 7/9) |
| **RAM** | 8 GB RAM | 16 GB - 32 GB RAM |
| **Storage** | 20 GB available SSD space | 50+ GB NVMe SSD |

---

## Software Prerequisites

1. **Hardware Virtualization**: Enabled in System BIOS/UEFI (`Intel VT-x` or `AMD-V`).
2. **Windows Features**:
   - Virtual Machine Platform
   - Windows Subsystem for Linux (WSL)
3. **VS Code**: Installed on Windows host ([Download VS Code](https://code.visualstudio.com/)).
4. **AWS Account**: Active AWS Account with administrative privileges or IAM user credentials.

---

## AWS Permissions Required

Your IAM User or Role must possess sufficient permissions to manage:
- **Amazon EKS**: Cluster creation, node group management, OIDC provider registration.
- **Amazon EC2 & VPC**: VPC subnet creation, security groups, Internet Gateways.
- **Amazon SQS**: Creating standard event queues.
- **IAM**: Creating IRSA roles and trust policy attachments.
- **Amazon ECR**: Repository creation and container image push access.
- **Amazon Managed Prometheus & Grafana**: Workspace provisioning.

# Terraform + Ansible on AWS

Automate AWS infrastructure provisioning with **Terraform** and manage EC2 instances using **Ansible**.

## 📌 Project Overview

The infrastructure includes:

- 🔑 AWS Key Pair
- 🌐 Default AWS VPC
- 🔒 Security Group with SSH & HTTP access
- ☁️ Multiple EC2 instances running different operating systems:
  - Ubuntu (Master)
  - Ubuntu (Worker)
  - Red Hat Enterprise Linux
  - Amazon Linux

After provisioning, the instances can be managed using Ansible through a single inventory.


## 🛠️ Tech Stack

- Terraform
- Ansible
- AWS EC2
- AWS VPC
- SSH

## ▶️ Getting Started

```bash
terraform init
terraform plan
terraform apply
```

Verify Ansible connectivity:

```bash
ansible all -m ping
```

Destroy resources:

```bash
terraform destroy
```

## 📂 Project Goal

Provision cloud infrastructure as code and automate server management using industry-standard DevOps tools.

---

## 📖 Learning Outcomes

- Infrastructure as Code (IaC) with Terraform
- AWS resource provisioning
- SSH key management
- Multi-OS EC2 deployment
- Ansible inventory management
- Configuration management using Ansible

---

## 👨‍💻 Author

**Shashank Kanade**

GitHub: https://github.com/shashankkanade25

# 🌍 AWS Infrastructure - Cloud Native Microservices

## 📌 Introduction
This AWS infrastructure has been provisioned with **Terraform** and hosts a **cloud-native architecture** optimized for microservices. The objective is to provide a scalable and secure environment, integrating AWS **ECS Fargate**, **ALB (Load Balancer)**, **RDS/DynamoDB**, and **CloudWatch** for monitoring.

## 🏗️ Architecture
The architecture is based on:
- **ECS (Fargate)**: Orchestration and execution of microservices.
- **ALB (Application Load Balancer)**: Traffic distribution among services.
- **VPC with Public and Private Subnets**: Isolation and security.
- **IAM Roles** for secure access management.
- **AWS CloudWatch** for monitoring and logs.

📄 More details in [`networking.md`](networking.md) and [`iam.md`](iam.md).

---

## 🚀 Infrastructure Deployment
The infrastructure has been created using Terraform. To deploy it:

```sh
cd 02_Infrastructure/
terraform init
terraform apply -auto-approve
```

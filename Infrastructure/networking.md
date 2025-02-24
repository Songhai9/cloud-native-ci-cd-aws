# 🛡️ Network Architecture & Security

## 📌 Network Architecture
The infrastructure is built upon a **private VPC** divided into:
- **Public Subnets** (Load Balancer): `10.0.1.0/24`, `10.0.2.0/24`
- **Private Subnets** (ECS, Database): `10.0.3.0/24`, `10.0.4.0/24`
- **Internet Gateway** for public services.
- **NAT Gateway** to allow private instances to access the Internet.

## 🔐 Security & Access Control
| Resource                | Allowed Access                                   |
|-------------------------|--------------------------------------------------|
| **ALB Security Group**  | Allows HTTP (80) & HTTPS (443) from the Internet.|
| **ECS Security Group**  | Traffic allowed **only from the ALB**.           |
| **RDS Security Group**  | Access restricted to microservices (ECS).        |

## 🚀 AWS CLI Checks
`aws ec2 describe-security-groups`  
`aws ec2 describe-subnets`
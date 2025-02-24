# 🏗️ AWS Infrastructure Deployment Guide

## 📌 Prerequisites
- **Terraform installed** (`terraform --version`)
- **AWS CLI configured** (`aws configure`)
- **AWS account with administrative permissions**

---

## 🚀 Deployment Steps

1️⃣ **Clone the GitHub repository**
`git clone https://github.com/Songhai9/cloud-native-ci-cd-aws.git`
`cd cloud-native-ci-cd-aws/02_Infrastructure/`

2️⃣ **Initialize Terraform**
`terraform init`

3️⃣ **Check Changes**
`terraform plan`

4️⃣ **Apply the infrastructure**
`terraform apply -auto-approve`
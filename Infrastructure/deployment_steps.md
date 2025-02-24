# 🏗️ Guide de Déploiement - Infrastructure AWS

## 📌 Pré-requis
- **Terraform installé** (`terraform --version`)
- **AWS CLI configuré** (`aws configure`)
- **Compte AWS avec permissions administratives**

---

## 🚀 Étapes de déploiement

1️⃣ **Cloner le repo GitHub**
`git clone https://github.com/Songhai9/cloud-native-ci-cd-aws.git`
`cd cloud-native-ci-cd-aws/02_Infrastructure/`

2️⃣ Initialize Terraform
`terraform init`

3️⃣ Check Changes
`terraform plan`

4️⃣ Apply the infrastructure 
`terraform apply -auto-approve`
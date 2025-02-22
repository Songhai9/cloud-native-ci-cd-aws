# ✅ Explanation of the Cloud-Native Architecture on AWS

## 📊 Overview
The architecture is built using the following components:
- **Container Orchestration**: Amazon EKS (Kubernetes) or Amazon ECS (Fargate)
- **Docker Image Storage**: Amazon Elastic Container Registry (ECR)
- **Traffic Management**: AWS Application Load Balancer (ALB)
- **Database**: Amazon RDS (PostgreSQL or MySQL)
- **CI/CD**: GitHub Actions for automated deployments
- **Observability**: AWS CloudWatch, Prometheus, and Grafana for logging and monitoring

---

## 👨‍💻 AWS Services Used

### 1. **Container Orchestration: Amazon EKS / ECS**
We use **EKS (Elastic Kubernetes Service)** to manage our containerized microservices.
- **Why Kubernetes (EKS)?**
  - Advanced management of microservices with auto-scaling
  - Multi-cloud compatibility
  - Integration with monitoring and security tools
- **Alternative: ECS (Elastic Container Service)**
  - Easier to set up
  - Serverless management with AWS Fargate (no worker nodes to manage)

### 2. **Image Storage: Amazon ECR**
- Stores and manages private Docker images
- Easy integration with EKS and ECS
- Automatic vulnerability scanning

### 3. **Traffic Management: AWS ALB (Application Load Balancer)**
- Smartly distributes traffic between microservices
- Ensures high availability
- Manages SSL/TLS certificates via AWS Certificate Manager

### 4. **Database: Amazon RDS**
- Choice between **PostgreSQL** and **MySQL**
- High availability with multi-AZ
- Automated backups

### 5. **CI/CD: GitHub Actions**
- Automated build, test, and deployment
- Integration with Terraform and AWS CLI
- Secret management with GitHub Secrets

### 6. **Monitoring & Logging: AWS CloudWatch, Prometheus, Grafana**
- **CloudWatch**: Collects AWS logs and metrics
- **Prometheus**: Monitors Kubernetes services
- **Grafana**: Provides performance visualization

---

## 🌍 Data Flow and Communication
1. **The developer pushes code to GitHub**
2. **GitHub Actions builds the Docker image and pushes it to ECR**
3. **Terraform deploys the AWS infrastructure**
4. **EKS/ECS runs the microservices**
5. **ALB routes traffic to the available services**
6. **Microservices interact with RDS for database operations**
7. **CloudWatch, Prometheus, and Grafana handle monitoring**

---

## 🔎 Justification of Technical Choices
- **Kubernetes (EKS) vs ECS**: More flexible and scalable for long-term needs
- **RDS vs DynamoDB**: Relational database is required, so RDS is chosen
- **GitHub Actions vs AWS CodePipeline**: Easier integration with GitHub

---

## 📚 Conclusion
This architecture ensures **scalability, automation, and resilience**. We will now proceed with implementing this infrastructure using **Terraform**.
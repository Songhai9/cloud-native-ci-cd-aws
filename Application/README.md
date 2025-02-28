# Phase 3 - Development & Containerization of Microservices

## 📌 Description
In this phase, we developed two microservices (API and Worker) in Python, then containerized them and deployed them on AWS ECS Fargate.

## 📁 Structure

Application/
├── service-api/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── service-worker/
│   ├── worker.py
│   ├── requirements.txt
│   └── Dockerfile
└── README.md

## 🚀 Local Build & Test

### 1. API Microservice

`cd service-api`  
`docker build -t service-api .`  
`docker run -p 8080:80 service-api`  
`curl http://localhost:8080`

### 2. Worker Microservice 

`cd service-worker`  
`docker build -t service-worker .`  
`docker run service-worker`

## ☁️ Push to AWS ECR

### 1. Create AWS ECR Repository:
`aws ecr create-repository --repository-name service-api`

### 2. Tag and push the image:
`docker tag service-api:latest 463470984349.dkr.ecr.us-east-1.amazonaws.com/service-api:latest`  
`docker push 463470984349.dkr.ecr.us-east-1.amazonaws.com/service-api:latest`

## 🏗️ ECS Deployment

• The task definitions and ECS services are defined in 02_Infrastructure/task-definitions.tf and 02_Infrastructure/service.tf.  
• Terraform commands:
`cd ../Infrastructure`  
`terraform plan`  
`terraform apply -auto-approve`

## 📜 Logs & Monitoring

• Each container is configured to send its logs to CloudWatch Logs.  
• Log groups: /ecs/api and /ecs/worker.

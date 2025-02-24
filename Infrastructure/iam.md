# 🔑 IAM Role Management

## 📌 Main IAM Roles
| Role                       | Description                                                |
|----------------------------|------------------------------------------------------------|
| **ECS Task Execution Role**| Allows ECS tasks to access AWS ECR and CloudWatch.         |
| **Load Balancer Role**     | Authorizes ALB to register targets and route traffic.      |
| **Database Access Role**   | Allows microservices to read and write to the database.    |

## 🚀 Checking IAM Roles
`aws iam list-roles`  
`aws iam get-role --role-name ecsTaskExecutionRole`

# 🔑 Gestion des Rôles IAM

## 📌 Principaux Rôles IAM
| Rôle | Description |
|------|------------|
| **ECS Task Execution Role** | Permet aux tâches ECS d’accéder à AWS ECR et CloudWatch. |
| **Load Balancer Role** | Autorise ALB à enregistrer les cibles et router le trafic. |
| **Database Access Role** | Permet aux microservices de lire/écrire dans la BDD. |


## 🚀 Vérification des rôles IAM
`aws iam list-roles`
`aws iam get-role --role-name ecsTaskExecutionRole`
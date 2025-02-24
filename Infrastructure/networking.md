# 🛡️ Architecture Réseau & Sécurité

## 📌 Architecture Réseau
L’infrastructure repose sur un **VPC privé** divisé en :
- **Subnets Publics** (Load Balancer) : `10.0.1.0/24`, `10.0.2.0/24`
- **Subnets Privés** (ECS, BDD) : `10.0.3.0/24`, `10.0.4.0/24`
- **Internet Gateway** pour les services publics.
- **NAT Gateway** pour permettre aux instances privées d’accéder à Internet.

## 🔐 Sécurité & Contrôle d’Accès
| Ressource | Accès Autorisé |
|-----------|---------------|
| **ALB Security Group** | Autorise HTTP (80) & HTTPS (443) depuis Internet. |
| **ECS Security Group** | Autorise le trafic **uniquement depuis l’ALB**. |
| **RDS Security Group** | Accès limité aux microservices (ECS). |

## 🚀 Vérifications AWS CLI
`aws ec2 describe-security-groups`
`aws ec2 describe-subnets`
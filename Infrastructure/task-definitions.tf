############################################
# ECS TASK DEFINITIONS: API & WORKER
############################################

# =======================
# API Task Definition
# =======================
resource "aws_ecs_task_definition" "api" {
  family                   = "api-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = "api"
      image = "463470984349.dkr.ecr.us-east-1.amazonaws.com/service-api:latest"
      cpu   = 256
      memory = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      # Logs configuration for CloudWatch
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/api"
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

# =======================
# WORKER Task Definition
# =======================
resource "aws_ecs_task_definition" "worker" {
  family                   = "worker-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "worker"
      image     = "463470984349.dkr.ecr.us-east-1.amazonaws.com/service-worker:latest"
      cpu       = 256
      memory    = 512
      essential = true

      # Logs configuration for CloudWatch
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/worker"
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}
############################################
# ECS SERVICES: API & WORKER
############################################

# =======================
# API Service
# =======================
resource "aws_ecs_service" "api" {
  name            = "api-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.api.arn
  launch_type     = "FARGATE"
  desired_count   = 2

  network_configuration {
    subnets         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }

  # Attach the service to the load balancer
  load_balancer {
    target_group_arn = aws_lb_target_group.api_tg.arn
    container_name   = "api"
    container_port   = 80
  }

  # Wait for the service to be stable
  deployment_controller {
    type = "ECS"
  }
  wait_for_steady_state = true
}

# =======================
# WORKER Service
# =======================
resource "aws_ecs_service" "worker" {
  name            = "worker-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.worker.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }
}
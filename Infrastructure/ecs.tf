resource "aws_ecs_cluster" "main" {
  name = "cloud-native-cluster"

  tags = {
    Name = "Cloud Native ECS Cluster"
  }
}
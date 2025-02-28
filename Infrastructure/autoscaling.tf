resource "aws_appautoscaling_target" "api_scaling_target" {
    max_capacity       = 4     # maximum number of ECS tasks
    min_capacity       = 1     # minimum number of ECS tasks
    resource_id        = "service/cloud-native-cluster/api-service"
    scalable_dimension = "ecs:service:DesiredCount"
    service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "api_scaling_policy" {
    name               = "api-scaling-policy"
    policy_type        = "TargetTrackingScaling"
    resource_id        = aws_appautoscaling_target.api_scaling_target.resource_id
    scalable_dimension = aws_appautoscaling_target.api_scaling_target.scalable_dimension
    service_namespace  = aws_appautoscaling_target.api_scaling_target.service_namespace

    target_tracking_scaling_policy_configuration {
        target_value       = var.target_cpu_value  # target CPU percentage
        predefined_metric_specification {
            predefined_metric_type = "ECSServiceAverageCPUUtilization"
        }
        scale_out_cooldown = 60
        scale_in_cooldown  = 60
    }
}

############################################################
# 1) Creation of an SNS Topic to receive notifications
############################################################
resource "aws_sns_topic" "cloud_native_alarms" {
    name = "cloud-native-alarms"
}

# Email subscription
resource "aws_sns_topic_subscription" "alarm_email" {
    topic_arn = aws_sns_topic.cloud_native_alarms.arn
    protocol  = "email"
    endpoint  = var.alarm_email  # e.g. "your-email@example.com"
}

############################################################
# 2) CloudWatch Alarms for ECS API service
############################################################
resource "aws_cloudwatch_metric_alarm" "api_cpu_high" {
    alarm_name                = "ECS-API-CPU-High"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/ECS"
    period                    = 60
    statistic                 = "Average"
    threshold                 = 70  # Adjust as needed
    alarm_description         = "Alert when CPU > 70% for API"
    dimensions = {
        ClusterName = "cloud-native-cluster"  
        ServiceName = "api-service"           
    }
    alarm_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
    ok_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
}

resource "aws_cloudwatch_metric_alarm" "api_memory_high" {
    alarm_name                = "ECS-API-Memory-High"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "MemoryUtilization"
    namespace                 = "AWS/ECS"
    period                    = 60
    statistic                 = "Average"
    threshold                 = 80  # Adjust as needed
    alarm_description         = "Alert when memory > 80% for API"
    dimensions = {
        ClusterName = "cloud-native-cluster"
        ServiceName = "api-service"
    }
    alarm_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
    ok_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
}

############################################################
# 3) CloudWatch Alarms for ECS Worker service
############################################################
resource "aws_cloudwatch_metric_alarm" "worker_cpu_high" {
    alarm_name                = "ECS-Worker-CPU-High"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/ECS"
    period                    = 60
    statistic                 = "Average"
    threshold                 = 70
    alarm_description         = "Alert when CPU > 70% for Worker"
    dimensions = {
        ClusterName = "cloud-native-cluster"
        ServiceName = "worker-service"
    }
    alarm_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
    ok_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
}

resource "aws_cloudwatch_metric_alarm" "worker_memory_high" {
    alarm_name                = "ECS-Worker-Memory-High"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "MemoryUtilization"
    namespace                 = "AWS/ECS"
    period                    = 60
    statistic                 = "Average"
    threshold                 = 80
    alarm_description         = "Alert when memory > 80% for Worker"
    dimensions = {
        ClusterName = "cloud-native-cluster"
        ServiceName = "worker-service"
    }
    alarm_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
    ok_actions = [
        aws_sns_topic.cloud_native_alarms.arn
    ]
}



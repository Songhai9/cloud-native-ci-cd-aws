resource "aws_cloudwatch_dashboard" "cloud_native_dashboard" {
  dashboard_name = "CloudNativeDashboard"

  dashboard_body = templatefile("${path.module}/dashboard.json", {
    cluster_name     = "cloud-native-cluster"
    api_service_name = "api-service"
    worker_service_name = "worker-service"
  })
}
resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  alarm_name          = "cloud-devops-ec2-high-cpu"
  alarm_description   = "Alarm when EC2 CPU utilization is high"
  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 300
  statistic          = "Average"
  threshold          = 80

  dimensions = {
    InstanceId = aws_instance.devops.id
  }

  treat_missing_data = "notBreaching"

  tags = {
    Name = "cloud-devops-ec2-cpu-alarm"
  }
}
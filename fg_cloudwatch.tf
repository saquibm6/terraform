#This script will create a CloudWatch log group where our “Hello World” Fargate tasks will log all activities related to starting, stopping and configuring the containers.
resource "aws_cloudwatch_log_group" "myapp" {
name = "/ecs/myapp"
retention_in_days = 30
tags = {
name = "myapp"
}
}

resource "aws_cloudwatch_log_group" "hello-world" {
name = "/ecs/hello-world"
retention_in_days = 30
tags = {
name = "hello-world"
}
}
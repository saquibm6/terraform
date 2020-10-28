# Hello-Wortd - Application managed by Jenkins pipeline/github
data "template_file" "hello-world" {
template = file("templates/ecs/hello-world.json.tpl")
vars = {
REPOSITORY_URL = aws_ecr_repository.hello-world.repository_url
AWS_ECR_REGION = var.aws_region
LOGS_GROUP = aws_cloudwatch_log_group.hello-world.name
}
}

resource "aws_ecs_task_definition" "hello-world" {
family = "hello-world"
requires_compatibilities = ["FARGATE"]
network_mode = "awsvpc"
cpu = 256
memory = 512
container_definitions = data.template_file.hello-world.rendered
execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
task_role_arn = aws_iam_role.ecs_task_assume.arn
}

resource "aws_ecs_service" "hello-world-service" {
name = "hello-world-service"
cluster = aws_ecs_cluster.fargate.id
launch_type = "FARGATE"
task_definition = aws_ecs_task_definition.hello-world.arn
desired_count = 1

network_configuration {
subnets = [aws_subnet.public-subnet.id, aws_subnet.public-subnet2.id]
security_groups = [aws_security_group.ecs.id]
}

load_balancer {
target_group_arn = aws_alb_target_group.hello-world.arn
container_name = "hello-worid"
container_port = 80
}
depends_on = [
aws_alb_listener.hello-world
]
}
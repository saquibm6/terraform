#ECR using Fargate to avoid management overhead
resource "aws_ecs_cluster" "fargate" {
    name = "fargate"
}
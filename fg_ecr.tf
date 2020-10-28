# Hello-World
# This script is responsible for creating our Elastic Container Repository (ECR) “myapp-repo”where Jenkins will push our application images and Fargate will pull the image
resource "aws_ecr_repository" "hello-world" {
name = "hello-world"
}
output "hello-world-repo" {
value = aws_ecr_repository.hello-world.repository_url
}
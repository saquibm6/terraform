# Create policy ecs_task_assume with ecr and CloudWatch permissions needed for our role
resource "aws_iam_role_policy" "ecs_task_assume" {
name = "ecs_task_assume"
role = aws_iam_role.ecs_task_assume.id
policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{

"Effect": "Allow",

"Action": [
"ecr:GetAuthorizationToken",
"ecr:BatchCheckLayerAvailability",
"ecr:GetDownloadUriForLayer",
"ecr:BatchGetImage",
"logs:CreateLogStream",
"logs:PutLogEvents"
],

"Resource": "*"
}
]
}
EOF
}

# Create a role ecs_task_assume with the AssumeRole rights
resource "aws_iam_role" "ecs_task_assume" {
name = "ecs_task_assume"
assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "",
"Effect": "Allow",
"Principal": {
"Service": "ecs-tasks.amazonaws.com"
},
"Action": "sts:AssumeRole"
}
]
}
EOF
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
name = "ecsTaskExecutionRole"
assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "",
"Effect": "Allow",
"Principal": {
"Service": "ecs-tasks.amazonaws.com"
},
"Action": "sts:AssumeRole"
}
]
}
EOF
}

# Attach the AmazonECSTaskExecutionRolePolicy to our role named ecsTaskExecutionRole
# Allows our role to execute tasks within ECS and Fargate
resource "aws_iam_role_policy_attachment" "TaskExecutionPolicyAttachment" {
role = aws_iam_role.ecsTaskExecutionRole.name
policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
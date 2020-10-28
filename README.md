# terraform
Repository for Terraform scripts for IaaC

The files present are used to privision resources required by ECS and ECR.
Each file is named according to the resource(s) it provisions and associated dependent resources.

To create AWS resources, either provide "-var" values or ".tfvars" file with terraform apply, or change the default values within "variables.tf".

To get started
1. Make sure you have terraform installed
2. Make sure you have git installed
3. Make sure you use appropriate way to authenticate yourself to AWS
3. Do "Git Clone <repo url>"
4. Change values according to needs <optional>
5. terraform init
6. terraform plan
7. terraform apply

The IAC is written in a fashion which makes the infra Higly available and fault taulorent with self healing. This also employs cloudwatch alerts and logs for logging and monitoring purposes.

And you are done! :)

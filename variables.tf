provider "aws" {
region = var.aws_region
profile = "default"
}

variable "region" {
description = "Region Name"
default = "us-east-2"
}

variable "aws_region" {
description = "EC2 Region for the VPC"
default = "us-east-2"
}

variable "remote_cidr" {
description = "CIDR from Remote Testing Source"
default = "47.31.254.71/32"  #Change this to the public IP of your ISP
}

variable "vpc_cidr" {
description = "CIDR for the whole VPC"
default = "10.0.0.0/16"
}

variable "public_subnet_2a_cidr" {
description = "CIDR for the Public 2a Subnet"
default = "10.0.0.0/25"
}

variable "public_subnet_2b_cidr" {
description = "CIDR for the Public 2b Subnet"
default = "10.0.0.128/25"
}

variable "private_subnet_2a_cidr" {
description = "CIDR for the Private 2a Subnet"
default = "10.0.2.0/25"
}

variable "private_subnet_2b_cidr" {
description = "CIDR for the Private 2b Subnet"
default = "10.0.2.128/25"
}

variable "availability_zones" {
    type = list(string)
    default = ["us-east-2a","us-east-2b"]
}
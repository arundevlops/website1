variable "aws_region" {}
variable "vpc_cidr" {}
variable "access_key"{}
variable "secret_key"{}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "private_subnet2_cidr" {}
variable "customami" {}
variable "autoscaling_instance_type" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "private_subnet2_name" {}
variable "Main_Routing_Table" {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1b","us-east-1c"]
}
variable "environment" { 
  type = "string"
  default = "dev" 
  }
variable "instance_type" {
  type = "map"
  default = {
    dev = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
    }
}


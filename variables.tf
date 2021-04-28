variable "vpc_id" {
  type = string
}

variable "subnet_cidr" {
  default = ["10.0.0.0/24","10.0.1.0/24"]
  type = list(string)
}

variable "ami_id" {
  default = "ami-0742b4e673072066f"
  description = "AMI ID of the EC2 Instance"
  type = string
}

variable "instance_type" {
  default = "t2.micro"
  description = "Instance type of the EC2 Instance"
  type = string
}

variable "ec2_tags" {
  default = ["amurthy_ec2_1", "amurthy_ec2_2"]
  type = list(string)
}
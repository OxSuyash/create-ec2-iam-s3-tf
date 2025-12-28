variable "aws_region" {
    description = "AWS region to deploy instance"
    type = string
}

variable "aws_vpc_name" {
    description = "AWS VPC name"
    type = string
}

variable "public_subnet_name" {
    description = "public subnet name"
    type = string
}

variable "private_subnet_name" {
    description = "private subnet name"
    type = string
}

variable "sg_name_from_name" {
    description = "sg_name_from_name"
    type = string
}

variable "my_ip" {
    description = "enter your public ip from where you will ssh"
    type = string
}


variable "sg_name_from_tag" {
    description = "sg_name_from_tag"
    type = string
}

variable "iam_role_name" {
    description = "iam role name"
    type = string
}


variable "ec2_profile_name" {
    description = "ec2_profile_name"
    type = string
}

variable "ec2_ami_id" {
    description = "ami id"
    type = string
}

variable "instance_type" {
    description = "instance type"
    type = string
}

variable "aws_key_name" {
    description = "key pair name form aws"
    type = string
}

variable "instance_name" {
    description = "instance name"
    type = string
}


variable "s3_bucket_base" {
    description = "bucket name"
    type = string
}




variable "igw_name" {
    description = "internet gateway name"
    type = string
}




variable "rt_name" {
    description = "route table name"
    type = string
}








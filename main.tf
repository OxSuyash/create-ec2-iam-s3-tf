provider "aws" {
    region = var.aws_region
}

#vpc
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.aws_vpc_name
    }
}

#subnets
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = var.public_subnet_name
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = var.private_subnet_name
    }
}

#security group
resource "aws_security_group" "ssh_access" {
    name = var.sg_name_from_name
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.sg_name_from_tag
    }
}

#IAM role for ec2 (s3 access)
resource "aws_iam_role" "ec2_role" {
    name = var.iam_role_name

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        }]
    })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_access" {
    role = aws_iam_role.ec2_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


resource "aws_iam_instance_profile" "ec2_profile" {
    name = var.ec2_profile_name
    role = aws_iam_role.ec2_role.name
}

# ec2 instance 
resource "aws_instance" "create_instance" {
    ami = var.ec2_ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids  = [aws_security_group.ssh_access.id]
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    key_name = var.aws_key_name

    tags = {
        Name = var.instance_name
    }
}

#s3 bucket 
resource "random_id" "bucket_id" {
    byte_length = 4
}

resource "aws_s3_bucket" "app_bucket" {
    bucket = "${var.s3_bucket_base}-${random_id.bucket_id.hex}"
} 


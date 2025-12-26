prereq : terraform installed -> https://github.com/OxSuyash/terraform-notes/blob/main/install-terraform.md

1. Clone the repo

2. Create a file 'terraform.tfvars' and configure :

  ```
  aws_region = "region"

  aws_vpc_name = "vpc-name"

  public_subnet_name = "public-subnet-name"

  private_subnet_name = "private-subnet-name"

  sg_name_from_name = "sg_name_from_name"

  my_ip = "your_public_ip/32"

  sg_name_from_tag = "sg_name_from_tag"

  iam_role_name = "iam-role-name"

  ec2_profile_name  =  "ec2-profile-name"

  ec2_ami_id = "ami_id"

  instance_type = "instance_type"

  aws_key_name = "your aws key name"

  instance_name = "instance name"

  s3_bucket_base = "s3-bucket-name"

  ```
3. init

4. plan

5. apply

output "ec2_public_ip" {
    description = "Public IP of ec2 instance"
    value = aws_instance.create_instance.public_ip
}

output "s3_bucket_name" {
    description = "S3 bucket name" 
    value = aws_s3_bucket.app_bucket.bucket
}
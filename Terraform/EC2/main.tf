provider "aws" {
  region = "ap-south-1"  # Mumbai region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-034dbe27bdae2ef6c"  # Replace with your actual AMI ID
  instance_type = "t2.xlarge"
  key_name      = "newTest"               # Make sure this key pair exists in your AWS account

  root_block_device {
    volume_size = 70                      # 70 GB root EBS volume
    volume_type = "gp3"                   
  }

  vpc_security_group_ids = ["sg-09b5da039a58fe3ab"]  # Replace with the actual security group ID of the default VPC

  tags = {
    Name = "MyEC2InstanceDev"  # Mention the name of ec2 instance
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "ubuntu:Test@123" | chpasswd
              EOF
}

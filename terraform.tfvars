# Network
vpc_cidr           = "192.168.0.0/16"
public_subnet_cidr = "192.168.1.0/24"
# AWS Settings
region     = "us-east-1"
aws_az     = "us-east-1a"

# Linux Virtual Machine
linux_instance_type               = "t2.xlarge"
linux_associate_public_ip_address = true
linux_root_volume_size            = 80
linux_root_volume_type            = "gp2"
linux_data_volume_size            = 20
linux_data_volume_type            = "gp2"

#Name	  vCPUs	RAM (GiB)
#t2.micro	1	1.0
#t2.small	1	2.0
#t2.medium	2	4.0
#t2.large	2	8.0
#t2.xlarge	4	16.0
#t2.2xlarge	8	32.0
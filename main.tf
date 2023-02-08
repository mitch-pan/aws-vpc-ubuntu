# Configure the AWS Provider
provider "aws" {
  #version = "~> 3.0"
  region  = var.region
}

# Create EC2 Instance
resource "aws_instance" "linux-server" {
  ami                         = data.aws_ami.ubuntu-linux-1804.id
  instance_type               = var.linux_instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-linux-sg.id]
  associate_public_ip_address = var.linux_associate_public_ip_address
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = file("user-data.sh")

  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.linux_data_volume_size
    volume_type           = var.linux_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "linux-vm"
  }
}

# Create Elastic IP for the EC2 instance
resource "aws_eip" "linux-eip" {
  vpc  = true
  tags = {
    Name = "linux-eip"
  }
}
# Associate Elastic IP to Linux Server
resource "aws_eip_association" "linux-eip-association" {
  instance_id   = aws_instance.linux-server.id
  allocation_id = aws_eip.linux-eip.id
}


# Get latest Ubuntu Linux Bionic Beaver 18.04 AMI
data "aws_ami" "ubuntu-linux-1804" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
# Get latest Ubuntu Linux Focal 20.04 AMI
data "aws_ami" "ubuntu-linux-2004" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#Provide the ssh command to access the server
output "UbuntuManagementSSHAccess" {
  value = join("", ["ssh -i ", local_file.ssh_key.filename, " ubuntu@", aws_instance.linux-server.public_ip] )
}

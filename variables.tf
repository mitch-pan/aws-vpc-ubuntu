
# AWS AZ
variable "aws_az" {
  type        = string
  description = "AWS Availability Zone"
  default     = "us-east-1a"
}
# VPC Variables
variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "192.168.0.0/16"
}
# Subnet Variables
variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for the public subnet"
  default     = "192.168.1.0/24"
}

variable "region" {
  type = string
  description = "AWS region"
}

variable "linux_instance_type" {
  type        = string
  description = "EC2 instance type for Linux Server"
  default     = "t2.micro"
}
variable "linux_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}
variable "linux_root_volume_size" {
  type        = number
  description = "Volume size of root volume of Linux Server"
}
variable "linux_data_volume_size" {
  type        = number
  description = "Volume size of data volume of Linux Server"
}
variable "linux_root_volume_type" {
  type        = string
  description = "Volume type of root volume of Linux Server."
  default     = "gp2"
}
variable "linux_data_volume_type" {
  type        = string
  description = "Volume type of data volumen of Linux Server"
  default     = "gp2"
}

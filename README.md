# aws-vpc-ubuntu
Have you ever just wanted a single Ubuntu (or other Linux) server to run some 
quick tests on?  This repo lets you use terraform to quickly spin up a VPC and all its sub-components in 
AWS and then tear it down when you are done.  

## Deployment Steps

1. Make sure you have the AWS cli installed on your client.  On a Linux or Mac host you 
can run `$ which aws`.  This should provide the path where it is installed (e.g. 
`/usr/local/bin/aws`).  If nothing is returned, go [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) 
and follow the instructions to install it.

2. Download this repo

    `https://github.com/mitch-pan/aws-vpc-ubuntu.git`
3. Ensure the aws CLI tool is properly configured ( run `aws configure`)
4. Verify the values in `terraform.tfvars`, especially the region, AZ and instance type for your
ec2 instance. 
5. Run `terraform init`
6. If that went well, run `terraform plan`
7. If that looks good, run `terraform apply`
8. The output should provide the ssh command you need to ssh to the Ubuntu host.
9. When you are done, run `terraform destroy`
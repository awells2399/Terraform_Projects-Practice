# Deploying an NGINX Server in AWS

In this project, you will be deploying an NGINX server in AWS. You will create a new VPC, set up public and private subnets, and deploy an EC2 instance using the Ubuntu AMI. Later, you will replace the instance with an NGINX Bitnami AMI and associate it with a security group. Finally, you will test the website accessibility and tag the resources with project information. Make sure to use Terraform for as many resources as possible, and remember to delete all the resources at the end of the project to avoid unnecessary costs.

## Project Overview

<img src="assets\vpc-ec2-nginx.png" alt="deploy-vpc-ec2-instance" width="400"/>

## Steps for implementation:

1. Deploy a VPC and a subnet
2. Deploy an internet gateway and associate it with the VPC
3. Setup a route table with a route to the IGW and associate it with the subnet
4. Deploy an EC2 instance inside of the created subnet and associate a public IP
5. Associate a public IP and a security group that allows public ingress
6. Chnage the EC2 instance to use a publicly available NGINX AMI
7. Destroy everything

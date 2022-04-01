provider "aws" {
	region				= "us-west-2"
}

module "vpc" {
	source				= "terraform-aws-modules/vpc/aws"

	name				= "terraform-cloud-router-demo"
	cidr				= "10.0.0.0/16"

	azs				= ["us-west-2a", "us-west-2b"]
	private_subnets			= ["10.0.100.0/24", "10.0.101.0/24"]
	public_subnets			= ["10.0.0.0/24", "10.0.1.0/24"]

	enable_nat_gateway		= false
	enable_vpn_gateway		= false
}

resource "aws_instance" "c8kv" {
        ami                     = "ami-08ff3b00ec566077f"
        instance_type           = "t3.medium"
        availability_zone       = "us-west-2a"
		subnet_id 				= module.vpc.public_subnets[0]

     	vpc_security_group_ids	= [aws_security_group.sg_allow_ssh.id] 
        key_name                = "FCKeyPair1"

	user_data = <<-EOF
Section: IOS configuration
hostname fctest
ip domain name cisco.local
aaa new-model
aaa authentication login default local
crypto key generate rsa general-keys modulus 4096
ip ssh version 2
username cisco123 privilege 15 secret cisco123
enable secret cisco123
restconf
EOF
}

resource "aws_security_group" "sg_allow_ssh" {
        name                    = "sg_allow_ssh"
        description             = "Allows incoming SSH sessions"
	vpc_id  		= module.vpc.vpc_id

        ingress {
                from_port       = 22
                to_port         = 22
                protocol        = "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
        }
        egress {
                from_port       = 0
                to_port         = 0
                protocol        = "-1"
                cidr_blocks     = ["0.0.0.0/0"]
        }
}

resource "aws_security_group" "sg_allow_https" {
        name                    = "sg_allow_https"
        description             = "Allows incoming HTTPS sessions"
	vpc_id  		= module.vpc.vpc_id

        ingress {
                from_port       = 443
                to_port         = 443
                protocol        = "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
        }
        egress {
                from_port       = 0
                to_port         = 0
                protocol        = "-1"
                cidr_blocks     = ["0.0.0.0/0"]
        }
}

output "instance_public_ip" {
	value = aws_instance.c8kv.public_ip
}
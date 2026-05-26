# EC2 Instance
# key pair = ssh-keygen
#create a VPC and security group for the instance
#create an EC2 instance and associate it with the security group and key pair
resource "aws_key_pair" "my_key" {
    key_name   = "${var.env}-infra-app-key"
    public_key = file("terra-key-ec2.pub")
    tags = {
      environment = var.env
    }
}

# create default VPC
resource "aws_default_vpc" "default" {
    
    tags = {
        Name = "default-vpc"
    }
}

# create security group
resource "aws_security_group" "my_security_group" {
    name        = "${var.env}-infra-app-sg"
    description = "Allow SSH and HTTP traffic"
    vpc_id      = aws_default_vpc.default.id #interpolation to get the VPC ID

    #inbound rules
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH from anywhere"
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP from anywhere"
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTPS from anywhere"
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
    tags = {
        name = "${var.env}-infra-app-sg"
        Environment = var.env

    }    
}   

# create EC2 instance
resource "aws_instance" "my_instance" {
    #count =2 # meta arguments
    count = var.instance_count
    depends_on = [aws_security_group.my_security_group,aws_key_pair.my_key ] # this instance wont be created unless this are filled.
    ami           = var.ec2_ami_id # Amazon Linux 2 AMI (HVM), SSD Volume Type
    #instance_type = var.ec2_instance_type
    instance_type = var.instance_type
    key_name      = aws_key_pair.my_key.key_name #interpolation to get the key pair name
    security_groups = [aws_security_group.my_security_group.name] #interpolation to get the security group name
    user_data = file("install_nginx.sh")

    root_block_device {
        #conditional statement
        volume_size = var.env =="prd" ? 20: var.ec2_root_storage_size 
        volume_type = "gp2"
    }
    tags = {
        Name = "${var.env}-infra-instance"
        Environment = var.env
    }
}
#Deployment of secure vpc using terraform
terraform {
  backend "s3" {
    bucket = "terraform-tfstate-bucketnew"
    key = "terrafrom.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
   region = var.region

}
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project-name}-VPC"    #pass the variable inside the string
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.public_cidr
  availability_zone = var.az1
  tags = {
    Name = "T-public-subnet"
  }  
  map_public_ip_on_launch = true
}
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.private_cidr
  availability_zone = var.az2
  tags = {
    Name = "T-private-subnet"
  }  
}
#public configuration
resource "aws_internet_gateway" "my-T-IGW" {
  vpc_id = aws_vpc.myvpc.id 
  #you can pass vpc id then no need to attach to vpc in new varsions
  tags = {
    Name = "T-IGW"
  }
}
resource "aws_default_route_table" "main-RT" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id
  tags = {
    Name = "main-RT"
  }  
}
resource "aws_route" "my_route" {
    route_table_id = aws_default_route_table.main-RT.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-T-IGW.id
}
resource "aws_security_group" "my-T-sg" {
  vpc_id = aws_vpc.myvpc.id
  name = "my-T-SG"
  description = "allow http, ssh, mysql"
  ingress {
    protocol = "tcp"
    to_port = "22"
    from_port = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol = "tcp"
    to_port = "80"
    from_port = "80"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol = "tcp"
    to_port = "3306"
    from_port = "3306"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "-1"     #-1 for all port
    to_port = 0
    from_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [ aws_vpc.myvpc ]
}

#instance public
resource "aws_instance" "public_server" {
  subnet_id     = aws_subnet.public_subnet.id
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key-name
  vpc_security_group_ids = [aws_security_group.my-T-sg.id]
  tags = {
    Name = "public-server"
  }   
  depends_on = [ aws_security_group.my-T-sg ]
}

#instance private
resource "aws_instance" "private_server" {
  subnet_id     = aws_subnet.private_subnet.id
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key-name
  vpc_security_group_ids = [aws_security_group.my-T-sg.id]
  tags = {
    Name = "private-server"
  }   
  depends_on = [ aws_security_group.my-T-sg ]
}
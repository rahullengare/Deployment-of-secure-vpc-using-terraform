variable "region" {
  default = "us-east-1"
}
variable "az1" {
  default = "us-east-1a"
}
variable "az2" {
  default = "us-east-1b"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_cidr" {
  default = "10.0.0.0/20"
}
variable "private_cidr" {
  default = "10.0.16.0/20"
}
variable "project-name" {
  default = "Terraform"
}

variable "ami" {
  default = ""      #your ami id
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key-name" {
  default = "pem-server-key"
}
variable "subnet_id" {
  default = ""      #your ami id
}
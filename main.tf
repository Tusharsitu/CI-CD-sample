provider "aws" {
  region = "us-east-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

resource "aws_key_pair" "test1" {
  key_name = "terraform-demo"
}

resource "aws_instance" "server1" {
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public
  security_groups = aws_security_group.tfsg.id
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc

  route {
   cidr_block = "0.0.0.0/0" 
   gateway_id =  aws_internet_gateway.myigw
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "tfsg" {
  name = tf
  vpc_id = aws_vpc.myvpc.id
}

output "public_ip_address" {
  value = aws_instance.server1.public_ip
}

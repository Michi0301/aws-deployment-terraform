// Create virtual private cloud
resource "aws_vpc" "demo_app_vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-app-vpc"
  }
}

// Create subnets
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.demo_app_vpc.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-app-public-subnet-a"
  }
}

// Create security group (rules for access on ec2 instances)
resource "aws_security_group" "demo_app_web_security_group" {
  name        = "demo_app_web"
  description = "Allow HTTP(S) inbound traffic"
  vpc_id      = aws_vpc.demo_app_vpc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_internet_traffic"
  }
}

// Internet gateway
resource "aws_internet_gateway" "demo_app_igw" {
  vpc_id = aws_vpc.demo_app_vpc.id

  tags = {
    Name = "demo-app-igw"
  }
}

// Routing table internet gw - public subnet
resource "aws_route_table" "internet_gw_to_public_subnet" {
  vpc_id = aws_vpc.demo_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_app_igw.id
  }

  tags = {
    Name = "internet-gateway-rules"
  }
}

// Associate internet gateway routing table with public subnet
resource "aws_route_table_association" "internet_gateway_public_subnet" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.internet_gw_to_public_subnet.id
}

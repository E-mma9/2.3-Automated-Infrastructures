provider "aws" { # AWS provider configureren
  region = "us-east-1" 
}

resource "aws_vpc" "klantA" { # VPC aanmaken
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "klantA"
  }
}

resource "aws_subnet" "public_subnet" { # Subnet aanmaken
  vpc_id                  = aws_vpc.klantA.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "klantA-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" { # Internet Gateway aanmaken
  vpc_id = aws_vpc.klantA.id

  tags = {
    Name = "klantA-igw"
  }
}

resource "aws_route_table" "public_routetable" { # Route Table aanmaken
  vpc_id = aws_vpc.klantA.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id # Route toevoegen voor internetverkeer via de Internet Gateway
  }

  tags = {
    Name = "klantA-public-rt"
  }
}


resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_routetable.id
}

resource "aws_security_group" "klantA_sg" { # Security Group aanmaken
  name   = "klantA-sg"
  vpc_id = aws_vpc.klantA.id

  
  ingress { # Ingress voor SSH-toegang
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress { # Ingress voor HTTP-toegang
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress {  # Ingress voor HTTPS-toegang
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress { # Ingress voor interne communicatie binnen de VPC
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  
  egress { # Egress voor uitgaand verkeer naar het internet
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  tags = {
    Name = "klantA-sg"
  }
}

resource "aws_instance" "KlantA_ec2" { # EC2-instance aanmaken
  ami = "ami-0c94855ba95c71c99" 
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.klantA_sg.id]
  
  key_name = "KlantA" 
}  }
    from_port   = 0


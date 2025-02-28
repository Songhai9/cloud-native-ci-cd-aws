#######################################################
# 1) VPC
#######################################################
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "cloud-native-vpc"
  }
}

#######################################################
# 2) Internet Gateway
#######################################################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "cloud-native-igw"
  }
}

#######################################################
# 3) Subnets publics
#######################################################
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.2.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2"
  }
}

#######################################################
# 4) Subnets privés
#######################################################
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "Private Subnet 2"
  }
}

#######################################################
# 5) Route table publique
#######################################################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Association route table ↔ subnet public_1
resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Association route table ↔ subnet public_2
resource "aws_route_table_association" "public_2_assoc" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt.id
}

#######################################################
# 6) NAT Gateway (pour les subnets privés)
#######################################################
# Elastic IP pour la NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "NAT EIP"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "NAT Gateway"
  }
}

#######################################################
# 7) Route table privée
#######################################################
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  # Redirige le trafic 0.0.0.0/0 via la NAT Gateway
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Association route table ↔ subnet private_1
resource "aws_route_table_association" "private_1_assoc" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_rt.id
}

# Association route table ↔ subnet private_2
resource "aws_route_table_association" "private_2_assoc" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_rt.id
}
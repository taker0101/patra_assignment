# Patra VPC
resource "aws_vpc" "patra-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "patra-vpc"
  }
}

# Patra Subnet
resource "aws_subnet" "patra-pubSN" {
  vpc_id                  = aws_vpc.patra-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "patra-pubSN"
  }
}

# patra IGW
resource "aws_internet_gateway" "patra-igw" {
  vpc_id = aws_vpc.patra-vpc.id
  tags = {
    Name = "patra-igw"
  }
}

# Patra RT
resource "aws_route_table" "patra-vpc-pubroutetable" {
  vpc_id = aws_vpc.patra-vpc.id

  tags = {
    Name = "patraRT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.patra-igw.id
  }

  depends_on = [aws_internet_gateway.patra-igw]

}

resource "aws_route" "patra-vpc-pubroute" {
  route_table_id         = aws_route_table.patra-vpc-pubroutetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.patra-igw.id
  depends_on             = [aws_route_table.patra-vpc-pubroutetable]
}

resource "aws_route_table_association" "patra-pubRTasso" {
  subnet_id      = aws_subnet.patra-pubSN.id
  route_table_id = aws_route_table.patra-vpc-pubroutetable.id
}

# vpc.tf
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" #Altere conforme seu range de IP
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24" #Altere conforme seu range de IP
  availability_zone = "us-west-1a"  # Altere conforme sua região
  map_public_ip_on_launch = true
  tags = {
    Name = "my-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24" #Altere conforme seu range de IP
  availability_zone = "us-west-1a"  # Altere conforme sua região
  tags = {
    Name = "my-private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my-public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

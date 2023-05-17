resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "public" {
  count = length(var.public-cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-cidr[count.index]
  availability_zone = var.az[count.index]

  tags = {
    Name = "Main"
  }
}



resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private-cidr

  tags = {
    Name = "Main"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}


resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public-cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.main.id
}





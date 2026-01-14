# البحث باستخدام الـ ID مباشرة لأن الـ Tags عندك بـ None
data "aws_vpc" "vpc" {
  id = var.vpc-name 
}

data "aws_internet_gateway" "igw" {
  filter {
    name   = "internet-gateway-id"
    values = [var.igw-name]
  }
}

data "aws_subnet" "subnet" {
  id = var.subnet-name
}

# هنا بنستخدم اسم الـ Security Group (default أو launch-wizard-1)
data "aws_security_group" "sg-default" {
  vpc_id = data.aws_vpc.vpc.id
  name   = var.security-group-name 
}

# ده هيفضل زي ما هو لأنه بيكاريت سابنت جديدة
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block              = "172.31.96.0/20" # خلي بالك: الـ Default VPC CIDR عادة بيكون 172.31.0.0/16
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-name2
  }
}

resource "aws_route_table" "rt2" {
  vpc_id = data.aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt-name2
  }
}

resource "aws_route_table_association" "rt-association2" {
  route_table_id = aws_route_table.rt2.id
  subnet_id      = aws_subnet.public-subnet2.id
}

resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
	    environment = "${var.environment}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"
	tags = {
        Name = "${var.IGW_name}"
    }
}

resource "aws_subnet" "subnet-public" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.public_subnet_name}"
    }
}
resource "aws_subnet" "subnet-private" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us-east-1b"

    tags = {
        Name = "${var.private_subnet_name}"
    }
}
resource "aws_subnet" "subnet-private2" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.private_subnet2_cidr}"
    availability_zone = "us-east-1c"

    tags = {
        Name = "${var.private_subnet2_name}"
    }
}
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${aws_subnet.subnet-private.id}", "${aws_subnet.subnet-private2.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}

resource "aws_route_table_association" "terraform-public" {
    subnet_id = "${aws_subnet.subnet-public.id}"
    route_table_id = "${aws_route_table.terraform-public.id}"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_eip" "vpc-nat-eip" {
  vpc      = true
}

resource "aws_nat_gateway" "vpc-nat-gw" {
  allocation_id = "${aws_eip.vpc-nat-eip.id}"
  subnet_id     = "${aws_subnet.vpc-private-subnet.0.id}"
  tags = "${merge(map("Name","vpc-nat-gw"),var.tags)}"
}

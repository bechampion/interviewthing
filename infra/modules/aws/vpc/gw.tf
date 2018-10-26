resource "aws_internet_gateway" "vpc-internet-gw" {
  vpc_id = "${aws_vpc.kube-vpc.id}"
  tags = "${var.tags}"
}


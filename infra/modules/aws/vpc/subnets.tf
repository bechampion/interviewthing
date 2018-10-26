resource "aws_subnet" "vpc-public-subnet" {
  count = "${length(var.public_subnets)}"
  vpc_id     = "${aws_vpc.kube-vpc.id}"
  cidr_block = "${element(var.public_subnets,count.index)}"
  tags = "${var.tags}"
}
resource "aws_subnet" "vpc-private-subnet" {
  count = "${length(var.private_subnets)}"
  vpc_id     = "${aws_vpc.kube-vpc.id}"
  cidr_block = "${element(var.private_subnets,count.index)}"
  tags = "${var.tags}"
}

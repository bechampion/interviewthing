resource "aws_vpc" "kube-vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  tags = "${merge(map("Name","kube-vpc"),var.tags)}"
}

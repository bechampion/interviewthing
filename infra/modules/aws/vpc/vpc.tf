resource "aws_vpc" "kube-vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "dedicated"
  tags = "${var.tags}"
}

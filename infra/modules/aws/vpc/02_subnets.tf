#hitting some strange bug where subents aren't distributed evenly
locals { 
  az = ["a","b","c"]
}
resource "aws_subnet" "vpc-public-subnet" {
  count = "${length(var.public_subnets)}"
  vpc_id     = "${aws_vpc.kube-vpc.id}"
  cidr_block = "${element(var.public_subnets,count.index)}"
  tags = "${merge(map("kubernetes.io/cluster/${var.cluster_name}", "shared","Name","vpc-public-subnet-${count.index}"),var.tags)}"
  availability_zone = "eu-west-1${local.az[count.index}}"
}
resource "aws_subnet" "vpc-private-subnet" {
  count = "${length(var.private_subnets)}"
  vpc_id     = "${aws_vpc.kube-vpc.id}"
  cidr_block = "${element(var.private_subnets,count.index)}"
  tags = "${merge(map("kubernetes.io/cluster/${var.cluster_name}", "shared","Name","vpc-private-subnet-${count.index}"),var.tags)}"
  availability_zone = "eu-west-1${local.az[count.index}}"
}

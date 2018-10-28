resource "aws_route_table" "private-route-table" {
  vpc_id = "${aws_vpc.kube-vpc.id}"
  tags = "${merge(map("Name","vpc-private-route"),var.tags)}"
}

resource "aws_route" "private-route"{
  route_table_id = "${aws_route_table.private-route-table.id}"
  nat_gateway_id = "${aws_nat_gateway.vpc-nat-gw.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private-route-association" {
  count = "${length(var.private_subnets)}"
  subnet_id = "${element(aws_subnet.vpc-private-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.private-route-table.id}"
}







resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.kube-vpc.id}"
  tags = "${merge(map("Name","vpc-public-route"),var.tags)}"
}

resource "aws_route" "public-route"{
  route_table_id = "${aws_route_table.public-route-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.vpc-internet-gw.id}"
}

resource "aws_route_table_association" "public-route-association" {
  count = "${length(var.public_subnets)}"
  subnet_id = "${element(aws_subnet.vpc-public-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}

output "interview_cluster_secid"{
  value = "${aws_security_group.interview-cluster-secgroup.id}"
}
output "vpc_private_subnets" {
  value = "${aws_subnet.vpc-private-subnet.*.id}"
}
output "vpc_public_subnets" {
  value = "${aws_subnet.vpc-public-subnet.*.id}"
}
output "vpc_id" {
  value = "${aws_vpc.kube-vpc.id}"
}


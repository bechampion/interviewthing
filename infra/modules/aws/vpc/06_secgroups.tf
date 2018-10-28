resource "aws_security_group" "interview-cluster-secgroup" {
  name        = "interview-cluster-secgroup"
  vpc_id      = "${aws_vpc.kube-vpc.id}"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = "${var.tags}"
}

resource "aws_security_group_rule" "interview-cluster-all-in" {
  cidr_blocks       = ["10.0.0.0/8"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.interview-cluster-secgroup.id}"
  to_port           = 0
  type              = "ingress"
}
resource "aws_security_group_rule" "interview-cluster-api-https-out" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.interview-cluster-secgroup.id}"
  to_port           = 443
  type              = "ingress"
}

data "aws_region" "current" {}

data "template_file" "node-bootstrap" {
  template = "${file("${path.module}/templates/bootstrap.sh")}"
  vars {
    cluster_endpoint = "${aws_eks_cluster.interview-cluster.endpoint}"
    cluster_name = "${var.cluster_name}"
    certificate_authority_data = "${aws_eks_cluster.interview-cluster.certificate_authority.0.data}"
  }
}
resource "aws_launch_configuration" "interview-launch-conf" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.interview-eks-node.name}"
  image_id                    = "ami-0c7a4976cb6fafd3a"
  instance_type               = "m4.large"
  name_prefix                 = "eks-node-interview"
  security_groups             = ["${var.interview_cluster_secid}"]
  user_data_base64            = "${base64encode(data.template_file.node-bootstrap.rendered)}"
  key_name                    = "test"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "interview-eks" {
  desired_capacity     = 1
  launch_configuration = "${aws_launch_configuration.interview-launch-conf.id}"
  max_size             = 1
  min_size             = 1
  name                 = "interview-eks-asg"
  vpc_zone_identifier  = ["${var.vpc_public_subnets}"]
  tag {
    key                 = "kubernetes.io/cluster/${var.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
}

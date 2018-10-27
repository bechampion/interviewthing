resource "aws_eks_cluster" "interview-cluster" {
  name            = "${var.cluster_name}"
  role_arn        = "${aws_iam_role.interview-cluster.arn}"
  vpc_config {
    security_group_ids = ["${var.interview_cluster_secid}"]
    subnet_ids         = ["${var.vpc_private_subnets}"]
  }
  depends_on = [
    "aws_iam_role_policy_attachment.interview-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.interview-cluster-AmazonEKSServicePolicy",
  ]
}

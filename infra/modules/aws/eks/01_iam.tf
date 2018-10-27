resource "aws_iam_role" "interview-cluster" {
  name = "terraform-eks-interview-cluster"
  assume_role_policy = "${file("${path.module}/templates/eks-assume.tf")}"
}

resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.interview-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.interview-cluster.name}"
}
resource "aws_iam_instance_profile" "interview-eks-node" {
  name = "interview-eks-node"
  role = "${aws_iam_role.interview-cluster.name}"
}

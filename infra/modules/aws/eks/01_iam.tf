resource "aws_iam_role" "interview-cluster" {
  name = "terraform-eks-interview-cluster"
  assume_role_policy = "${file("${path.module}/templates/eks-assume.tf")}"
}
resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEC2ContainerRegistryFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = "${aws_iam_role.interview-cluster.name}"
}
resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.interview-cluster.name}"
}
resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.interview-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.interview-cluster.name}"
}
resource "aws_iam_role_policy_attachment" "interview-cluster-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.interview-cluster.name}"
}
resource "aws_iam_instance_profile" "interview-eks-node" {
  name = "interview-eks-node"
  role = "${aws_iam_role.interview-cluster.name}"
}

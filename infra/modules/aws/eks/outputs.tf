data "template_file" "kubeconfig" {
  template = "${file("${path.module}/templates/kubeconfig.tf")}"
  vars {
    cluster_endpoint = " ${aws_eks_cluster.interview-cluster.endpoint}"
    certificate_authority_data = "${aws_eks_cluster.interview-cluster.certificate_authority.0.data}"
    cluster_name = "${var.cluster_name}"
  }
}
output "kubeconfig" {
  value = "${data.template_file.kubeconfig.rendered}"
}

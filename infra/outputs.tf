output "config_map_aws_auth" {
  value = "${module.kube-eks.config_map_aws_auth}"
}
output "kubeconfig" {
  value = "${module.kube-eks.kubeconfig}"
}

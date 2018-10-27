variable "region" {
  default = "eu-west-1"
}
variable "cluster_name" {
  type = "string"
  default = "kube-interview"
}

module "kube-vpc" {
  source = "./modules/aws/vpc/"
  vpc_name = "kube-vpc"
  cluster_name = "${var.cluster_name}"
  vpc_cidr_block = "10.0.0.0/16"
  tags = "${map("Reason","Kubernetes Cluster","Environment","interview")}"
  private_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  public_subnets = ["10.0.128.0/24","10.0.129.0/24","10.0.130.0/24"]

}

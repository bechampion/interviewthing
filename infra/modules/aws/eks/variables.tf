variable "cluster_name" { 
  type = "string"
}
variable "vpc_public_subnets" { 
  type = "list"
}
variable "vpc_private_subnets" { 
  type = "list"
}
variable "interview_cluster_secid" { 
  type = "string"
}
variable "tags" { 
  type = "map"
}

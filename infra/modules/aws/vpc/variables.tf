variable "vpc_cidr_block" {
  type = "string"
}
variable "tags" {
  type = "map"
}
variable "vpc_name" {
  type = "string"
}
variable "public_subnets" {
  type = "list"
}
variable "private_subnets" {
  type = "list"
}

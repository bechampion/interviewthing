provider "aws" {
  version = ">= 1.39"
  region  = "${var.region}"
  #assume_role {
    #role_arn = ""
  #}
}


terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket               = "interviewthing-bucket"
    key                  = "infra"
    region               = "eu-west-1"
    workspace_key_prefix = ""
    #role_arn             = ""
  }
}


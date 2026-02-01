provider "aws" {
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket         = "tf-resources-git-actions-2026"
    region         = "us-east-1"
    key            = "github-actions/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "tf-resources-gha-lock"
  }
}

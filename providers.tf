provider "aws" {
  alias = "ecr"

  region = "us-east-2"

  assume_role {
    role_arn = var.ecr_account_role_arn
  }
}
provider "aws" {
  alias = "pulling_account"

  region = "us-east-2"

  assume_role {
    role_arn = var.pulling_account_role_arn
  }
}

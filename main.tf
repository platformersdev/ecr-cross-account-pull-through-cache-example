data "aws_region" "current" {
  provider = aws.ecr
}

data "aws_caller_identity" "ecr_account" {
  provider = aws.ecr
}

data "aws_caller_identity" "pulling_account" {
  provider = aws.pulling_account
}

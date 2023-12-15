
resource "aws_ecr_registry_policy" "policy" {
  provider = aws.ecr

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowPullThroughCacheFromOtherAccount",
        Effect = "Allow",
        Principal = {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.pulling_account.account_id}:root"
        },
        Action = [
          "ecr:CreateRepository",
          "ecr:BatchImportUpstreamImage"
        ],
        Resource = "arn:aws:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.ecr_account.account_id}:repository/registry.k8s.io/*"
      }
    ]
  })
}

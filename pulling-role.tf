
resource "aws_iam_role" "puller" {
  provider = aws.pulling_account

  name = "ecr-puller"
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement: {
      Action: ["sts:AssumeRole"],
      Effect: "Allow",
      Principal: {
        "AWS" : "arn:aws:iam::${data.aws_caller_identity.pulling_account.account_id}:root"
      }
    }
  })
}

resource "aws_iam_role_policy" "compute_pull_policy" {
  provider = aws.pulling_account

  name = "ecr-pull-through-cache-${data.aws_region.current.name}"
  role = aws_iam_role.puller.name
  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "AllowPullThroughCacheInECRAccount",
        Effect : "Allow",
        Action : [
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:CreateRepository",
          "ecr:BatchImportUpstreamImage"
        ],
        Resource : [
          "arn:aws:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.ecr_account.account_id}:repository/registry.k8s.io/*"
        ]
      },
      {
        Sid : "AllowLogin",
        Effect : "Allow",
        Action : [
          "ecr:GetAuthorizationToken",
        ],
        Resource : [
          "*"
        ]
      },
    ]
  })
}

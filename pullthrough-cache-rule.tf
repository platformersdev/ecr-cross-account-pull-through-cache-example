resource "aws_ecr_pull_through_cache_rule" "rule" {
  provider = aws.ecr

  ecr_repository_prefix = "registry.k8s.io"
  upstream_registry_url = "registry.k8s.io"
}

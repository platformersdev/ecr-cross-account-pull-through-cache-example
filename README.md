# ecr-cross-account-pull-through-cache-example

1. Create resources in two different accounts:
   1. `tofu apply -var ecr_account_role_arn=arn:aws:iam::ecr_account:role/OrganizationAccountAccessRole -var pulling_account_role_arn=arn:aws:iam::pulling_account:role/OrganizationAccountAccessRole`
   2. (you may use `terraform` if you'd prefer the non-open-source HashiCorp Terraform product)
2. See [blog post on our web site for instructions on adding repository creation template](http://platformers.dev/log/2023/ecr-cross-account-pull-through-cache/).

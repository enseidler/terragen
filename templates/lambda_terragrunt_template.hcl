locals {
  common_vars = yamldecode(file("${find_in_parent_folders("common_vars.yaml")}"))
}

terraform {
  source = "git::git@github.com:Bancar/${local.common_vars.repository}.git//lambda/LambdaNameService?ref=terraform_branch"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  artifact_version = artifact_version // TODO Modify!
  tags = {
    BusinessUnit = local.common_vars.business_unit
    Owner = local.common_vars.owner
    Environment = local.common_vars.environment
    Name = "LambdaNameService"
  }
}
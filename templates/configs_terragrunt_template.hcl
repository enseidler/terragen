locals {
  common_vars = yamldecode(file("${find_in_parent_folders("common_vars.yaml")}"))
  variables = yamldecode(file("${find_in_parent_folders("variables.yaml")}"))
  lambda_lambda_name_service_mock_outputs = {
    lambda_name_service_function_name = "mock_function_name"
  }
}

terraform {
  source = "git::git@github.com:Bancar/${local.common_vars.repository}.git//configs/LambdaNameService?ref=terraform_branch"
}

include {
  path = find_in_parent_folders()
}

dependency "lambda_lambda_name_service" {
  config_path = "../../lambda/LambdaNameService"
  mock_outputs = local.lambda_lambda_name_service_mock_outputs
}

inputs = {
  lambda_name_service_function_name = lookup(dependency.lambda_lambda_name_service.outputs, "lambda_name_service_function_name", local.lambda_lambda_name_service_mock_outputs.lambda_name_service_function_name)
}

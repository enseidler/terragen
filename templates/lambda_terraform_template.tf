module "LambdaNameService" {
  source = "git@github.com:Bancar/terraform-aws-lambda.git?ref=2.25"

  artifact_id = "artifactId"
  artifact_version = var.artifact_version
  repo_name = var.lambda_repo_name
  product_bucket = var.lambda_product_bucket
  function_description = lambda_description // TODO Modify!
  lambda_policy_path = "${path.root}/policies/iam_p_lambda_name.tpl"
  environment = var.environment
  policy_lambda_vars = {}
  tags = var.tags
}



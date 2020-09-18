module "LambdaNameServiceConfigs" { // TODO Modify module name and configs id!
  source = "git@github.com:Bancar/terraform-aws-dynamodb-item.git?ref=2.2"
  environment = var.environment
  item = <<ITEM
{
  "id": {
    "S": "${var.lambda_name_service_function_name}"
  },
  "config": {
    "M": {}
  }
}
ITEM
}

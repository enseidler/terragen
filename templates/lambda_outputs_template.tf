output "lambda_name_service_function_name" {
  value = module.LambdaNameService.function_name
}

output "lambda_name_service_function_arn" {
  value = module.LambdaNameService.arn
}

output "lambda_name_service_function_invoke_arn" {
  value = module.LambdaNameService.invoke_arn
}

# Lambda Alias
output "lambda_alias_name" {
  description = "The name of the Lambda Function Alias"
  value       = element(concat(data.aws_lambda_alias.existing.*.name, aws_lambda_alias.with_refresh.*.name, aws_lambda_alias.no_refresh.*.name, [""]), 0)
}

output "lambda_alias_arn" {
  description = "The ARN of the Lambda Function Alias"
  value       = element(concat(data.aws_lambda_alias.existing.*.arn, aws_lambda_alias.with_refresh.*.arn, aws_lambda_alias.no_refresh.*.arn, [""]), 0)
}

output "lambda_alias_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  value       = element(concat(data.aws_lambda_alias.existing.*.invoke_arn, aws_lambda_alias.with_refresh.*.invoke_arn, aws_lambda_alias.no_refresh.*.invoke_arn, [""]), 0)
}

output "lambda_alias_description" {
  description = "Description of alias"
  value       = element(concat(data.aws_lambda_alias.existing.*.description, aws_lambda_alias.with_refresh.*.description, aws_lambda_alias.no_refresh.*.description, [""]), 0)
}

output "lambda_alias_function_version" {
  description = "Lambda function version which the alias uses"
  value       = element(concat(data.aws_lambda_alias.existing.*.function_version, aws_lambda_alias.with_refresh.*.function_version, aws_lambda_alias.no_refresh.*.function_version, [""]), 0)
}


# Lambda Event Source Mapping
output "lambda_event_source_mapping_function_arn" {
  description = "The the ARN of the Lambda function the event source mapping is sending events to"
  value       = { for k, v in aws_lambda_event_source_mapping.this : k => v.function_arn }
}

output "lambda_event_source_mapping_state" {
  description = "The state of the event source mapping"
  value       = { for k, v in aws_lambda_event_source_mapping.this : k => v.state }
}

output "lambda_event_source_mapping_state_transition_reason" {
  description = "The reason the event source mapping is in its current state"
  value       = { for k, v in aws_lambda_event_source_mapping.this : k => v.state_transition_reason }
}

output "lambda_event_source_mapping_uuid" {
  description = "The UUID of the created event source mapping"
  value       = { for k, v in aws_lambda_event_source_mapping.this : k => v.uuid }
}
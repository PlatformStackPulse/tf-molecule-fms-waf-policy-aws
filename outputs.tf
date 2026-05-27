output "fms_policy_id" {
  description = "The ID of the FMS policy."
  value       = module.fms_policy.policy_id
}

output "fms_policy_arn" {
  description = "The ARN of the FMS policy."
  value       = module.fms_policy.policy_arn
}

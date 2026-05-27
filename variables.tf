# -----------------------------------------------------------------------------
# Module-Specific Variables
# -----------------------------------------------------------------------------

variable "set_admin_account" {
  type        = bool
  description = "Whether to set the FMS admin account. Only needed once per org."
  default     = false
}

variable "admin_account_id" {
  type        = string
  description = "AWS account ID to delegate as FMS administrator."
  default     = ""
}

variable "resource_type" {
  type        = string
  description = "Resource type to protect (e.g. AWS::ElasticLoadBalancingV2::LoadBalancer)."
  default     = "AWS::ElasticLoadBalancingV2::LoadBalancer"
}

variable "resource_type_list" {
  type        = list(string)
  description = "List of resource types for the FMS policy."
  default     = []
}

variable "exclude_resource_tags" {
  type        = bool
  description = "Whether to exclude resources with specified tags."
  default     = false
}

variable "remediation_enabled" {
  type        = bool
  description = "Whether auto-remediation is enabled."
  default     = false
}

variable "include_account_ids" {
  type        = list(string)
  description = "List of AWS account IDs to include. Empty means all."
  default     = []
}

variable "exclude_account_ids" {
  type        = list(string)
  description = "List of AWS account IDs to exclude."
  default     = []
}

variable "managed_service_data" {
  type        = string
  description = "JSON managed service data for the FMS policy (WAF rule groups config)."
  default     = null
}

variable "delete_unused_fm_managed_resources" {
  type        = bool
  description = "Whether to delete unused FM-managed resources."
  default     = false
}

# -----------------------------------------------------
# Molecule: FMS WAF Policy
# Organization-level WAF enforcement via AWS Firewall Manager.
# Requires: AWS Organizations, FMS delegated admin.
# -----------------------------------------------------

# --- FMS Admin Account (delegate FMS to security account) ---
module "fms_admin" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-fms-admin-account-aws.git?ref=v1.1.0"

  count = var.set_admin_account ? 1 : 0

  context    = module.this.context
  account_id = var.admin_account_id
}

# --- FMS WAF Policy ---
module "fms_policy" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-fms-policy-aws.git?ref=v1.1.0"

  context                            = module.this.context
  name                               = module.this.id
  resource_type                      = var.resource_type
  exclude_resource_tags              = var.exclude_resource_tags
  remediation_enabled                = var.remediation_enabled
  include_account_ids                = var.include_account_ids
  exclude_account_ids                = var.exclude_account_ids
  managed_service_data               = var.managed_service_data
  resource_type_list                 = var.resource_type_list
  delete_unused_fm_managed_resources = var.delete_unused_fm_managed_resources

  depends_on = [module.fms_admin]
}

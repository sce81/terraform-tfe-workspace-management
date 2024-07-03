data "tfe_policy_set" "main" {
  count        = length(var.sentinel_policy)
  name         = element(var.sentinel_policy, count.index)
  organization = var.organization
}
locals {
  auto_apply = contains(var.workspace_tags, "production") == true ? false : true
}

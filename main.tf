resource "tfe_workspace" "main" {
  name                           = var.name
  description                    = var.description
  organization                   = var.organization
  tag_names                      = var.workspace_tags
  project_id                     = var.project_id
  auto_apply                     = local.auto_apply
  structured_run_output_enabled  = var.structured_run_output_enabled
  terraform_version              = var.terraform_version
  auto_destroy_activity_duration = var.auto_destroy_activity_duration
  remote_state_consumer_ids      = var.remote_state_workspaces
  working_directory              = var.working_directory


  dynamic "vcs_repo" {
    for_each = var.vcs_repo
    content {
      identifier                 = lookup(vcs_repo.value, "identifier", null)
      oauth_token_id             = lookup(vcs_repo.value, "oauth_token_id", null)
      github_app_installation_id = lookup(vcs_repo.value, "github_app_installation_id", null)
      branch                     = lookup(vcs_repo.value, "branch", null)
    }
  }
}

resource "tfe_variable" "main" {
  for_each = var.tfe_variables

  key          = each.key
  value        = each.value.value
  category     = each.value.category
  description  = each.value.description
  sensitive    = each.value.sensitive
  workspace_id = tfe_workspace.main.id
}

resource "tfe_workspace_policy_set" "main" {
  count         = length(data.tfe_policy_set.main.*.id)
  policy_set_id = element(data.tfe_policy_set.main.*.id, count.index)
  workspace_id  = tfe_workspace.main.id
}
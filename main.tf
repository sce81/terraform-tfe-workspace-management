resource "tfe_workspace" "main" {
  name         = var.name
  organization = var.organization
  tag_names    = var.workspace_tags
  project_id   = var.project_id
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
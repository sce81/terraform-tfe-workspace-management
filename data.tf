locals {
  auto_apply = contains(data.tfe_workspace.main.tag_names, "production") == true ? false : true
}


data "tfe_workspace" "main" {
  name         = var.name
  organization = var.organization

  depends_on = [
    tfe_workspace.main.name
  ]

}
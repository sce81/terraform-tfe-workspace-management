# Terraform Module for Terraform Cloud Workspace Management
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use.


## Getting Started

This module is intended to create a Workspace with optional associated variables within Terraform Cloud

Resources
- tfe_workspace
- tfe_variable


### Prerequisites

    Terraform ~> 1.9.0
    tfe_provider ~> 0.70

### Tested

    Terraform ~> 1.9.0
    tfe_provider ~> 0.70
    please note, not backwards compatible with older versions of the tfe provider. 
### Installing

This module should be called by a terraform environment configuration

##### Usage

```
    module "TFC_Workspace_EC2_Deployments" {
      for_each = local.workspace_vars.ec2_vars
      source                         = "app.terraform.io//YOURORG/workspace-management/tfe"
      version                        = "4.0.0"
      name                           = "aws_workspace_ec2_${each.key}"
      organization                   = data.tfe_organization.main.name
      vcs_repo                       = local.ec2_instance
      tfe_variables                  = each.value
      project_id                     = tfe_project.deploy_ec2.id
      structured_run_output_enabled  = "false"
      variable_set                   = flatten([var.variable_sets])
      terraform_version              = var.terraform_version
      auto_destroy_activity_duration = var.auto_destroy_activity_duration
      workspace_tags = {
        "identifier" = each.key,
        "platform"   = "aws",
        "target"     = "ec2",
        "project"    = tfe_project.deploy_ec2.name
        "env"        = tostring(each.value.env.value)
      }
    }
```



### Outputs

The following values are outputted
```
    id                  = tfe_workspace.main.id
```


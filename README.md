# Terraform Module for Terraform Cloud Workspace Management
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use.


## Getting Started

This module is intended to create a Workspace with optional associated variables within Terraform Cloud

Resources
- tfe_workspace
- tfe_variable


### Prerequisites

    Terraform ~> 1.9.0
    tfe_provider ~> 0.58

### Tested

    Terraform ~> 1.9.0
    tfe_provider ~> 0.58
### Installing

This module should be called by a terraform environment configuration

##### Usage

```
    module "example_workspace" {
      source           = "app.terraform.io/YOURORG/tfc-workspace/module"
      version          = "1.0.0"
        name           = "tfc_workspace_example"
        organization   = var.org_name
        tfe_variables  = local.dev_vars
        project_id     = var.project_id
        workspace_tags = ["tag1", "tag2", "tag3"]
    }
```



### Outputs

The following values are outputted
```
    id                  = tfe_workspace.main.id
```


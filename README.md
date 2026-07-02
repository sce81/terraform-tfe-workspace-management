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


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [tfe_variable.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace_policy_set.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_policy_set) | resource |
| [tfe_workspace_variable_set.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |
| [tfe_policy_set.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/policy_set) | data source |
| [tfe_variable_set.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/variable_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | n/a | `string` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the variable within the workspace | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the organisation to assign the varable to. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Name of the project to assign the workspace to | `string` | `null` | no |
| <a name="input_sentinel_policy"></a> [sentinel\_policy](#input\_sentinel\_policy) | List of Sentinel Policies to apply to this workspace | `list(string)` | `[]` | no |
| <a name="input_structured_run_output_enabled"></a> [structured\_run\_output\_enabled](#input\_structured\_run\_output\_enabled) | n/a | `string` | `false` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Optional override for workspace Terraform Version | `string` | `null` | no |
| <a name="input_tfe_variables"></a> [tfe\_variables](#input\_tfe\_variables) | Map of variable configuration | <pre>map(object(<br/>    {<br/>      key         = optional(string)<br/>      value       = optional(string)<br/>      description = optional(string)<br/>      category    = optional(string)<br/>      hcl         = optional(string)<br/>      sensitive   = optional(bool) // it is a general recommendation to not deploy sensitive variables using terraform <br/>  }))</pre> | `{}` | no |
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | List of variable sets to apply to this workspace | `list(string)` | `[]` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | VCS\_Repo configuration parameters | `list(any)` | `[]` | no |
| <a name="input_workspace_tags"></a> [workspace\_tags](#input\_workspace\_tags) | List of tags to be assigned to the workspace | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->
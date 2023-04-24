variable "name" {
  type        = string
  description = "Name of the variable within the workspace"
}

variable "project_id" {
  type        = string
  description = "Name of the project to assign the workspace to"
  default     = null
}

variable "organization" {
  type        = string
  description = "Name of the organisation to assign the varable to."
}

variable "workspace_tags" {
  type        = list(any)
  default     = []
  description = "List of tags to be assigned to the workspace"
}

variable "tfe_variables" {
  description = "Map of variable configuration"
  type = map(object(
    {
      key         = optional(string)
      value       = optional(string)
      description = optional(string)
      category    = optional(string)
      hcl         = optional(string)
      sensitive   = optional(bool) // it is a general recommendation to not deploy sensitive variables using terraform 
  }))
  default = {}
}

variable "vcs_repo" {
  type        = list(any)
  default     = []
  description = "VCS_Repo configuration parameters"
}

variable "auto_apply" {
  type    = string
  default = false
}

variable "structured_run_output_enabled" {
  type    = string
  default = false
}
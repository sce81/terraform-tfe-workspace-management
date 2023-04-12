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
      sensitive   = optional(bool) // it is a general recommendation to not deploy sensitive variables using terraform 
  }))
  default = {}
}

variable "vcs_repo" {
  type        = string
  default     = null
  description = "Github Repo to populate workspace with"
}
variable "github_app_id" {
  type        = string
  default     = null
  description = "Github installation ID to use to access repo"
}
variable "git_branch" {
  type        = string
  default     = null
  description = "branch of repo to pull"
}

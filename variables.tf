variable "name" {
  type        = string
  description = "Name of the variable within the workspace"
}
variable "description" {
  type        = string
  default     = null
  description = "descrption of workspace purpose"
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
  type        = map(any)
  default     = {}
  description = "Map of tags to be assigned to the workspace"
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

variable "variable_set" {
  type        = list(string)
  default     = []
  description = "List of policy sets to apply to this workspace"
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

variable "auto_destroy_activity_duration" {
  type        = string
  description = "A future date/time string at which point all resources in a workspace will be scheduled for deletion. Must be a string in RFC3339 format (e.g. \"2100-01-01T00:00:00Z\")."
  default     = null
}

variable "structured_run_output_enabled" {
  type    = string
  default = false
}

variable "sentinel_policy" {
  type        = list(string)
  default     = []
  description = "List of Sentinel Policies to apply to this workspace"

}

variable "terraform_version" {
  type        = string
  default     = null
  description = "Optional override for workspace Terraform Version"
}

variable "remote_state_workspaces" {
  type        = set(string)
  default     = []
  description = "List of workspaces that can access the statefile belonging to this workspace"
}

variable "working_directory" {
  type        = string
  default     = null
  description = "working directory to execute terraform within. defaults to root of workspace"
}

variable "assessments_enabled" {
  type        = bool
  default     = false
  description = "Whether to regularly run health assessments such as drift detection on the workspace"
}

variable "global_remote_state" {
  type        = bool
  default     = false
  description = "Whether the workspace allows all workspaces in the organization to access its state data during runs."
}
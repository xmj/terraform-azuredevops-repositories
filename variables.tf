variable "git_repository" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    git_repository = {
      name = ""
      initialization = {
        init_type             = "Uninitialized"
        source_type           = ""
        source_url            = ""
        service_connection_id = ""
      }
    }
  }

  # compare and merge custom and default values
  git_repository_values = {
    for git_repository in keys(var.git_repository) :
    git_repository => merge(local.default.git_repository, var.git_repository[git_repository])
  }

  # merge all custom and default values
  git_repository = {
    for git_repository in keys(var.git_repository) :
    git_repository => merge(
      local.git_repository_values[git_repository],
      {
        for config in ["initialization"] :
        config => merge(local.default.git_repository[config], local.git_repository_values[git_repository][config])
      }
    )
  }
}

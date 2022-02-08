output "git_repository" {
  description = "azuredevops_git_repository results"
  value = {
    for git_repository in keys(azuredevops_git_repository.git_repository) :
    git_repository => {
      id = azuredevops_git_repository.git_repository[git_repository].id
      name = azuredevops_git_repository.git_repository[git_repository].name
      default_branch  = azuredevops_git_repository.git_repository[git_repository].default_branch
    }
  }
}

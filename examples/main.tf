module "azuredevops_repositories" {
  source = "../modules/azure/terraform-azuredevops_repositories"
  git_repository = {
    azuredevops = {
      project_id = module.azuredevops_project.project["project_name"].id
    }
  }
}

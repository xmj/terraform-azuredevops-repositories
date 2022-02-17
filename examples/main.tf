module "repositories" {
  source = "registry.terraform.io/T-Systems-MMS/pipelines/repositories"
  git_repository = {
    azuredevops = {
      project_id = module.project.project["project_name"].id
    }
  }
}

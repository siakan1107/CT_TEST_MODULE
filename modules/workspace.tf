resource "tfe_workspace" "this" {
  project_id   = data.tfe_project.this.id 
  name         = local.workspace_name
  organization = var.tfc_organization_name
  vcs_repo {
    identifier     = var.vcs_repo_identifier
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
}

resource "tfe_variable" "enable_aws_provider_auth" {
  workspace_id = tfe_workspace.this.id

  key      = "TFC_AWS_PROVIDER_AUTH"
  value    = "true"
  category = "env"

  description = "Enable the Workload Identity integration for AWS."
}

resource "tfe_variable" "tfc_aws_role_arn" {
  workspace_id = tfe_workspace.this.id

  key      = "TFC_AWS_RUN_ROLE_ARN"
  value    = aws_iam_role.this.arn
  category = "env"

  description = "The AWS role arn runs will use to authenticate."
}
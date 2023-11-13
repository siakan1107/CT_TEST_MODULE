locals {
  oauth_token_id = "ot-gZ8WnNTbRFDhkJtn"
}

module "main_dpc" {
  source                      = "./modules/"
  tfc_hostname                = var.tfc_hostname
  tfc_organization_name       = var.tfc_organization_name
  tfc_project_name            = var.tfc_project_name
  tfc_provider_arn            = var.tfc_provider_arn
  tfc_provider_client_id_list = var.tfc_provider_client_id_list
  dpc_name                    = var.dpc_name
  vcs_repo_identifier         = var.vcs_repo_identifier
  vcs_repo_oauth_token_id     = local.oauth_token_id
  managed_policies            = var.managed_policies
  custom_policies             = var.custom_policies

}
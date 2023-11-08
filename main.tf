locals {
  tfc_provider_arn            = aws_iam_openid_connect_provider.tfc_provider.arn
  tfc_provider_client_id_list = aws_iam_openid_connect_provider.tfc_provider.client_id_list

}


module "identity_center_dpc" {
  source                  = "./modules/"
  tfc_hostname            = var.tfc_hostname
  tfc_organization_name   = var.tfc_organization_name
  tfc_project_name        = var.tfc_project_name
  dpc_name                = var.dpc_name
  vcs_repo_identifier     = var.vcs_repo_identifier
  vcs_repo_oauth_token_id = var.vcs_repo_oauth_token_id
 
  tfc_provider_arn            = local.tfc_provider_arn
  tfc_provider_client_id_list = local.tfc_provider_client_id_list

  custom_policies             = var.custom_policies

  # # count                       = var.managed_policies != null ? 1 : 0
  # for_each = toset(var.managed_policies)
  managed_policies            = var.managed_policies
  
}

output "managed_policies" {
  value = var.managed_policies
  
}

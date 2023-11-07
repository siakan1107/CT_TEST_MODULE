locals {
  # oauth_token_id              = "ot-5PH2w2nmqH4Sskec"
  oauth_token_id              = "ot-XbUcELWn6pXKunZT"
  tfc_provider_arn            = aws_iam_openid_connect_provider.tfc_provider.arn
  tfc_provider_client_id_list = aws_iam_openid_connect_provider.tfc_provider.client_id_list
  tfc_project_name            = "Testkkb"
  # tfc_project_name            = "INFRA"
  tfc_hostname          = "app.terraform.io"
  tfc_organization_name = "CT_TEST_KB"
  # tfc_organization_name       = "KoreanAir_CDSO"
  vcs_repo_identifier = {
    identity_center = "siakan1107/infra-121754699974-identitycenter"
    # organization    = "PRJDEVSECOPS/infra-121754699974-organization"
  }
}


module "identity_center_dpc" {
  source                      = "./modules/"
  tfc_hostname                = "app.terraform.io"
  tfc_organization_name       = "CT_TEST_KB"
  tfc_project_name            = "Testkkb"
  dpc_name                    = "identity_center"
  vcs_repo_identifier         = "siakan1107/infra-121754699974-identitycenter"
  vcs_repo_oauth_token_id     = "ot-gZ8WnNTbRFDhkJtn"
  managed_policies            = ["AdministratorAccess", "IAMFullAccess"]
  custom_policies             = ["test1", "test2"]
  tfc_provider_arn            = local.tfc_provider_arn
  tfc_provider_client_id_list = local.tfc_provider_client_id_list
}

# module "organization_dpc" {
#   source                      = "./modules/"
#   tfc_hostname                = var.tfc_hostname
#   tfc_organization_name       = var.tfc_organization_name
#   tfc_project_name            = "INFRA"
#   dpc_name                    = "organization"
#   vcs_repo_identifier         = local.vcs_repo_identifier.organization
#   vcs_repo_oauth_token_id     = local.oauth_token_id
#   managed_policies            = ["AWSOrganizationsFullAccess"]
#   tfc_provider_arn            = local.tfc_provider_arn
#   tfc_provider_client_id_list = local.tfc_provider_client_id_list
#   custom_policies             = [null]

# }

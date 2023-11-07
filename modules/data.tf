data "tfe_project" "this" {
  organization = var.tfc_organization_name
  name         = var.tfc_project_name
}

data "aws_caller_identity" "target_account_id" {}

locals {
  workspace_name = "${var.tfc_project_name}-${data.aws_caller_identity.target_account_id.account_id}-${upper(var.dpc_name)}"
}

data "aws_iam_policy" "managed_policies" {
  for_each = toset(var.managed_policies)
  name     = each.value
}
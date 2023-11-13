variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

variable "tfc_organization_name" {
  type        = string
  default     = "KoreanAir_CDSO"
  description = "The name of your Terraform Cloud organization"
}

variable "tfc_project_name" {
  type        = string
  default     = null
  description = "The project under which a workspace will be created"
}

variable "dpc_name" {
  type    = string
  default = null
}

variable "vcs_repo_identifier" {
  type    = string
  default = null
}

variable "vcs_repo_oauth_token_id" {
  type    = string
  default = null
}

variable "custom_policies" {
  type        = map(string)
  default     = {}
  description = "The name of your custom_policies"
}

variable "managed_policies" {
  description = "managed policies name"
  default     = []
  type        = list(string)
}

variable "tfc_provider_arn" {}
variable "tfc_provider_client_id_list" {
  type = list(string)
}
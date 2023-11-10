provider "aws" {
  region = var.region
  # assume_role {
  #   role_arn = var.assume_role_arn
  # }


}

provider "tfe" {
  hostname = var.tfc_hostname
}
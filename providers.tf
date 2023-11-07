provider "aws" {
  region = var.region
}

provider "tfe" {
  hostname = var.tfc_hostname
}
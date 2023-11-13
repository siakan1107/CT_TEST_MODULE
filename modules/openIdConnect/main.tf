output "tfc_provider_arn" {
  value = aws_iam_openid_connect_provider.tfc_provider.arn
}

output "tfc_provider_client_id_list" {
  value = aws_iam_openid_connect_provider.tfc_provider.client_id_list
}

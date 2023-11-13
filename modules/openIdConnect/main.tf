data "aws_iam_openid_connect_provider" "example" {
  url = data.tls_certificate.tfc_certificate.url
}
resource "aws_iam_openid_connect_provider" "tfc_provider" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = [var.tfc_aws_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}

output "tfc_provider_arn" {
  value = aws_iam_openid_connect_provider.tfc_provider.arn
}

output "tfc_provider_client_id_list" {
  value = aws_iam_openid_connect_provider.tfc_provider.client_id_list
}
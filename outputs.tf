# Outputs file
output "catapp_url" {
  value = "http://${aws_instance.aml2.public_dns}"
}

output "catapp_ip" {
  value = "http://${aws_instance.aml2.public_ip}"
}

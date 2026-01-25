output "public-ip" {
  value = aws_instance.public_server.public_ip
}
output "private-ip" {
  value = aws_instance.private_server.private_ip
}
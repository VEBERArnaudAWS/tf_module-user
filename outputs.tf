output "name" {
  value = aws_iam_user.user.*.name
}

output "encrypted_password" {
  value = aws_iam_user_login_profile.login.*.encrypted_password
}

output "encrypted_secret" {
  value = aws_iam_access_key.access_key.*.encrypted_secret
}

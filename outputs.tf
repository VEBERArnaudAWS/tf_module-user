output "name" {
  value = "${!var.bypass ? aws_iam_user.name : false}"
}

output "encrypted_password" {
  value = "${!var.bypass && var.with_console_access ? aws_iam_user_login_profile.login.*.encrypted_password : false}"
}

output "encrypted_secret" {
  value = "${!var.bypass && var.with_programmatic_access ? aws_iam_access_key.access_key.*.encrypted_secret : false}"
}

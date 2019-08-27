resource "aws_iam_user" "user" {
  count = var.bypass == "true" ? 0 : 1

  name = var.name

  tags = {
    terraformed = true
  }
}

resource "aws_iam_user_login_profile" "login" {
  count = var.bypass == true || var.with_console_access == false ? 0 : 1

  user    = aws_iam_user.user.name
  pgp_key = var.encoded_pgp_public_key
}

resource "aws_iam_access_key" "access_key" {
  count = var.bypass == true || var.with_programmatic_access == false ? 0 : 1

  user    = aws_iam_user.user.name
  pgp_key = var.encoded_pgp_public_key
}

resource "aws_iam_user_ssh_key" "ssh_key" {
  count = var.bypass == true || var.ssh_key == "" ? 0 : 1

  username = aws_iam_user.user.name

  encoding   = "SSH"
  public_key = var.ssh_key
}

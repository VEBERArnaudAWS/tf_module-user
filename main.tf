resource "aws_iam_user" "user" {
  count = var.bypass ? 0 : 1

  name = var.name

  tags = {
    terraformed = true
  }
}

resource "aws_iam_user_login_profile" "login" {
  count = var.bypass || ! var.with_console_access ? 0 : 1

  user    = aws_iam_user[0].user.name
  pgp_key = var.encoded_pgp_public_key
}

resource "aws_iam_access_key" "access_key" {
  count = var.bypass || ! var.with_programmatic_access ? 0 : 1

  user    = aws_iam_user[0].user.name
  pgp_key = var.encoded_pgp_public_key
}

resource "aws_iam_user_ssh_key" "ssh_key" {
  count = var.bypass || var.ssh_key == "" ? 0 : 1

  username = aws_iam_user[0].user.name

  encoding   = "SSH"
  public_key = var.ssh_key
}

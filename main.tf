data "aws_iam_policy_document" "assume" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = [var.service_identifier]
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

data "aws_iam_policy_document" "this" {
  statement {
    effect    = "Allow"
    actions   = var.actions
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "inline-policy"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.this.json
}

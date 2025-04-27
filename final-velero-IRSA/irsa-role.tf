resource "aws_iam_role" "velero_irsa_role" {
  name = "velero-irsa-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = local.oidc_provider_arn
        }
        Condition = {
          StringEquals = {
            "${local.oidc_provider_url}:sub" = "system:serviceaccount:velero:velero"
          }
        }
        Sid = ""
      }
    ]
  })

  tags = {
    Environment = "velero"
  }
}

resource "aws_iam_role_policy_attachment" "velero_irsa_policy_attachment" {
  role       = aws_iam_role.velero_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


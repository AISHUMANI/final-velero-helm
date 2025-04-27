output "velero_irsa_role_name" {
  description = "Name of the Velero IRSA IAM Role"
  value       = aws_iam_role.velero_irsa_role.name
}

output "velero_irsa_role_arn" {
  description = "ARN of the Velero IRSA IAM Role"
  value       = aws_iam_role.velero_irsa_role.arn
}

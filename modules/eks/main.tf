resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.private_subnets
    endpoint_private_access = true
    endpoint_public_access  = false
  }
access_config {
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy]
}

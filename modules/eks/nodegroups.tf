resource "aws_eks_node_group" "on_demand" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "on-demand"
  subnet_ids      = var.private_subnets
  capacity_type   = "ON_DEMAND"
  instance_types  = ["m5.large"]
  node_role_arn = aws_iam_role.node_group.arn

  scaling_config {
    desired_size = 2
    max_size     = 6
    min_size     = 2
  }
}

resource "aws_eks_node_group" "spot" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "spot"
  subnet_ids      = var.private_subnets
  capacity_type   = "SPOT"
  instance_types  = ["m5.large","m5a.large","m4.large"]
  node_role_arn = aws_iam_role.node_group.arn

  scaling_config {
    desired_size = 2
    max_size     = 10
    min_size     = 1
  }
}

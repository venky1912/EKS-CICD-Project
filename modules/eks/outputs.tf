output "cluster_id" {
  value = aws_eks_cluster.ekscluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.ekscluster.endpoint
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.ekscluster.vpc_config[0].cluster_security_group_id
}

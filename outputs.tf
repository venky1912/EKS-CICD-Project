output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "eks_security_group_id" {
  value = aws_security_group.eks_security_group.id
}
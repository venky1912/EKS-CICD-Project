provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
}


/*# Creating security group
module "security_groups" {
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  ssh_access   = var.ssh_access
  http_access  = var.http_access
  env = var.env
  type = var.type
}*/



# Create Security Group for the EKS  
resource "aws_security_group" "eks_security_group" {
  name   = "SH security group"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_access
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_access
  }

  ingress {
    description = "HTTPS port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.http_access
  }

  egress {
    description = "outbound access"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-EKS-security-group"
    Env  = var.env
    Type = var.type
  }
}


module "eks" {
  source = "./modules/eks"

  cluster_name            = var.cluster_name
  region                  = var.region
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.public_subnet_ids
  node_group_desired_size = var.node_group_desired_size
  node_group_min_size     = var.node_group_min_size
  node_group_max_size     = var.node_group_max_size
  node_instance_types     = var.node_instance_types
  eks_security_group_id   = aws_security_group.eks_security_group.id
  key_name                = var.key_name
}
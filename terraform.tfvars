cluster_name            = "devops-eks-cluster"
region                  = "eu-west-2"
node_group_desired_size = 1
node_group_min_size     = 1
node_group_max_size     = 1
vpc_cidr                = "10.0.0.0/16"
public_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs    = ["10.0.3.0/24", "10.0.4.0/24"]
node_instance_types     = ["t3.medium"]
env                     = "prod"
type                    = "production"
eks_version             = "1.30"
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "The AWS region to create the EKS cluster"
  type        = string
  default     = "eu-west-2"
}

variable "node_group_desired_size" {
  description = "The desired number of nodes"
  type        = number
  default     = 4
}

variable "node_group_min_size" {
  description = "The minimum number of nodes"
  type        = number
  default     = 3
}

variable "node_group_max_size" {
  description = "The maximum number of nodes"
  type        = number
  default     = 5
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "node_instance_types" {
  description = "The instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t3.micro"]
}

# SSH Access
variable "ssh_access" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# UI Access
variable "http_access" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# Environment
variable "env" {
  type    = string
  default = "Prod"
}

# Type
variable "type" {
  type    = string
  default = "Production"
}

# Key
variable "key_name" {
  default = "devopstest"
}

/*variable "vpc_id" {
  description = "vpc id "
  type        = string
}*/


variable "eks_version" {
  description = "The version of EKS to use for the cluster"
  type        = string
  default     = "1.30"
}
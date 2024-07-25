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
variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "node_instance_types" {
  description = "The instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t3.micro"]
}

# Key
variable "key_name" {
  default = "devopstest"
}
variable "eks_security_group_id" {
    description = "The aws eks securitygroup id"
    type = string
}

variable "eks_version" {
  description = "The version of EKS to use for the cluster"
  type        = string
  default     = "1.30"
}
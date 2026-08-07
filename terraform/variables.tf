variable "region" {

    description = "The AWS region to create resources in."
    type        = string
    default     = "ap-south-1"
}

variable "cluster_name" {
    description = "The name of the EKS cluster."
    type        = string
    default     = "eks-cicd"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC."
    type        = string
    default     = "10.0.0.0/16"
}

variable "azs" {
    description = "A list of availability zones in the region."
    type        = list(string)
    default     = ["ap-south-1a", "ap-south-1b"]
}

variable "private_subnet_cidrs" {
    description = "A list of CIDR blocks for the private subnets."
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
    description = "A list of CIDR blocks for the public subnets."
    type        = list(string)
    default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
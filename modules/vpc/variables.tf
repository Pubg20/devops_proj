variable "vpc_cidr" {
    description = "CIDR for VPC"
    type = string
}

variable "cluster_name" {
    description = "Name of EKS cluster"
    type = string
}

variable "private_subnet_cidrs" {
    description = "Name of private subnet"
    type = list(string)
}

variable "availability_zones" {
    description = "Name of az"
    type = list(string)
}

variable "public_subnet_cidrs" {
    description = "Name of public subnet"
    type = list(string)
}
terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
    
    backend "s3" {
        bucket         = "demo-terraform-eks-state-demo-bucket"
        key            = "terraform.tfstate"
        region         = "us-east-2"
        dynamodb_table = "terraform-eks-loacking"
        encrypt        = true
    }
}

provider "aws" {
    region = "us-east-2"
}

module "vpc" {
    source = "./vpc"

    vpc_cidr = var.vpc_cidr
    cluster_name = var.cluster_name
    private_subnet_cidrs = var.private_subnet_cidrs
    availability_zones = var.availability_zones
    public_subnet_cidrs = var.public_subnet_cidrs
  
}

 module "eks" {
    source = "./eks"

    cluster_name =  var.cluster_name
    cluster_version = var.cluster_version
    subnet_ids = module.vpc.private_subnet_ids
    node_groups = var.node_group
 }

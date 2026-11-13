variable "region" {
  description = "AWS region."
  type        = string
  default     = "ap-south-1" # Mumbai
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Resource name prefix."
  type        = string
  default     = "banking-dev"
}

variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
  default     = "banking-dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR."
  type        = string
  default     = "10.10.0.0/16"
}

variable "azs" {
  description = "Availability zones."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs."
  type        = list(string)
  default     = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs."
  type        = list(string)
  default     = ["10.10.128.0/20", "10.10.144.0/20", "10.10.160.0/20"]
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway (cheaper for dev)."
  type        = bool
  default     = true
}

variable "cluster_version" {
  description = "Kubernetes version."
  type        = string
  # 1.31 is in paid EXTENDED support (6x control-plane price) and ends Nov 2026.
  # 1.35 is in standard support until Mar 2027.
  default     = "1.35"
}

variable "node_instance_types" {
  description = "Managed node group instance types. m7i-flex.large (2 vCPU / 8 GB) is Free-plan eligible; 3 nodes (~21 GB allocatable, 29 pods/node) fit the demo stack."
  type        = list(string)
  default     = ["m7i-flex.large"]
}

variable "node_min_size" {
  type    = number
  default = 3
}

variable "node_max_size" {
  type    = number
  default = 4 # keep low so autoscaling can't burn credits
}

variable "node_desired_size" {
  type    = number
  default = 3
}

variable "ecr_repository_name" {
  description = "Single ECR repository holding all service images."
  type        = string
  default     = "banking-platform"
}

variable "domain_name" {
  description = "Apex domain you OWN (e.g. leenusfelex.in), hosted in Route 53. Leave empty to skip DNS and use the NLB hostname for the demo."
  type        = string
  default     = ""
}

variable "create_apex_record" {
  description = "Stage 2: create the apex ALIAS -> Traefik NLB. Set true only after Traefik is installed, then re-apply."
  type        = bool
  default     = false
}

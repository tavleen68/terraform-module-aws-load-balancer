variable "org_name" {
  description = "Organization name for the resource to provision"
  type        = string
  default     = ""
}
variable "region_name" {
  description = "Region for AWS to be used in naming convention"
  type        = string
  default     = ""
}
variable "environment" {
  description = "Environment details to be used in the naming convention"
  type        = string
  default     = ""
}
variable "project_name" {
  description = "Project name to be used in the naming convention"
  type        = string
  default     = ""
}
#variable "resource_desc" {
#  description = "Description of the resource"
#  type        = string
#  default     = ""
#}
variable "default_tags" {
  description = "Tags to be used with all the resources provisioned with this script"
  type        = map(string)
  default     = {}
}
variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
  default     = ""
}
variable "vpc_ssm_id" {
  description = "Parameter store name from where the VPC ID will be referenced."
  type        = string
  default     = ""
}
variable "load_balancer_subnet_ssm_id" {
  description = "Parameter store name from where the subnet IDs will be referenced for provisioning the LB."
  type        = string
  default     = ""
}
variable "lb_type" {
  description = "Type for loadbalancer - network/application"
  type        = string
  default     = "application"
}
variable "enable_deletion_protection" {
  description = "Enable/disable deletion protection"
  type        = bool
  default     = "false"
}
variable "lb_sg_ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
variable "lb_sg_egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "internal" {
  description = "if the load balancer should be private or public. Accepted values is true or false"
  type        = bool
  default     = true
}
variable "tg_port" {
  description = "target group port"
  type        = number
  default     = 443
}
variable "tg_protocol" {
  description = "target group protocol"
  type        = string
  default     = ""
}
variable "tg_target_type" {
  description = "target group target type. Accepted values like ip/instance/lambda/alb etc"
  type        = string
  default     = ""
}
variable "backend_ips" {
  description = "Define the IP addresses of your backend instances"
  type        = list(string)
  default     = []
}
variable "acm_cert_arn" {
  type        = string
  description = "arn for certificate"
  default     = ""
}
variable "listener_ssl_policy" {
  description = "ssl policy for listener ex - ELBSecurityPolicy-2016-08"
  type        = string
  default     = ""
}
variable "listener_port" {
  type        = number
  description = "listener port"
  default     = 443
}
variable "listener_protocol" {
  description = "listener protocol"
  type        = string
  default     = ""
}

variable "listener_action_type" {
  description = "listener action type - ex forward"
  type        = string
  default     = ""
}

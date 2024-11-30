## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.lb_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_cert_arn"></a> [acm\_cert\_arn](#input\_acm\_cert\_arn) | arn for certificate | `string` | `""` | no |
| <a name="input_backend_ips"></a> [backend\_ips](#input\_backend\_ips) | Define the IP addresses of your backend instances | `list(string)` | `[]` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Tags to be used with all the resources provisioned with this script | `map(string)` | `{}` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Enable/disable deletion protection | `bool` | `"false"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment details to be used in the naming convention | `string` | `""` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | if the load balancer should be private or public. Accepted values is true or false | `bool` | `true` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Name of the load balancer | `string` | `""` | no |
| <a name="input_lb_sg_egress_rules"></a> [lb\_sg\_egress\_rules](#input\_lb\_sg\_egress\_rules) | List of egress rules for the security group | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_lb_sg_ingress_rules"></a> [lb\_sg\_ingress\_rules](#input\_lb\_sg\_ingress\_rules) | List of ingress rules for the security group | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | Type for loadbalancer - network/application | `string` | `"application"` | no |
| <a name="input_listener_action_type"></a> [listener\_action\_type](#input\_listener\_action\_type) | listener action type - ex forward | `string` | `""` | no |
| <a name="input_listener_port"></a> [listener\_port](#input\_listener\_port) | listener port | `number` | `443` | no |
| <a name="input_listener_protocol"></a> [listener\_protocol](#input\_listener\_protocol) | listener protocol | `string` | `""` | no |
| <a name="input_listener_ssl_policy"></a> [listener\_ssl\_policy](#input\_listener\_ssl\_policy) | ssl policy for listener ex - ELBSecurityPolicy-2016-08 | `string` | `""` | no |
| <a name="input_load_balancer_subnet_ssm_id"></a> [load\_balancer\_subnet\_ssm\_id](#input\_load\_balancer\_subnet\_ssm\_id) | Parameter store name from where the subnet IDs will be referenced for provisioning the LB. | `string` | `""` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Organization name for the resource to provision | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to be used in the naming convention | `string` | `""` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region for AWS to be used in naming convention | `string` | `""` | no |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | target group port | `number` | `443` | no |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | target group protocol | `string` | `""` | no |
| <a name="input_tg_target_type"></a> [tg\_target\_type](#input\_tg\_target\_type) | target group target type. Accepted values like ip/instance/lambda/alb etc | `string` | `""` | no |
| <a name="input_vpc_ssm_id"></a> [vpc\_ssm\_id](#input\_vpc\_ssm\_id) | Parameter store name from where the VPC ID will be referenced. | `string` | `""` | no |

## Outputs

No outputs.

locals {
  name = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-${var.lb_name}"
}
locals {
  vpc_id        = nonsensitive(data.aws_ssm_parameter.vpc_id.value)
  lb_subnet_ids = nonsensitive(split(",", data.aws_ssm_parameter.lb_subnet_ids.value))
}

data "aws_ssm_parameter" "vpc_id" {
  name = var.vpc_ssm_id
}
data "aws_ssm_parameter" "lb_subnet_ids" {
  name = var.load_balancer_subnet_ssm_id
}

resource "aws_lb" "this" {
  name               = local.name
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.sg.id]
  subnets            = flatten([local.lb_subnet_ids]) #[local.lb_subnet_ids]
  #[for subnet in aws_subnet.public : subnet.id]
  enable_deletion_protection = var.enable_deletion_protection

  #  access_logs {
  #    bucket  = aws_s3_bucket.lb_logs.id
  #    prefix  = "test-lb"
  #    enabled = true
  #  }

  tags = merge({
    Name = local.name
    },
    var.default_tags
  )
}

resource "aws_lb_target_group" "this" {
  name        = "${local.name}-tg"
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = var.tg_target_type
  vpc_id      = local.vpc_id
}

locals {
  backend_ips = var.backend_ips
}

# Register the backend IPs with the IP target group
resource "aws_lb_target_group_attachment" "this" {
  count             = length(local.backend_ips)
  target_group_arn  = aws_lb_target_group.this.arn
  target_id         = local.backend_ips[count.index]
  availability_zone = "all"
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.listener_ssl_policy
  certificate_arn   = var.acm_cert_arn

  default_action {
    type             = var.listener_action_type
    target_group_arn = aws_lb_target_group.this.arn
  }
}

#resource "aws_lb_listener_rule" "default" {
#  listener_arn = aws_lb_listener.http_listener.arn
#
#  action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.default.arn
#  }
#
#  condition {
#    host_header {
#      values = ["*"]
#    }
#  }
#}
########################################################################################################################
## SG
########################################################################################################################
resource "aws_security_group" "sg" {
  name        = "${local.name}-sg"
  description = "security group for external ALB ${local.name}"
  vpc_id      = local.vpc_id

  tags = merge({ Name = "${local.name}-sg" }, var.default_tags)

  // Ingress rules (inbound traffic)
  dynamic "ingress" {
    for_each = var.lb_sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  // Egress rules (outbound traffic)
  dynamic "egress" {
    for_each = var.lb_sg_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

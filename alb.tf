  
resource "aws_lb" "default" {
  name               = "terraform-springboot-helloapp"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.default_lb.id}"]
  subnets            = ["subnet-12879975", "subnet-1b8d5e15"]

  enable_deletion_protection = true
  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "default" {
  load_balancer_arn = "${aws_lb.default.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.default.arn}"
  }
}

resource "aws_lb_target_group" "default" {
  name     = "terraform-springboot-helloapp-1"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "vpc-f8a48e82"
}
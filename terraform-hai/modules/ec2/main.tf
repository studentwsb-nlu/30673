// EC2 Auto Scaling Group Module
resource "aws_launch_template" "web" {
  name_prefix   = "web-lt-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    rds_endpoint = var.rds_endpoint
  }))

  vpc_security_group_ids = var.security_group_ids
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  target_group_arns    = [var.target_group_arn]
  health_check_type    = "EC2"
}

output "asg_name" {
  value = aws_autoscaling_group.web_asg.name
}

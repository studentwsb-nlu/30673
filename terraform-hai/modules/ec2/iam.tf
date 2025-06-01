resource "aws_iam_role" "ec2_role" {
  name = "ec2-ha-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-ha-profile"
  role = aws_iam_role.ec2_role.name
}

output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}

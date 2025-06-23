resource "aws_iam_role" "ec2_role" {
  name = "ec2-instance-role-1"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

provider "aws" {
  region = var.aws_region
}

module "ec2" {
  source                = "./modules/ec2"
  ami                   = var.ami
  instance_type         = var.instance_type
  key_name              = var.key_name
  tags                  = var.tags
  iam_instance_profile  = aws_iam_instance_profile.ec2_profile.name
} 

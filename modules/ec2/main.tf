resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  tags                   = var.tags
  iam_instance_profile   = var.iam_instance_profile
  monitoring             = true
  ebs_optimized          = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }
}
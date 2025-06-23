variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with the instance"
  type        = string
  default     = null
} 
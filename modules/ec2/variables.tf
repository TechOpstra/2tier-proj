variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 2
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

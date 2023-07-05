variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone_a" {
  description = "The first availability zone used by demo app."
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The second availability zone used by demo app."
  type        = string
  default     = "us-east-1b"
}

variable "ec2_instance_type" {
  description = "The instance type in 'type'.'size' notation of an aws ec2 server."
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "Image to be used for instanciating a aws ec2 server."
  type        = string
  default     = "ami-06b09bfacae1453cb"
}

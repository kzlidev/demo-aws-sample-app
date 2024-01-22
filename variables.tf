variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "EC2 instance name"
  default     = "likztestinstance"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  default     = "likztestbucket"
}
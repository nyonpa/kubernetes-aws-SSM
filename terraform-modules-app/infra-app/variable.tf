variable "env" {
    description = "this is the environment for my infra"
    type = string
  
}

variable "bucket_name" {
    description = "this is the bucket name for my instan"
    type=string
}

variable "instance_count" {
    description = "number of ec2 count"
    type = number
  
}

variable "instance_type" {
    description = "instance type"
    type = string

  
}
variable "ec2_ami_id" {
    description = "ami_id"
    type = string
  
}
variable "ec2_root_storage_size" {
    description = "default storage space"
    type = number
  
}

variable "hashkey" {
    description = "lockID"
    type = string
  
}
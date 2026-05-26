variable "ec2_instance_type" {
    description = "value"
    default =  "t2.micro"
    type =  string
  
}

variable "ec2_root_storage_size" {
    default = 15
    type = number
  
}
 variable "ec2_ami_id" {
    default = "ami-0c94855ba95c71c99"
    type = string
   
 }
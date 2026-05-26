output "ec2_public_ip" {
  value = {
    for key in keys(aws_instance.my_instance) :
    key => aws_instance.my_instance[key].public_ip
  }
}

output "ec2_public_dns" {
  value = {
    for key in keys(aws_instance.my_instance) :
    key => aws_instance.my_instance[key].public_dns
  }
}
output "ec2_public_ip" {
    # while using meta arguments
    #value = aws_instance.my_instance[*].public_ip
    value = [ for key in aws_instance.my_instance : key.public_ip]
  
}

output "ec2_public_dns"{
    #value = aws_instance.my_instance[*].public_dns
    value = [for key in aws_instance.my_instance : key.public_dns ]
}
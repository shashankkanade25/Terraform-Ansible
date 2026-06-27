output "ec2_public_key" {
    value = {
        for instance in aws_instance.my_instance : instance.tags.Name => instance.public_ip
    }
}


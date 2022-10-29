output "vpc_id" {
    value = aws_vpc.vpc_v3.id
}

output "subnet_id" {
    value = aws_subnet.public_subnet.*.id
}

output "private_subnet" {
value = aws_subnet.private_subnet.*.id
}
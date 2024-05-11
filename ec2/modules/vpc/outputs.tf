output "subnet_ids" {
  value = [
    for k, v in aws_subnet.this : v.id
  ]

}

output "id" {
  value = aws_vpc.this.id
}

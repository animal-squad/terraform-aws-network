output "vpc_id" {
  description = "vpc의 id"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "vpc의 arn"
  value       = aws_vpc.vpc.arn
}

output "internet_gateway_id" {
  description = "ig의 id"
  value       = aws_internet_gateway.ig.id
}

output "internet_gateway_arn" {
  description = "ig의 arn"
  value       = aws_internet_gateway.ig.arn
}

output "public_subnets" {
  description = "public subnet 정보를 가지고 있는 map. 생성시 사용한 key 값을 사용하여 접근"
  value       = aws_subnet.public
}

output "private_subnets" {
  description = "private subnet 정보를 가지고 있는 map. 생성시 사용한 key 값을 사용하여 접근"
  value       = aws_subnet.private
}

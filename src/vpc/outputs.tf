output "output_vpc_network_id" {
  value = yandex_vpc_network.develop.id
}

output "output_vpc_subnet_name" {
  value = yandex_vpc_subnet.develop.name
}

output "output_vpc_subnet_id" {
  value = yandex_vpc_subnet.develop.id
}

output "output_vpc_subnet_zone" {
  value = yandex_vpc_subnet.develop.zone
}

output "output_vpc_subnet_v4_cidr_blocks" {
  value = yandex_vpc_subnet.develop.v4_cidr_blocks
}
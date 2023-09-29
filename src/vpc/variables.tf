variable "vpc_network_name" {
  type        = string
  description = "yandex_vpc_network name"
}

variable "vpc_subnet_name" {
  type        = string
  description = "yandex_vpc_subnet name"
}

variable "vpc_subnet_zone" {
  type        = string
  description = "yandex_vpc_subnet zone"
}

variable "vpc_subnet_v4_cidr_blocks" {
  type        = string
  description = "yandex_vpc_subnet v4_cidr_blocks"
}
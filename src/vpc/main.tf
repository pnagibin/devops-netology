#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_network_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_subnet_name
  zone           = var.vpc_subnet_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["${var.vpc_subnet_v4_cidr_blocks}"]
}
output "vm_external_ip_address_netology-develop-platform-web" {
value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
description = "vm external ip"
}

output "vm_external_ip_address_netology-develop-platform-db" {
value = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
description = "vm external ip"
}
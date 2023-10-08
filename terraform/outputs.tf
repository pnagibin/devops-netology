output "output_clickhouse-01_public_ip" {
  value = yandex_compute_instance.clickhouse-01.network_interface[0].nat_ip_address
}
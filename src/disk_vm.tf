resource "yandex_compute_disk" "volumes" {
  count    = 3
  name     = "disk-name-${count.index +1}"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = 1
}

### Create resources
resource "yandex_compute_instance" "platform-3" {
  depends_on = [yandex_compute_instance.platform-2]
  for_each = { for server in var.storage : server.vm_name => server }
  name        = each.key
  platform_id = var.vm_web_platform_id
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    security_group_ids = ["${yandex_vpc_security_group.example.id}"]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file(var.ssh_pub_key_file)}"
  }
  dynamic "secondary_disk" {
    for_each = ["${yandex_compute_disk.volumes}"]
    content {
      disk_id = lookup(secondary_disk.value, "id", null)
    }
  }
}

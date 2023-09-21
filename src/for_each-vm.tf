### Var

servers = [
    {
      vm_name = "main"
      cpu   = 2
      ram   = 2
      core_fraction  = 20
    },
    {
      vm_name = "replica"
      cpu   = 2
      ram   = 1
      core_fraction  = 5
    }
]

ssh_pub_key_file = "/root/.ssh/id_ed25519.pub"

### Create resources
resource "yandex_compute_instance" "platform-2" {
  depends_on = [yandex_compute_instance.platform-1]
  for_each = { for server in var.servers : server.vm_name => server }
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

}
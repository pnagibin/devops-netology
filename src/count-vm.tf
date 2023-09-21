### Create resources
resource "yandex_compute_instance" "platform-1" {
  count = 2
  name        = "${var.vm_web_name}-${var.vm_web_env}-${var.vm_web_project}-${var.vm_web_role}-${count.index +1}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources["web"]["vm_cores"]
    memory        = var.vms_resources["web"]["vm_memory"]
    core_fraction = var.vms_resources["web"]["vm_core_fraction"]
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
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
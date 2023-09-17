resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = "${var.vm_web_name}-${var.vm_web_env}-${var.vm_web_project}-${var.vm_web_role}"
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
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "platform_db" {
  name        = "${var.vm_db_name}-${var.vm_db_env}-${var.vm_db_project}-${var.vm_db_role}"
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vms_resources["db"]["vm_cores"]
    memory        = var.vms_resources["db"]["vm_memory"]
    core_fraction = var.vms_resources["db"]["vm_core_fraction"]
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
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
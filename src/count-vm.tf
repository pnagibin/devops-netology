###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvJ6rpGbGn0YsoyIw4kpQFIxYn8QsBoa/6a4xdLptAQ root@DESKTOP-00G1TMP"
  description = "ssh-keygen -t ed25519"
}

###vm vars

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM family"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform_id"
}

variable "vms_resources" {
  description = "VMS resources"
  type        = map(map(string))
  default     = {
    web = {
      vm_cores = "2"
      vm_memory = "1"
	  vm_core_fraction = "5"
    }
    db = {
      vm_cores = "2"
      vm_memory = "2"
	  vm_core_fraction = "20"
    }
  }
}

variable "vm_web_name" {
  type        = string
  default     = "netology"
  description = "VM name"
}

variable "vm_web_env" {
  type        = string
  default     = "develop"
  description = "VM env"
}

variable "vm_web_project" {
  type        = string
  default     = "platform"
  description = "VM project"
}

variable "vm_web_role" {
  type        = string
  default     = "web"
  description = "VM role"
}
### Create resources

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  security_group_id = "${data.yandex_vpc_security_group.example_dynamic.id}"
  count = 2
  name        = "${var.vm_web_name}-${var.vm_web_env}-${var.vm_web_project}-${var.vm_web_role}${count.index +1}"
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
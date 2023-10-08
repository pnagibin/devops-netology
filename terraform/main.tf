#Создаем облачную сеть
resource "yandex_vpc_network" "network-01" {
  name = "network01"
}

#Ссоздаем подсеть
resource "yandex_vpc_subnet" "subnet-01" {
  name           = "subnet01-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-01.id
  v4_cidr_blocks = var.default_cidr
}

#Считываем данные об образе ОС
data "yandex_compute_image" "centos-7" {
  family = "centos-7"
}
#Создаю ВМ с именем netology-clickhouse-01
resource "yandex_compute_instance" "clickhouse-01" {
  name        = "netology-clickhouse-01"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-01.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.ssh_username}:${var.ssh_public_key}"
  }
#Предустанавливю python3 для последующей работы с ВМ через Ansible
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    type        = "ssh"
    host        = self.network_interface[0].nat_ip_address
    user        = "${var.ssh_username}"
    private_key = "${file("${var.ssh_private_key_path}")}"
  }
}
#Создаю inventory файл для Ansible
resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
     clickhouse-01_public_ip = yandex_compute_instance.clickhouse-01.network_interface[0].nat_ip_address
     ssh_username = var.ssh_username
    }
  )
  filename = "${path.module}/../playbook/inventory/prod.yaml"
}

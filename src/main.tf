module "vpc_develop" {
source = "./vpc"
vpc_network_name = "develop"
vpc_subnet_name = "develop-ru-central1-a"
vpc_subnet_zone = "ru-central1-a"
vpc_subnet_v4_cidr_blocks = "10.0.1.0/24"
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = yandex_vpc_network.develop.id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ yandex_vpc_subnet.develop.id ]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true

  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
#      ssh-keys = "ubuntu:${file("/root/.ssh/id_ed25519.pub")}"
  }

}

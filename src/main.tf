#moduls
module "vpc_develop" {
source = "./vpc"
vpc_network_name = var.vpc_network_name
vpc_subnet_name = var.vpc_subnet_name
vpc_subnet_zone = var.vpc_subnet_zone
vpc_subnet_v4_cidr_blocks = var.vpc_subnet_v4_cidr_blocks
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = "${module.vpc_develop.output_vpc_network_id}"
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = ["${module.vpc_develop.output_vpc_subnet_id}"]
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

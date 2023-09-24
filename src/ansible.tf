# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      webservers = yandex_compute_instance.platform-1
      databases = yandex_compute_instance.platform-2
      storage = yandex_compute_instance.platform-3
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}
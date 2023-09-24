###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

##ssh vars
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

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

variable "ssh_pub_key_file" {
  type        = string
  default     = "/root/.ssh/id_ed25519.pub"
  description = "SSH pub key file"
}

variable "servers" {
  description = "List of servers"
  type = list(object({
   vm_name = string
    cpu     = number
    ram     = number
    core_fraction    = number
  }))
  default = [
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
}

variable "storage" {
  description = "List of servers"
  type = list(object({
   vm_name = string
    cpu     = number
    ram     = number
    core_fraction    = number
  }))
  default = [
    {
       vm_name = "storage"
      cpu   = 2
      ram   = 2
      core_fraction  = 20
    }
  ]
}
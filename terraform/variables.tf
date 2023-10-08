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

###SSH vars
variable "ssh_public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvJ6rpGbGn0YsoyIw4kpQFIxYn8QsBoa/6a4xdLptAQ root@DESKTOP-00G1TMP"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "/root/.ssh/id_ed25519.pub"
  description = "Path to ypu ssh pub key"
}

variable "ssh_private_key_path" {
  type        = string
  default     = "/root/.ssh/id_ed25519"
  description = "Path to ypu ssh pub key"
}

variable ssh_username {
  type        = string
  default     = "centos"
}

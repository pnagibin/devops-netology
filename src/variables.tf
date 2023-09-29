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

variable "public_key" {
  type    = string
  default = ""
}

###common vars
variable "ssh_public_key" {
  type        = string
  default     = "/root/.ssh/id_ed25519.pub"
  description = "Path to ypu ssh pub key"
}

variable packages {
  type    = list
  default = ["nginx"]
}

variable username {
  type        = string
  default     = "ubuntu"
}

variable "vpc_network_name" {
  type        = string
  description = "yandex_vpc_network name"
}

variable "vpc_subnet_name" {
  type        = string
  description = "yandex_vpc_subnet name"
}

variable "vpc_subnet_zone" {
  type        = string
  description = "yandex_vpc_subnet zone"
}

variable "vpc_subnet_v4_cidr_blocks" {
  type        = string
  description = "yandex_vpc_subnet v4_cidr_blocks"
}
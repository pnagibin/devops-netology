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

variable "vm_db_name" {
  type        = string
  default     = "netology"
  description = "VM name"
}

variable "vm_db_env" {
  type        = string
  default     = "develop"
  description = "VM env"
}

variable "vm_db_project" {
  type        = string
  default     = "platform"
  description = "VM project"
}

variable "vm_db_role" {
  type        = string
  default     = "db"
  description = "VM role"
}
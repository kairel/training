variable "memory_mb" {
  type        = number
  description = "memory for vm"
}

variable "cpu" {
  type        = number
  description = "cpu for vm"
}

variable "guest_id" {
  type        = string
  description = "guest id"
}

variable "disk" {
  type = object({
    label     = string
    size      = number
  })
}
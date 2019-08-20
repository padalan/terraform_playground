variable "container_name" {
  description = "name of the container"
  default = "blog"
  }

variable "image_name" {
  description = "image for container"
  default = "ghost:latest"
}

variable "int_port" {
  description = "Internal port for container."
  default = "3268"
}
variable "ext_port" {
  description = "External port for container."
  default = "80"
}

#Define variables

variable "env" {
  description = "env: dev or prod"
}

variable "container_name" {
  type = "map"
  description = "Name of the container."
  default     = {
    dev = "ghost_dev_blog"
    prod = "ghost_prod_blog"
  }
}
variable "image_name" {
  type = "map"
  description = "Image for container."
  default     = {
    dev = "ghost:latest"
    prod = "ghost:alpine"
  }
}

variable "int_port" {
  description = "Internal port for container."
  default     = "2368"
}

variable "ext_port" {
  description = "External port for container."
  default     = {
    dev = "80"
    prod = "8080"
  }
}


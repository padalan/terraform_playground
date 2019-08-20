#Swarm services are a more production-ready way of running containers.
# Add null resource "sleep"

resource "docker_service" "ghost_service" {
  name  = "ghost_blog"
  # task_spec, container_spec, endpoint_spec can be defined only once in a service
  task_spec {
    container_spec {
      image = "${docker_image.ghost_image.name}"
      #Set up environment variables
      env   {
        database__client               = "mysql"
        database__connection__host     = "${var.mysql_network_alias}"
        database__connection__user     = "${var.ghost_db_username}"
        database__connection__password = "${var.mysql_root_password}"
        database__connection__database = "${var.ghost_db_name}"
              }
          }

    networks = [ "${docker_network.public_bridge_network.name}",
        "${docker_network.private_bridge_network.name}"]
    }
    
  endpoint_spec {
          ports {
          target_port = "2368"
          published_port = "${var.ext_port}"
        }
  }
}


resource "docker_service" "mysql-service" {
  name  = "${var.mysql_network_alias}"

  task_spec {
    container_spec {
      image = "${docker_image.mysql_image.name}"
      env {
    MYSQL_ROOT_PASSWORD="${var.mysql_root_password}"
  }
  mounts = [
  {
    source    = "${docker_volume.mysql_data_volume.name}"
    target = "/var/lib/mysql"
    type = "volume" 
    }
  ]
  }
  networks  = ["${docker_network.private_bridge_network.name}"]
  }
}


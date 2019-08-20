# Bridge only works for a individual docker hosts
# Overlay allows to go span accorss multiple docker hosts
resource "docker_network" "public_bridge_network" {
  name   = "public_network"
  driver = "overlay"
}

resource "docker_network" "private_bridge_network" {
  name     = "mysql_internal"
  driver   = "overlay"
  internal = true
}

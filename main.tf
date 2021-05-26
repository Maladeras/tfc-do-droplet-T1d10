provider "ovh" {
  endpoint = "ovh-eu"
}

data "digitalocean_ssh_keys" "keys" {
  sort {
    key       = "name"
    direction = "asc"
  }
}

resource "random_uuid" "server" {}

resource "digitalocean_droplet" "server" {
  image      = "debian-10-x64"
  name       = "${random_uuid.server.result}"
  region     = "ams3"
  size       = "s-1vcpu-1gb"
  ssh_keys   = data.digitalocean_ssh_keys.keys.ssh_keys.*.fingerprint
  connection {
    user          = "root"
    type          = "ssh"
    host          = "${digitalocean_droplet.server.ipv4_address}"
    private_key   = "${var.ssh_private_key}"
  }
  provisioner "remote-exec" {
    inline = "${var.post_install}"
  }
}

resource "ovh_domain_zone_record" "host" {
    zone = "${var.zone_dns}"
    subdomain = "${random_uuid.server.result}"
    fieldtype = "A"
    target = "${digitalocean_droplet.server.ipv4_address}"
}

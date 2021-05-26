output "uuid" {
    value = random_uuid.server.result
    description = "droplet's uuid"
}

output "zone_dns" {
    value =  "${var.zone_dns}"
    description = "droplet's zone"
}

output "public_ipv4" {
    value = digitalocean_droplet.server.ipv4_address
    description = "droplet's Ipv4 "
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
    ovh = {
      source = "ovh/ovh"
      version = "0.13.0"
    }
  }

  required_version = ">= 0.15.0"
}

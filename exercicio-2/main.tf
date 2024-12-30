terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
  }
}

provider "tls" {}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "null_resource" "criar_diretorio" {
  provisioner "local-exec" {
    command = "ssh -i ${tls_private_key.example.private_key_pem} ${var.user}@${var.host} 'mkdir -p ${var.diretorio}'"
  }
}

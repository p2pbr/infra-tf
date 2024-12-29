terraform {
  required_providers {
    ssh = {
      source  = "hashicorp/ssh"  # Provedor correto
      version = ">= 2.0.0"        # Especificando a versão mínima
    }
  }
}

provider "ssh" {
  host        = var.host
  user        = var.user
  private_key = file(var.private_key_path)
}

resource "null_resource" "criar_diretorio" {
  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${var.diretorio}"
    ]
  }
}

provider "ssh" {
  host = var.host
  user = var.user
  private_key = file(var.private_key_path)
}

resource "null_resource" "criar_diretorio" {
  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${var.diretorio}"
    ]
  }
}

provider "null" {}

resource "null_resource" "create_directory" {
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/jaime/meu_diretorio"  # Cria o diretório desejado no Ubuntu
    ]
    
    connection {
      type        = "ssh"
      host        = "192.168.1.8"  # Endereço IP da máquina Ubuntu
      user        = "jaime"        # Usuário no Ubuntu
      private_key = chomp(base64decode(var.ssh_private_key))  # Utiliza a chave privada passada via variável
    }
  }
}

# Variável que irá receber a chave privada do GitHub Secrets
variable "ssh_private_key" {
  type        = string
  description = "Chave privada SSH para conexão"
}

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
      private_key = file("C:/Users/p2p/.ssh/id_ed25519")  # Caminho da chave privada
    }
  }
}

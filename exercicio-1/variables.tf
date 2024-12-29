variable "host" {
  description = "Endereço IP ou nome do host da máquina remota"
  type        = string
}

variable "user" {
  description = "Usuário para autenticação SSH"
  type        = string
}

variable "private_key_path" {
  description = "Caminho para a chave privada SSH"
  type        = string
}

variable "diretorio" {
  description = "O diretório a ser criado na máquina remota"
  type        = string
  default     = "/home/${var.user}/novo_diretorio"
}

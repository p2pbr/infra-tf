Claro! Vamos focar inicialmente no seu exercício com o Terraform para criar um diretório no Lubuntu em outra máquina via SSH. Para isso, você vai precisar de uma estrutura básica do Terraform que utilize o provedor `ssh` para executar um comando remoto na máquina que criará o diretório.

Aqui está uma possível estrutura de projeto Terraform para essa tarefa:

### 1. Estrutura de Diretórios do Projeto

```plaintext
meu-projeto-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

### 2. Arquivo `main.tf`

Este é o arquivo principal do Terraform, onde você irá configurar o provedor e o recurso que executará o comando no servidor remoto via SSH.

```hcl
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
```

Aqui, estamos usando o provedor `ssh` do Terraform para se conectar via SSH à máquina remota e executar o comando `mkdir` para criar o diretório. A variável `${var.diretorio}` refere-se ao diretório a ser criado e pode ser definida no arquivo `terraform.tfvars`.

### 3. Arquivo `variables.tf`

Neste arquivo, você define as variáveis que serão usadas no projeto.

```hcl
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
```

### 4. Arquivo `terraform.tfvars`

Aqui você irá definir os valores específicos para as variáveis, como o IP da máquina, o usuário, o caminho da chave privada, etc.

```hcl
host              = "192.168.1.100"   # Substitua pelo IP da sua máquina remota
user              = "seu_usuario"      # Substitua pelo nome do usuário SSH
private_key_path  = "~/.ssh/id_rsa"    # Caminho para sua chave privada SSH
diretorio         = "/home/seu_usuario/novo_diretorio"  # Caminho do diretório a ser criado
```

### 5. Arquivo `outputs.tf`

Se você quiser exibir algum resultado após a execução, como o diretório criado, pode adicionar algo como:

```hcl
output "diretorio_criado" {
  description = "Diretório criado no servidor remoto"
  value       = var.diretorio
}
```

### 6. Passos para Executar

1. **Inicialize o Terraform**:

   Execute o comando abaixo para inicializar o Terraform e baixar os provedores necessários.

   ```bash
   terraform init
   ```

2. **Verifique o Plano**:

   Para ver o que o Terraform irá fazer (sem realmente aplicar as mudanças), execute:

   ```bash
   terraform plan
   ```

3. **Aplique o Plano**:

   Se tudo estiver certo, aplique o plano para criar o diretório na máquina remota:

   ```bash
   terraform apply
   ```

   O Terraform irá se conectar via SSH e executar o comando para criar o diretório no caminho especificado.

### Resumo

- Você está usando o provedor SSH do Terraform para se conectar a uma máquina remota e executar um comando (`mkdir`).
- As variáveis permitem maior flexibilidade na configuração do seu projeto.
- Não há necessidade de instalar o Terraform na máquina remota (apenas o Terraform localmente), já que o provedor `ssh` permite a execução de comandos via SSH.

Com essa estrutura básica, você pode expandir o projeto conforme necessário, e posteriormente adicionar a integração com GitHub Actions para automação.

Se precisar de mais ajuda para configurar a parte do GitHub Actions, só avisar!

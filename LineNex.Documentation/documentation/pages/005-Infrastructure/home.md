# LineNex Infrastructure

O projeto **LineNex Infrastructure** é responsável pelo provisionamento e gerenciamento da infraestrutura necessária para o ecossistema LineNex, utilizando **Terraform** para automação de deploy na plataforma **Microsoft Azure**.

Este projeto garante que a infraestrutura seja versionada, reproduzível e gerenciada como código (IaC), facilitando a escalabilidade e manutenção dos ambientes de desenvolvimento, homologação e produção.

---

## 🛠️ Tecnologias Utilizadas

- **Terraform** – Ferramenta de Infrastructure as Code para provisionamento e gestão da infraestrutura.
- **Microsoft Azure** – Plataforma de cloud onde a infraestrutura é criada e mantida.
- **Azure CLI** – Interface de linha de comando para interagir com recursos Azure durante o deploy.
- **Azure pipelines** (opcional) – Pipelines automatizados para CI/CD da infraestrutura.

---

## 🚀 Como executar localmente

### Pré-requisitos

- Terraform instalado (versão recomendada >= 1.0)
- Azure CLI instalado e autenticado (`az login`)

### Passos para provisionar a infraestrutura

1. Clone o repositório

2. Inicialize o Terraform:
    ```bash
    terraform init
    ```

3. Visualize o plano de execução:
    ```bash
    terraform plan
    ```

4. Aplique o plano para criar ou atualizar a infraestrutura:
    ```bash
    terraform apply
    ```

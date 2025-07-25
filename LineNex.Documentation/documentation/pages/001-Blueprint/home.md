# LineNex Blueprint

O **LineNex Blueprint** é um projeto de documentação oficial para o sistema **LineNex**, voltado ao gerenciamento e automação de operações em linhas de produção industriais.

Este projeto tem como objetivo centralizar e facilitar o acesso à documentação técnica e arquitetural de todos os módulos que compõem o ecossistema LineNex.

## 📦 Tecnologias Utilizadas

- **[Doclify](https://doclify.dev/)** – Ferramenta de documentação baseada em Markdown, ideal para criar e manter documentação técnica de forma rápida e organizada.
- **Docker** – Utilizado para containerização e distribuição local da documentação.
- **Azure Static Web App** – Hospedagem da documentação de forma segura, escalável e com deploy automatizado via GitHub.

## 🚀 Como executar localmente

Certifique-se de ter o **Docker** instalado e rodando.

```bash
docker compose up
```

Acesse no navegador: <http://localhost:3000>

## 🌐 Acesso à versão publicada

A documentação está hospedada via Azure Static Web App e pode ser acessada publicamente em:

```bash
https://agreeable-desert-0be8dcd0f.1.azurestaticapps.net
```

## 📁 Estrutura

- Documentation/ – Contém os arquivos Markdown da documentação e configuração da app
- Dockerfile – Configuração do ambiente Docker para build da documentação
- docker-compose.yml – Script para subir o ambiente local
- Configuration.AzureDevOps – Pipelines de CI/CD para deploy automático no Azure

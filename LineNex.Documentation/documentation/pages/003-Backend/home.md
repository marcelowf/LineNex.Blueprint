# LineNex Backend

O **LineNex Backend** é a espinha dorsal do sistema LineNex, responsável pelo gerenciamento e automação das operações em linhas de produção industriais.

Ele oferece uma API robusta e escalável construída sobre a plataforma **.NET**, com foco em performance, segurança e integração com ferramentas modernas de monitoramento e automação.

---

## 🛠️ Tecnologias Utilizadas

- **.NET (6/7)** – Framework para construção da API backend, utilizando C#.
- **Entity Framework Core** – ORM para manipulação do banco de dados com suporte a migrations.
- **Reqnroll** – Biblioteca para testes de integração e validação do sistema.
- **Grafana & Prometheus** – Ferramentas para monitoramento, visualização e alertas das métricas da aplicação.
- **Docker** – Containerização da aplicação para ambientes de desenvolvimento e produção.

---

## 🚀 Como executar localmente

### Pré-requisitos

- .NET SDK 6/7 instalado
- Docker instalado e rodando
- Banco de dados configurado (ex: SQL Server, PostgreSQL)

### Rodando com Docker Compose

```bash
docker compose up
```

Isso irá iniciar a aplicação e seus serviços dependentes.

### Executando manualmente

1. Clone o repositório
2. Configure as variáveis de ambiente
3. Rode as migrations do EF Core:

```bash
dotnet ef database update
```

4. Inicie a API:

```bash
dotnet run
```

### Testes

Para rodar os testes:

```bash
dotnet test
```

## 📁 Estrutura do Projeto

- LineNex.Api/ – Projeto principal da API REST
- LineNex.Application/ – Camada de aplicação (serviços, DTOs, regras de negócio)
- LineNex.Core/ – Interfaces, modelos básicos e entidades
- LineNex.Infrastructure/ – Implementação da persistência (EF Core, repositórios)
- LineNex.Service/ – Serviços de domínio e helpers
- LineNex.Specification/ – Validações e especificações do domínio
- LineNex.Tests/ – Projetos de testes unitários, integração e aceitação

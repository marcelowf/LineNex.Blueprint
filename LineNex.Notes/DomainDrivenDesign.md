# DDD

### Criar solução

```bash
dotnet new sln -n LineNex 
```

### Criar Projetos

```bash
dotnet new classlib -n LineNex.Api 
dotnet new classlib -n LineNex.Application 
dotnet new classlib -n LineNex.Core 
dotnet new classlib -n LineNex.Domain 
dotnet new classlib -n LineNex.Infrastructure 
dotnet new classlib -n LineNex.Service 
dotnet new classlib -n LineNex.Specification 
```

### Adicionar os Projetos à Solução

```bash
dotnet sln LineNex.sln add LineNex.Api/LineNex.Api.csproj 
dotnet sln LineNex.sln add LineNex.Application/LineNex.Application.csproj 
dotnet sln LineNex.sln add LineNex.Core/LineNex.Core.csproj 
dotnet sln LineNex.sln add LineNex.Domain/LineNex.Domain.csproj 
dotnet sln LineNex.sln add LineNex.Infrastructure/LineNex.Infrastructure.csproj 
dotnet sln LineNex.sln add LineNex.Service/LineNex.Service.csproj 
dotnet sln LineNex.sln add LineNex.Specification/LineNex.Specification.csproj
```

### Configurar Referências entre Projetos

```bash
dotnet add LineNex.Api/LineNex.Api.csproj reference LineNex.Infrastructure/LineNex.Infrastructure.csproj
dotnet add LineNex.Api/LineNex.Api.csproj reference LineNex.Application/LineNex.Application.csproj

dotnet add LineNex.Infrastructure/LineNex.Infrastructure.csproj reference LineNex.Application/LineNex.Application.csproj
dotnet add LineNex.Infrastructure/LineNex.Infrastructure.csproj reference LineNex.Service/LineNex.Service.csproj
dotnet add LineNex.Infrastructure/LineNex.Infrastructure.csproj reference LineNex.Domain/LineNex.Domain.csproj
dotnet add LineNex.Infrastructure/LineNex.Infrastructure.csproj reference LineNex.Core/LineNex.Core.csproj

dotnet add LineNex.Application/LineNex.Application.csproj reference LineNex.Service/LineNex.Service.csproj
dotnet add LineNex.Application/LineNex.Application.csproj reference LineNex.Domain/LineNex.Domain.csproj

dotnet add LineNex.Service/LineNex.Service.csproj reference LineNex.Domain/LineNex.Domain.csproj
dotnet add LineNex.Service/LineNex.Service.csproj reference LineNex.Core/LineNex.Core.csproj

dotnet add LineNex.Core/LineNex.Core.csproj reference LineNex.Domain/LineNex.Domain.csproj
dotnet add LineNex.Core/LineNex.Core.csproj reference LineNex.Specification/LineNex.Specification.csproj
```

### Aplicar Migrations localmente

```bash
dotnet ef migrations add FirstMigration --project .\LineNex.Infrastructure\ --startup-project .\LineNex.Api\

```

```bash
dotnet ef database update --project .\LineNex.Infrastructure\ --startup-project .\LineNex.Api\
```

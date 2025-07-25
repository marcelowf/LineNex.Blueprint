## Engenharia do Caos no Azure

Este documento apresenta um panorama sobre práticas de chaos engineering utilizando o **Azure Chaos Studio** e outras abordagens gerais.

---

## 1. Experimentação

* **Infraestrutura**: VMs, bancos de dados (DBs), Kubernetes.
* **Biblioteca Built-in Faults**: fornece cenários prontos para testar falhas como injeção de latência, exaustão de recursos e encerramento de serviços.
* **Testes Controlados**: definição de escopo, limites e rollback automático.
* **Observabilidade Integrada**: integração com **Azure Monitor** para coleta de métricas, logs e alertas.
* **Experimentos Agendados e Repetidos**: automação via scripts ou pipelines para executar cenários de caos periodicamente.
* **Ambiente Multiusuário**: diversos times podem criar, agendar e revisar experimentos sem conflito.

---

## 2. Cenário de Aplicação

Imagine uma empresa lançando uma promoção especial no site, atraindo muitos clientes simultâneos. Esse pico de acesso pode gerar instabilidades e downtime.

**Solução**: usar o Azure Chaos Studio para simular antecipadamente falhas sob alta carga e:

1. Identificar possíveis pontos de falha na aplicação.
2. Propor melhorias na arquitetura e configuração.
3. Garantir que o sistema resista antes de ir para **produção**.

---

## 3. Histórico

A engenharia do caos ganhou destaque com o **Chaos Monkey** da Netflix, que desligava instâncias aleatoriamente em produção para validar resiliência.

---

## 4. Exemplos de Falhas (Chaos Faults)

* **Injeção de Latência**: atrasa respostas de rede ou serviço.
* **Exaustão de Recursos**: limita CPU, memória ou disco.
* **Encerramento de Serviços**: finaliza instâncias de VM, pods ou containers.

---

## 5. Fases da Engenharia do Caos

1. **Hipótese**: formular suposições sobre comportamento sob falhas.
2. **Experimento**: executar o cenário de caos.
3. **Observar**: monitorar métricas e logs.
4. **Aprender**: analisar resultados e ajustar a aplicação.

---

## 6. Shift Left e Shift Right

**🔄 Shift Left** (testes precoces)

* Executar experimentos no

  * ambiente de desenvolvimento,
  * QA ou pré-produção.
* Objetivo: detectar fragilidades antes de chegar em produção.

**✅ Vantagens:**

* Menor risco para usuários finais.
* Correções mais rápidas e baratas.

---

**🔁 Shift Right** (testes em produção)

* Rodar experimentos diretamente em recursos ao vivo.
* Maior realismo dos testes, validando circuit breakers, failovers, etc.

**⚠️ Cuidados:**

* Escopo bem definido.
* Monitoramento e rollback automático.
* Aprovações rigorosas.

**🎯 Exemplos no Chaos Studio:**

* *Shift Left:* falha de rede em VM de desenvolvimento.
* *Shift Right:* falha de disco em instância de produção com alerta e rollback.

---

## 7. Recomendações Gerais

* Implementar sólido sistema de monitoramento e observabilidade (Azure Monitor).
* Automatizar experimentos de caos em pipelines CI/CD.
* Manter ambientes controlados para testes repetíveis.
* Fomentar cultura de aprendizado e adaptação com base nos resultados.
* Objetivos finais: maior resiliência, redução de downtime e melhor experiência do usuário.

---

## 8. Ferramentas e Alternativas

| Ferramenta             | Tipo              | Observações                                                    |
| ---------------------- | ----------------- | -------------------------------------------------------------- |
| **Azure Chaos Studio** | SaaS Nativo Azure | Totalmente integrado ao Azure Monitor e outros serviços Azure. |
| **Litmus**             | Open Source       | Flexível, comunidade ativa.                                    |
| **Gremlin**            | Enterprise Pago   | Suporte corporativo e features avançadas.                      |

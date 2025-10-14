# ADR 0001 — Escolha do Framework Backend

**Data:** 01/09/2025  
**Status:** Aprovado  

---

## Contexto

Precisamos definir o framework backend principal do sistema para garantir produtividade, manutenção e escalabilidade.  
A aplicação envolve autenticação, CRUDs, upload de arquivos, e integração com front-end em React.

Foram avaliadas as seguintes opções:

- **Laravel (PHP)**
- **Django (Python)**
- **Express (Node.js)**
- **Spring-boot (java)**

---

## Decisão

Optamos por utilizar **Laravel** como framework backend principal.

---

## Justificativas

- **Facilidade de uso:** Laravel oferece uma estrutura clara para rotas, controllers, models e migrations.  
- **ORM integrado:** O Eloquent simplifica o mapeamento objeto-relacional.  
- **Autenticação pronta:** Já vem com suporte para autenticação via token (oAuth/JWT).  
- **Comunidade forte:** Grande quantidade de pacotes, tutoriais e suporte.  
- **Integração com storage:** Gerenciamento de arquivos nativo e suporte para S3.  
- **Compatibilidade:** Comunicação fácil com front-end React via API RESTful.

---

## Alternativas Consideradas

| Alternativa | Prós | Contras |
|--------------|------|---------|
| **Django** | Estrutura sólida e segura; ORM maduro. | Linguagem diferente (Python), menos alinhada à stack do time. |
| **Express.js** | Leve e flexível; integra bem com JS/TS. | Exige mais configuração manual; falta de padrão rígido. |
| **Spring-boot** | Sólido, seguro e muito escalavel | Exige grande tempo de configuração, desnecessário para o próposito do projeto |

---

## Consequências

- **Positivas:**
  - Desenvolvimento rápido e padronizado.
  - Facilidade na criação de APIs REST.
  - Melhor suporte à autenticação e validações.

- **Negativas:**
  - A curva de aprendizado para devs novos em PHP pode ser mais alta.
  - Tempo de build e deploy pode ser ligeiramente maior comparado a soluções Node.js.

---

## Ações Futuras

- Documentar as principais práticas de uso do Laravel.  
- Criar guia interno de convenções (nomes de rotas, controllers e models).  
- Avaliar, futuramente, a adoção de microserviços se o projeto crescer.  

---

**Status atual:** **Aprovado e implementado.**
**Última atualização:** 01/09/2025

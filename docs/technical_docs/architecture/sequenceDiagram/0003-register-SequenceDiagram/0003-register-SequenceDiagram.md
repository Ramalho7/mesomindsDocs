---
title: Diagrama de Sequência - Registro
---

## Resumo

Fluxo de criação de nova conta: Usuário → Frontend (Web App) → Auth API → User DB → Session Store. Cria novo usuário, valida credenciais no banco e retorna token de sessão.

## Pré-condições

- Usuário não possui conta registrada.
- Frontend acessível via HTTPS.
- Banco de usuários e serviço de sessão operacionais.

## Atores / Componentes

- Usuário (actor)
- Web App (frontend)
- Auth API (backend responsável por autenticação)
- User DB (base de dados de usuários)
- Session Store (serviço que emite/guarda tokens ou session ids)

## Fluxo Principal (passo a passo)

1. Usuário abre a página de registro.
2. Usuário preenche formulário com dados (nome, email, senha, tipo de usuário).
3. Usuário clica em "Registrar".
4. Frontend faz `POST /api/register { nome, email, senha, tipo_usuario }` para Auth API.
5. Auth API consulta User DB para verificar se email já existe.
6. User DB retorna resultado da consulta.
7. Se email disponível:
   - Auth API faz hash da senha.
   - Auth API cria novo usuário no User DB.
   - User DB retorna usuário criado com ID.
   - Auth API cria sessão/token no Session Store.
   - Session Store retorna token/session id.
   - Auth API responde 201 Created com token e informações do usuário.
   - Frontend salva token e redireciona para dashboard.
8. Se email já existe:
   - Auth API responde 409 Conflict com erro.
   - Frontend mostra mensagem de erro "Email já cadastrado".

## Exemplos de payloads

- Requisição de Registro:

```json
{
  "nome": "João Silva",
  "email": "joao@example.com",
  "password": "plaintext",
  password_confirmation: plaintext,
  "tipo": "aluno"
}
```

- Resposta (sucesso):

```json
{
  "status": 201,
  "body": {
    "token": "eyJ...",
    "user": {
      "id": 456,
      "nome": "João Silva",
      "email": "joao@example.com",
      "tipo": "aluno"
    }
  }
}
```

- Resposta (erro - email existente):

```json
{
  "status": 409,
  "body": {
    "error": "Email já cadastrado"
  }
}
```

## Fluxos alternativos

- Registro com dados inválidos: Validação no frontend/backend retorna erro 400.
- Problema no Session Store: Auth API retorna erro 503 Service Unavailable.
- Timeout na conexão: Frontend mostra mensagem de erro de conexão.

## Pós-condições

- Em caso de sucesso: usuário criado, sessão ativa, token válido retornado.
- Em caso de falha: nenhum usuário criado, dados descartados.
- Usuário autenticado e redirecionado para área logada.

## Segurança / Boas práticas

- Sempre fazer hash da senha antes de armazenar no banco (usar bcrypt/argon2).
- Validar força da senha no frontend e backend.
- Implementar rate limiting para prevenir spam de registros.
- Tokens devem ter expiração adequada.
- Não expor informações sensíveis em respostas de erro.
- Validar todos os dados de entrada no backend.

## Observações de implementação

- Considerar validação de dados no frontend e backend.
- Logar tentativas de registro para auditoria.
- Para tipos de usuário diferentes, considerar fluxos específicos de onboarding.
- Session Store pode ser Redis, banco de dados, ou serviço JWT.

---

## Diagrama de sequência

![Diagrama de sequência - Registro](/img/sequenceDiagram/0003-register-SequenceDiagram/0003-register-SequenceDiagram.svg)
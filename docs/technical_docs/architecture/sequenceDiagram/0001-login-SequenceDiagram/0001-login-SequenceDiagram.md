---
title: Diagrama de Sequência - Login
---

## Resumo
Fluxo de autenticação simples: Usuário -> Frontend (Web App) -> Auth API -> User DB -> Session Store. Gera token/session e retorna informações mínimas do usuário.

## Pré-condições
- Usuário possui conta registrada.
- Frontend acessível via HTTPS.
- Banco de usuários e serviço de sessão operacionais.

## Diagrama

## Atores / Componentes
- Usuário (actor)
- Web App (frontend)
- Auth API (backend responsável por autenticação)
- User DB (base de dados de usuários)
- Session Store (serviço que emite/guarda tokens ou session ids)

## Fluxo Principal (passo a passo)
1. Usuário abre a página de login.
2. Usuário envia credenciais (email, senha) pelo formulário.
3. Frontend faz `POST /api/login { email, password }` para Auth API.
4. Auth API consulta User DB por email.
5. User DB retorna o registro do usuário (incluindo password_hash).
6. Auth API compara password recebida com password_hash.
7. Se senha válida:
   - Auth API cria sessão / emite Acess Token no Session Store.
   - Session Store retorna token / session id.
   - Auth API responde 200 OK com `{"token": "...", "user": { ... }}` (userInfo sem password_hash).
   - Frontend salva token e redireciona para dashboard.
8. Se senha inválida: Auth API responde 401 Unauthorized; Frontend mostra erro informando erro nas credenciais.

## Exemplos de payloads

- Requisição:
```json
{
  "email": "user@example.com",
  "password": "plaintext"
}
```

- Resposta (sucesso):
```json
{
  "status": 200,
  "body": {
    "token": "eyJ...",
    "user": {
      "id": 123,
      "email": "user@example.com",
      "roles": ["Admin"]
    }
  }
}
```

- Resposta (erro):
```json
{
  "status": 401,
  "body": {
    "error": "Credenciais inválidas"
  }
}
```

## Fluxos alternativos
- Reset de senha:
  - Fluxo separado via `/forgot-password`.

## Pós-condições
- Em caso de sucesso: sessão/token válido, usuário autenticado.
- Em caso de falha: nenhuma sessão criada; tentativa registrada.

## Segurança / Boas práticas
- Nunca retornar password_hash ao frontend.
- Preferir httpOnly, Secure cookies para tokens; se usar localStorage, valorar riscos XSS.
- Registrar tentativas de login para auditoria e detecção de fraude.
- Expirar tokens e usar refresh tokens.

## Observações de implementação
- Considerar refresh token + short-lived access token para segurança.
- Logar apenas metadados (user id, timestamp, IP, resultado) — evitar dados sensíveis.

---

## Diagrama de sequência

![Diagrama de sequência - Login](../../../../../out/docs/technical_docs/architecture/sequenceDiagram/0001-login-SequenceDiagram/0001-login-SequenceDiagram/0001-login-SequenceDiagram.svg)
---
title: Diagrama de Sequência - Registro
---

## Resumo
Fluxo de criação de nova conta: Usuário → Frontend (Web App) → Auth API → User DB → Email Service. Cria novo usuário, envia email de verificação e retorna confirmação.

## Pré-condições
- Usuário não possui conta registrada.
- Frontend acessível via HTTPS.
- Banco de usuários e serviço de email operacionais.
- Email do usuário é válido e acessível.

## Diagrama

## Atores / Componentes
- Usuário (actor)
- Web App (frontend)
- Auth API (backend responsável por autenticação)
- User DB (base de dados de usuários)
- Email Service (serviço de envio de emails)

## Fluxo Principal (passo a passo)
1. Usuário abre a página de registro.
2. Usuário preenche formulário com dados (nome, email, senha, tipo de usuário).
3. Usuário clica em "Registrar".
4. Frontend faz `POST /api/register { nome, email, senha, tipo_usuario }` para Auth API.
5. Auth API consulta User DB para verificar se email já existe.
6. User DB retorna resultado da consulta.
7. Se email disponível:
   - Auth API faz hash da senha.
   - Auth API cria novo usuário no User DB com status "pendente".
   - User DB retorna usuário criado com ID.
   - Auth API gera token de verificação.
   - Auth API envia email de verificação via Email Service.
   - Email Service confirma envio do email.
   - Auth API responde 201 Created com mensagem de sucesso.
   - Frontend mostra mensagem "Verifique seu email para ativar sua conta".

8. Se email já existe:
   - Auth API responde 409 Conflict com erro.
   - Frontend mostra mensagem de erro "Email já cadastrado".

## Exemplos de payloads

- Requisição de Registro:
```json
{
  "nome": "João Silva",
  "email": "joao@example.com",
  "senha": "plaintext",
  "tipo_usuario": "cliente"
}
```
- Resposta (sucesso):
``` json
{
  "status": 201,
  "body": {
    "mensagem": "Verifique seu email para ativar sua conta",
    "user_id": 456
  }
}
```

- Resposta (erro - email existente):
``` json
{
  "status": 409,
  "body": {
    "error": "Email já cadastrado"
  }
}
```

Paylod do Email de Verificação:
``` json
{
  "to": "joao@example.com",
  "subject": "Verifique sua conta",
  "body": "Clique no link para ativar sua conta: https://app.com/verify?token=abc123..."
}
```
## Fluxos alternativos
- Registro com verificação automática: Usuário é logado automaticamente após registro.
- Registro sem verificação por email: Conta é ativada imediatamente (menos seguro).
- Reenvio de email de verificação: Fluxo separado via /resend-verification.

## Pós-condições
- Em caso de sucesso: usuário criado com status pendente, email de verificação enviado.
- Em caso de falha: nenhum usuário criado, dados descartados.
- Usuário precisa verificar email para completar o registro.

## Segurança / Boas práticas
- Sempre fazer hash da senha antes de armazenar no banco (usar bcrypt/argon2).
- Validar força da senha no frontend e backend.
- Implementar rate limiting para prevenir spam de registros.
- Token de verificação deve expirar (ex: 24h).
- Não expor informações sensíveis em respostas de erro.

## Observações de implementação
- Considerar validação de dados no frontend e backend.
- Logar tentativas de registro para auditoria.
- Para tipos de usuário diferentes, considerar fluxos específicos de onboarding.
- Em ambientes de desenvolvimento, pode-se implementar "email preview" para testar sem enviar emails reais.

---

## Diagrama de sequência

![Diagrama de sequência - Registro](../../../../../out/docs/technical_docs/architecture/sequenceDiagram/0003-register-SequenceDiagram/0003-register-SequenceDiagram/0003-register-SequenceDiagram.svg)
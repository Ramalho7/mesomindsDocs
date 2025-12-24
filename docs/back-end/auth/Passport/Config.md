---
title: Configuração Laravel Passport 
---

# Autenticação OAuth2 com Laravel Passport

---

## Disclaimer

Devido a estarmos usando o Laravel Passport v13+ a configuração é um pouco diferente, sendo preciso cadastrar um provider próprio para o Passport, registrar-lo no `/boostrap/providers`, assim com também instanciar o `enablePasswordGrand()` antes do boot: 

```php
public function register(): void
{
    Passport::enablePasswordGrant();
}
```



---

## Visão Geral

Este projeto utiliza **Laravel Passport v13** para implementar autenticação OAuth2 completa, com suporte a:

- **Password Grant**: Autenticação direta com email e senha (first-party apps)
- **Refresh Tokens**: Renovação de tokens sem necessidade de re-login
- **Token Revocation**: Logout seguro com revogação de tokens

### Tecnologias Utilizadas

| Pacote | Versão | Descrição |
|--------|--------|-----------|
| Laravel Passport | ^13.0 | OAuth2 Server |
| nyholm/psr7 | ^1.8 | PSR-7 HTTP Messages |
| league/oauth2-server | ^9.0 | OAuth2 Server Core |

---

## Arquitetura

### Diagrama de Fluxo

![diagrama sequencia](/img/sequenceDiagram/0005-oauth2/0005-oauth2/0005-oauth2.svg)

---

## Configuração Inicial

### 1. Variáveis de Ambiente

Adicione as seguintes variáveis no arquivo `.env`:

```env
# Passport OAuth2 Client (Password Grant)
PASSPORT_PASSWORD_CLIENT_ID=seu-client-id-aqui
PASSPORT_PASSWORD_CLIENT_SECRET=seu-client-secret-aqui
```

### 2. Criar Cliente OAuth Password Grant

Execute o comando para criar um cliente OAuth com suporte a Password Grant:

```bash
php artisan passport:client --password
```

> **Importante**: Guarde o `client_id` e `client_secret` gerados. O secret só é exibido uma vez!

### 3. Verificar Clientes Existentes

Para listar os clientes OAuth configurados:

```bash
php artisan tinker --execute="echo json_encode(\DB::table('oauth_clients')->select('id', 'name', 'grant_types', 'revoked')->get(), JSON_PRETTY_PRINT);"
```

Saída esperada:
```json
[
    {
        "id": "019b5110-7c8c-70d3-a974-30f8d6f0c40a",
        "name": "Mesominds",
        "grant_types": "[\"password\",\"refresh_token\"]",
        "revoked": 0
    }
]
```

### 4. Gerar Chaves de Criptografia

```bash
php artisan passport:keys
```

Isso criará os arquivos `storage/oauth-private.key` e `storage/oauth-public.key`.

---

## Fluxo de Autenticação

### 1. Login (Password Grant)

O usuário envia email e senha, e recebe um `access_token` e `refresh_token`.

```http
POST /api/auth/login
Content-Type: application/json

{
    "email": "usuario@exemplo.com",
    "password": "senha123"
}
```

**Resposta de Sucesso (200):**
```json
{
    "success": true,
    "message": "Login realizado com sucesso",
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...",
    "refresh_token": "def50200a6f3b3c4d5e6f7g8h9i0j1k2l3m4n5o6p7...",
    "expires_in": 1296000,
    "token_type": "Bearer",
    "user": {
        "id": "019b1234-5678-90ab-cdef-1234567890ab",
        "name": "Nome do Usuário",
        "email": "usuario@exemplo.com",
        "status": "active",
        "role": "student"
    }
}
```

**Resposta de Erro (401):**
```json
{
    "success": false,
    "message": "Credenciais inválidas"
}
```

### 2. Usar Access Token

Para acessar rotas protegidas, envie o `access_token` no header `Authorization`:

```http
GET /api/me
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...
```

### 3. Renovar Token (Refresh)

Quando o `access_token` expira, use o `refresh_token` para obter um novo:

```http
POST /api/auth/refresh
Content-Type: application/json

{
    "refresh_token": "def50200a6f3b3c4d5e6f7g8h9i0j1k2l3m4n5o6p7..."
}
```

**Resposta de Sucesso (200):**
```json
{
    "success": true,
    "message": "Token renovado com sucesso",
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...",
    "refresh_token": "def50200x9y8z7w6v5u4t3s2r1q0p9o8n7m6l5k4...",
    "expires_in": 1296000,
    "token_type": "Bearer"
}
```

### 4. Logout

Revoga o access token e todos os refresh tokens associados:

```http
POST /api/auth/logout
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...
```

**Resposta de Sucesso (200):**
```json
{
    "success": true,
    "message": "Logout realizado com sucesso"
}
```

---

## Endpoints da API

### Rotas Públicas

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| POST | `/api/auth/register` | Registro de novos usuários |
| POST | `/api/auth/login` | Login e obtenção de tokens |
| POST | `/api/auth/refresh` | Renovação de tokens |
| POST | `/api/auth/forgot-password` | Solicitar reset de senha |
| POST | `/api/auth/reset-password` | Resetar senha |

### Rotas Protegidas

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| POST | `/api/auth/logout` | Logout e revogação de tokens |
| GET | `/api/auth/validate-token` | Validar token atual |
| GET | `/api/me` | Informações do usuário autenticado |

---

## Tokens

### Tipos de Token

| Token | Uso | Expiração |
|-------|-----|-----------|
| **Access Token** | Autenticação em rotas protegidas (Bearer) | 15 dias |
| **Refresh Token** | Renovar o access token quando expira | 30 dias |

### Configuração de Expiração

No arquivo `app/Providers/AuthServiceProvider.php`:

```php
use Laravel\Passport\Passport;

public function boot()
{
    Passport::tokensExpireIn(now()->addDays(15));
    Passport::refreshTokensExpireIn(now()->addDays(30));
    Passport::personalAccessTokensExpireIn(now()->addMonths(6));
}
```

### Diferença entre Access Token e Refresh Token

```
┌─────────────────────────────────────────────────────────────────┐
│                        ACCESS TOKEN                             │
├─────────────────────────────────────────────────────────────────┤
│ • Usado como Bearer nas requisições                             │
│ • Curta duração (15 dias)                                       │
│ • Enviado em TODAS as requisições autenticadas                  │
│ • NÃO use para renovar tokens                                   │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                       REFRESH TOKEN                             │
├─────────────────────────────────────────────────────────────────┤
│ • Usado APENAS para renovar o access token                      │
│ • Longa duração (30 dias)                                       │
│ • Enviado SOMENTE no endpoint /api/auth/refresh                 │
│ • NÃO use como Bearer                                           │
└─────────────────────────────────────────────────────────────────┘
```

---

## Configuração de Clientes OAuth

### Tipos de Clientes

| Tipo | Grant Types | Uso |
|------|-------------|-----|
| Password | `password`, `refresh_token` | First-party apps (seu frontend) |
| Client Credentials | `client_credentials` | Machine-to-machine (M2M) |
| Personal Access | `personal_access` | Tokens manuais |

### Criar Clientes

```bash
# Cliente Password Grant (para login com email/senha)
php artisan passport:client --password

# Cliente para Machine-to-Machine
php artisan passport:client --client

# Cliente para Personal Access Tokens
php artisan passport:client --personal
```

---

## Policies e Autorizações

### SystemUserPolicy

O arquivo `app/Policies/SystemUserPolicy.php` define as permissões para operações em usuários:

```php
class SystemUserPolicy
{
    // Visualizar lista de usuários (apenas admin)
    public function viewAny(SystemUser $user): bool;
    
    // Visualizar usuário específico (admin ou próprio usuário)
    public function view(SystemUser $user, SystemUser $systemUser): bool;
    
    // Criar usuário por admin
    public function createByAdmin(SystemUser $actor, SystemUserRoleEnum $targetRole): bool;
    
    // Auto-registro (student, teacher)
    public function selfRegister(SystemUserRoleEnum $targetRole): bool;
    
    // Atualizar usuário
    public function update(SystemUser $user, SystemUser $systemUser): bool;
    
    // Deletar usuário
    public function delete(SystemUser $user, SystemUser $systemUser): bool;
}
```

### Usar Policies nos Controllers

```php
// Verificar se pode criar usuário
Gate::authorize('createByAdmin', [SystemUser::class, $targetRole]);

// Verificar se pode visualizar
$this->authorize('view', $systemUser);

// Verificar permissão inline
if ($user->can('update', $systemUser)) {
    // ...
}
```

---

## Troubleshooting

### Erro: "The authorization grant type is not supported"

**Causa**: O Password Grant não está habilitado.

**Solução**:
1. Verifique se o cliente OAuth tem `grant_types` correto:
```bash
php artisan tinker --execute="echo \DB::table('oauth_clients')->whereJsonContains('grant_types', 'password')->first()?->id;"
```

2. Crie um novo cliente password se necessário:
```bash
php artisan passport:client --password
```

3. Atualize as variáveis no `.env`.

4. Limpe o cache:
```bash
php artisan config:clear
php artisan cache:clear
```

### Erro: "Client authentication failed"

**Causa**: `client_id` ou `client_secret` incorretos.

**Solução**:
1. Verifique se as variáveis `PASSPORT_PASSWORD_CLIENT_ID` e `PASSPORT_PASSWORD_CLIENT_SECRET` estão corretas no `.env`.
2. O `client_secret` pode estar hasheado no banco. Use o secret original gerado.

### Erro: "Token inválido ou expirado"

**Causa**: O access token expirou ou foi revogado.

**Solução**:
1. Use o refresh token para obter um novo access token.
2. Se o refresh token também expirou, o usuário precisa fazer login novamente.

### Erro: "Too few arguments to function Policy"

**Causa**: Argumentos faltando ao chamar policies.

**Solução**:
```php
// ❌ Incorreto
$user->can('createByAdmin', SystemUser::class);

// ✅ Correto
$user->can('createByAdmin', [SystemUser::class, $targetRole]);
```

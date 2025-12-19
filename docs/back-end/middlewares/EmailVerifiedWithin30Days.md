---
title: Email Verified Within 30 Days
sidebar_position: 2
---

# Email Verified Within 30 Days

Este middleware implementa uma regra de segurança que restringe o acesso a determinadas rotas e funcionalidades apenas a usuários que verificaram recentemente a posse do e-mail.

O objetivo é reduzir riscos associados a:

* contas comprometidas;
* reutilização de e-mails antigos;
* usuários que perderam acesso ao endereço de e-mail originalmente cadastrado.

---

## Quando utilizar este middleware

Utilize este middleware em rotas que:

* alteram dados sensíveis do usuário;
* concedem permissões adicionais;
* envolvem informações pessoais, acadêmicas ou financeiras;
* representam impacto relevante no estado do sistema.

### Exemplos comuns

* alteração de e-mail ou senha;
* ações administrativas do próprio usuário;
* operações críticas de conta.

---

## Quando **não** utilizar

Não utilize este middleware em:

* rotas públicas;
* autenticação e login;
* verificação inicial de e-mail;
* ações de baixo impacto (ex: leitura simples de dados).

---

## Pré-requisitos técnicos

Este middleware assume que:

* o usuário está autenticado (`auth` middleware);
* o model de usuário implementa `MustVerifyEmail`;
* o campo `email_verified_at` possui cast para `datetime`.

Exemplo de cast esperado no model:

```php
protected $casts = [
    'email_verified_at' => 'datetime',
];
```

---

## Fluxo de decisão

O middleware segue o fluxo abaixo:

1. Usuário não autenticado -> acesso negado;
2. Usuário autenticado, mas e-mail não verificado -> acesso negado;
3. E-mail verificado há mais de 30 dias -> acesso negado;
4. E-mail verificado dentro do período permitido -> requisição continua.

---

## Código do middleware

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class EmailVerifiedWithin30Days
{
    public function handle(Request $request, Closure $next)
    {
        return $this->verifyEmailWithinDays($request, $next, 30);
    }

    protected function verifyEmailWithinDays(Request $request, Closure $next, int $days)
    {
        $user = $request->user();

        if (! $user || ! $user->hasVerifiedEmail()) {
            return response()->json(['message' => 'E-mail não verificado.'], 403);
        }


        if ($user->email_verified_at->diffInDays(date: now()) > $days) {
            return response()->json([
                'message' => "Seu e-mail não foi verificado nos últimos {$days} dias.",
            ], 403);
        }

        return $next($request);
    }
}
```

---

## Respostas HTTP

Este middleware pode retornar as seguintes respostas:

| Código | Situação                                      |
| ------ | --------------------------------------------- |
| 401    | Usuário não autenticado                       |
| 403    | E-mail não verificado ou verificação expirada |

---

## Uso

O middleware deve ser aplicado **após** o middleware de autenticação, pois depende do usuário autenticado.

Exemplo de uso em rota:

```php
Route::middleware(['auth', 'email.verified.recent'])
    ->post('/account/change-email', [AccountController::class, 'changeEmail']);
```

---

## Decisões de design

* O período de **30 dias** foi escolhido como equilíbrio entre segurança e usabilidade;
* A regra foi implementada como **middleware** para atuar na borda HTTP da aplicação;
* A verificação ocorre antes da execução do controller para evitar lógica duplicada.

---

## Impacto no sistema

* Aumenta a segurança de operações sensíveis;
* Introduz a necessidade de revalidação periódica de e-mail;
* Pode exigir nova verificação para usuários antigos;
* Define um contrato claro entre back-end e front-end sobre falhas de acesso.
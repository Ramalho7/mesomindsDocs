---
title: Middleware
sidebar_position: 1
---

# Middleware

Este documento define o padrão do projeto para criação, registro e uso de middlewares.

Ele deve ser utilizado como referência obrigatória sempre que um novo middleware for adicionado ao sistema, garantindo consistência arquitetural, previsibilidade e facilidade de manutenção.

---

## Objetivo dos middlewares no sistema

No contexto deste projeto, middlewares são responsáveis por:

* validar pré-condições de requisições HTTP;
* aplicar regras transversais (cross-cutting concerns);
* proteger rotas antes da execução de controllers;
* padronizar comportamentos de segurança e acesso.

Middlewares não devem conter:

* regras de negócio específicas de domínio;
* lógica dependente de entidades específicas;
* efeitos colaterais persistentes (ex: escrita em banco).

---

## Premissas obrigatórias

1. Todo novo middleware deve ser registrado em `/bootstrap/app.php`.
2. Todo middleware deve possuir um alias.
3. Middlewares devem ser reutilizáveis e não acoplados a uma única rota.
4. Middlewares não devem assumir que estão sendo executados em rotas web.

O descumprimento dessas premissas exige justificativa explícita.

---

## Registro de middlewares

O registro de middlewares é realizado no arquivo `/bootstrap/app.php` por meio da configuração de aliases.

### Exemplo de registro

```php
<?php

use App\Http\Middleware\EmailVerifiedWithin30Days;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        api: __DIR__.'/../routes/api.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->group('api', [
            \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ]);

        $middleware->alias([
            'auth' => \App\Http\Middleware\Authenticate::class,
            'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
            'email.verified.30days' => EmailVerifiedWithin30Days::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        $exceptions->renderable(function (AuthenticationException $e, $request) {
            if ($request->is('api/*') || $request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Não autenticado. Token inválido ou ausente.',
                ], 401);
            }
        });
    })
    ->create();
```

---

## Convenções de alias

Para manter previsibilidade e legibilidade:

* Use **kebab-case** ou **dot notation**;
* O alias deve expressar claramente a responsabilidade do middleware;
* Evite nomes genéricos como `check`, `verify`, `ensure` sem contexto.

### Exemplos válidos

* `auth`
* `email.verified.30days`
* `rate.limit`

### Exemplos inválidos

* `checkEmail`
* `verifyUser`
* `middleware1`

---

## Passo a passo para adicionar um novo middleware

### 1. Criar o middleware

Crie o middleware utilizando o Artisan:

```bash
php artisan make:middleware EmailVerifiedWithin30Days
```

Ou, se estiver utilizando Sail:

```bash
./vendor/bin/sail artisan make:middleware EmailVerifiedWithin30Days
```

---

### 2. Implementar a lógica

O middleware deve:

* receber `Request` e `Closure $next`;
* retornar sempre uma `Response` ou `$next($request)`;
* evitar lógica duplicada com controllers ou services.

---

### 3. Registrar o alias

Adicione o middleware no bloco de aliases em `/bootstrap/app.php`.

```php
$middleware->alias([
    'email.verified.30days' => EmailVerifiedWithin30Days::class,
]);
```

---

### 4. Aplicar o middleware em rotas

Exemplo de uso:

```php
Route::middleware(['auth', 'email.verified.30days'])
    ->post('/account/change-email', [AccountController::class, 'changeEmail']);
```

---

## Checklist antes do merge

Antes de submeter um PR com um novo middleware, verifique:

* [ ] O middleware possui documentação?
* [ ] O alias segue o padrão do projeto?
* [ ] O middleware retorna códigos HTTP semânticos?
* [ ] A regra realmente pertence a middleware e não a Policy ou Service?

---

## Índice de middlewares disponíveis

Utilize esta seção como fonte única de verdade para middlewares existentes no sistema.

* [Email Verified Within 30 Days](/docs/back-end/middlewares/EmailVerifiedWithin30Days.md)

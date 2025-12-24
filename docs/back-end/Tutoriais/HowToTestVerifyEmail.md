---
title: Como testar verificação de e-mail?
---

## Visão Geral

Esta documentação descreve como implementar a verificação de e-mail em uma aplicação Laravel (back-end) com front-end separado (React/Vue/Angular), onde o link de verificação é enviado para o front-end, mas a validação ocorre no back-end.

## Objetivo

- Enviar e-mail de verificação para o usuário
- Link redireciona para o front-end
- Front-end captura os parâmetros e envia para o back-end
- Back-end valida a assinatura e marca o e-mail como verificado

## Pré-requisitos

1. `.env` atualizado

```env
MAIL_MAILER=smtp
MAIL_HOST=smtp
MAIL_PORT=46522
MAIL_USERNAME=123@example.com
MAIL_PASSWORD=password
MAIL_ENCRYPTION=ssl
MAIL_FROM_ADDRESS=123@example.com
MAIL_FROM_NAME="Mesominds"

FRONTEND_URL=http://localhost:3000
```

2. `config/App.php`

```php
<?php
return [
    'frontend_url' => env('FRONTEND_URL', 'http://localhost'),
]
```  

3. `System_user` model possui a função: `sendEmailVerificationNotification()` e as traits `use HasApiTokens, Notifiable;`

---

## Como testar no postman (sem front-end)

Primeiro, é preciso que o arquivo: `Notifications/CustomVerifyEmail.php`, possua na função: `verificationUrl()` um log `\Log::info('Backend verification URL: '.$temporarySignedRoute);`

Para testar usando o postman, basta acessar o arquivo: `storage/logs/laravel.log` ou uasr o comando: `tail -f storage/logs/laravel.log`, será possível ver uma URL como essa: 

```bash
[2025-12-24 00:09:53] local.INFO: Backend verification URL: http://localhost:8000/api/auth/email/verify/01kcfr2vb4qb8b4kjtfxb3pv7b/d463f69252fa186b5c4869bbd2874d024e6f701f?expires=1766538593&signature=7c7ef2d964dcfc1eede6f3d32b84db099895ca4ba535916c270c9fa8346a83bf 
```

Essa URL pode ser usada para testes no postman e essa também é a URL que o front-end deve constuir para verificar o e-mail no front-end.

No postman, é preciso enviar o no body o email que do usuário a ser verificado.

### 2. Enviar e-mail de teste

Acessar o atisan tinker:

```bash
php artisan tinker
```

Acessar um usuário com e-mail válido(alterado) para verificação

```bash
$user = App\Models\SystemUser::find('01kcfr2vb4qb8b4kjtfxb3pv7b');
```

Isso é retonará o usuário, agora enviar o e-mail pela função que está no model de `system_user`, ainda dentro do tinker:

```bash
$user->sendEmailVerificationNotification();
```

Isso enviará o e-mail e agora é possível ter acesso a URL já pronta no `laravel.log`, basta copiar e usar no postman.

---
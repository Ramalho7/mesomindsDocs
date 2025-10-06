# Autenticação com `Auth` no Laravel

O Laravel fornece o **facade `Auth`** para gerenciar a autenticação de usuários, sessões e permissões de forma simples e segura.

---

## Recuperando o usuário autenticado

Para acessar o usuário atualmente logado:

```php
use Illuminate\Support\Facades\Auth;

// Recupera o usuário autenticado
$user = Auth::user();

// Exemplo: atribuindo o ID do último editor
$validated['ultimo_editor'] = $user->id;

## Verificando se o usuário está autenticado
Antes de acessar dados do usuário, é recomendado verificar se há um login ativo:

```php
if (Auth::check()) {
    // Usuário autenticado
    $userId = Auth::id();
} else {
    // Nenhum usuário autenticado
}
```


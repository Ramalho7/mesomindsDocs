---
title: Policies
sidebar_position: 3
-------------------

# Policies do Sistema

Este documento define as regras de autorização (Policies) do sistema e como elas se relacionam com Roles.

As policies são responsáveis por decidir se um usuário pode ou não executar uma ação específica, dado um contexto.

## OBS.: 

Algumas regras de create/update, etc, não são feitas diretamente nas `policies` mas sim por meio de `pipelines`.

// isso deve mudar e passar a logica para uma policie, como devido

---

## Princípios das Policies

1. Policies sempre representam uma ação explícita (create, update, delete, changeStatus);
2. Policies não devem conter regras de infraestrutura (HTTP, Request, Response);
3. Policies podem usar roles, mas não devem se limitar apenas a elas;
4. Toda regra sensível de acesso deve estar documentada aqui.

---

## Regras globais de autorização

As regras abaixo são válidas para todo o sistema:

* Apenas admin pode criar usuários com role: `admin`, `moderator` ou `operator`;
* Apenas admin pode realizar deleções (soft delete);
* Apenas admin e moderator podem alterar o status de conteúdos;

---

### Deletar usuários (soft delete)

```php
public function delete(User $actor, User $target): bool
{
    return $actor->role === 'admin';
}
```

**Regras aplicadas**:

* Apenas admin pode deletar usuários;
* Deleções são sempre do tipo *soft delete*.

---

## Policy: ContentPolicy

Responsável por autorizar ações relacionadas a conteúdos educacionais.

---

### Alterar status de conteúdo

```php
public function changeStatus(User $actor, Content $content): bool
{
    return in_array($actor->role, ['admin', 'moderator'], true);
}
```

**Regras aplicadas**:

* Admin e Moderator podem alterar status (publicado, arquivado, etc);
* Teacher e Student não possuem essa permissão.

---

## Uso das policies no back-end

As policies devem ser usadas via Gate ou authorize, nunca com condicionais espalhadas.

### Exemplo em Controller

```php
public function destroy(User $user)
{
    $this->authorize('delete', $user);

    $user->delete();
}
```

---

## O que NÃO fazer

* Não verificar role diretamente em controller para regras sensíveis;
* Não duplicar regras de autorização em múltiplos lugares;
* Não usar policies para regras de negócio;
* Não misturar policy com validação de dados.

---

## Quando criar uma nova Policy

Crie uma nova policy quando:

* uma nova entidade possuir regras próprias de acesso;
* uma ação crítica exigir autorização explícita;
* a regra depender de mais do que apenas a role.

Se a regra for apenas "quem pode acessar uma área", considere middleware.

---

## Relação entre Roles e Policies

| Conceito   | Responsabilidade                 |
| ---------- | -------------------------------- |
| Role       | Identidade e contexto do usuário |
| Policy     | Autorização de ações específicas |
| Middleware | Barreiras genéricas de acesso    |

---
title: Roles
sidebar_position: 2
---

# Roles do Sistema

Este documento descreve exclusivamente as roles existentes no sistema, suas responsabilidades e limites.

Neste projeto, role é um atributo do usuário, e cada usuário possui exatamente uma única role.

Regras mais granulares de acesso são tratadas separadamente no documento de [Policies](/docs/back-end/system_users/policies.md).

---

## Definição de Role 

Uma role representa o perfil principal e estável de um usuário dentro da aplicação.

Características importantes:

* Role é um atributo (`role`) do usuário;
* Um usuário não pode possuir mais de uma role;
* Roles não são combináveis;
* Roles definem contexto geral, não permissões finas.

Exemplo conceitual:

```text
system_user -> role = 'admin'
system_user -> role = 'teacher'
system_user -> role = 'student'
system_user -> role = 'moderator'
system_user -> role = 'operator'
```

---

## Princípios adotados

1. **Exclusividade**: cada usuário possui uma única role;
2. **Estabilidade**: roles mudam raramente;
3. **Clareza semântica**: roles representam "quem o usuário é" no sistema;
4. **Separação de responsabilidades**: roles não substituem permissions.

---

## Roles disponíveis

### 1. Admin

**Descrição**
Usuário com responsabilidade administrativa sobre a plataforma.

---

### 2. Moderator

**Descrição**
Usuário com responsabilidade administrativa menor do que admin sobre a plataforma.

---

### 2. Operator

**Descrição**
Usuário com responsabilidade administrativas limitadas.

---

### 3. Teacher

**Descrição**
Usuário responsável por criação e gestão de conteúdos educacionais, dentro de turmas.

---

### 4. Student

**Descrição**
Usuário final consumidor do conteúdo educacional.

---

## Uso das roles no sistema

Roles devem ser utilizadas para:

* definir contexto geral do usuário;
* direcionar fluxos principais da aplicação;
* aplicar regras amplas de acesso (ex: áreas administrativas).

Roles **não devem** ser utilizadas para decisões finas.

---

## Uso no back-end

No back-end, roles podem ser verificadas em:

* middlewares genéricos;
* policies (como pré-condição de alto nível);
* serviços de orquestração de fluxo.

Exemplo:

```php
if ($user->role !== 'admin') {
    abort(403);
}
```

---

## Uso no front-end

No front-end, a role pode ser utilizada apenas para:

* controle de layout e navegação;
* exibição condicional de menus;
* adaptação de UX por perfil.

### Modo de uso

O front-end deve usar o endpoint `GET /auth/me` ([/me](/docs/back-end/auth/me.md)) que retornará todas as limitações do usuário logado no momento para que possa alterar o front-end.

---

## O que NÃO fazer

* Não permitir múltiplas roles por usuário;
* Não usar role como substituto de permissions;
* Não adicionar lógica de negócio baseada apenas em role;
* Não criar novas roles sem documentação.

---

## Quando criar uma nova role

Uma nova role só deve ser criada se:

* o perfil do usuário é estruturalmente diferente;
* o comportamento global do sistema muda significativamente;
* permissions não resolvem o problema sozinhas.

Se a diferença for apenas "o que pode ou não fazer", não é uma role, é uma permission.

---
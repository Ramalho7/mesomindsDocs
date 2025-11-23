---
title: Caso de Uso - Gerenciar Conteúdos
---

## Atores Principais

- **Admin**: Acesso completo
- **Moderador**: Acesso parcial
- **Operador**: Acesso limitado

## Descrição

Permite que atores autorizados criem, editem, removam e visualizem conteúdos na plataforma. O nível de acesso varia conforme o papel do usuário.

## Pré-condições

- Ator está autenticado na plataforma
- Ator possui permissões necessárias para a ação solicitada

## Fluxo Principal

1. Ator acessa o painel de gerenciamento de conteúdos
2. Sistema exibe lista de conteúdos existentes
3. Ator seleciona uma ação:
   - **Criar novo conteúdo** -> Sistema abre formulário
   - **Editar conteúdo** -> Sistema abre editor
   - **Remover conteúdo** -> Sistema solicita confirmação
   - **Visualizar detalhes** -> Sistema exibe informações

## Permissões por Ator

| Ação | Admin | Moderador | Operador |
|------|:-----:|:---------:|:--------:|
| Criar conteúdo | V | V | V |
| Editar conteúdo | V | V | V |
| Remover conteúdo | V | X | X |
| Visualizar conteúdo | V | V | V |
| Alterar status | V | V | X |


## Fluxos Alternativos

### Fluxo A1: Conteúdo não encontrado
- Se o conteúdo não existe, sistema exibe mensagem de erro
- Ator retorna à lista de conteúdos

### Fluxo A2: Dados inválidos
- Se o ator insere dados inválidos no formulário
- Sistema destaca campos com erro
- Sistema solicita correção dos dados

### Fluxo A3: Acesso negado
- Se o ator tenta realizar ação sem permissão
- Sistema exibe mensagem "Acesso negado"
- Ator retorna à tela anterior

## Pós-condições

- Conteúdo criado, editado, removido ou visualizado conforme ação
- Log de alterações atualizado com:
  - Ator que realizou a ação
  - Tipo de ação executada
  - Timestamp da alteração

## Regras de Negócio

1. Apenas **Admins** podem remover conteúdos completamente
2. Todos os atores podem visualizar conteúdos ativos

## Diagrama de Caso de Uso

![Diagrama - Gerenciar Conteúdos](/img/diagrams/useCases/secaoAdmin/admin-conteudo/admin-conteudo/admin-conteudo.svg)

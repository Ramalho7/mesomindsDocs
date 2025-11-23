---
title: Introdução Front-end
sidebar_label: Introdução Front-end
sidebar_position: 1
description: Visão geral do desenvolvimento do front-end.
date: 2025-11-23
---

# Documentação do Projeto MesoMinds

## Stack Tecnológica

### Core
- **React 19** - Biblioteca UI
- **TypeScript** - Tipagem estática
- **Vite 7** - Build tool e dev server
- **TailwindCSS 4** - Estilização

### Roteamento e State Management
- **TanStack Router** - Roteamento type-safe
- **TanStack Query** - Data fetching e cache
- **Zustand** - State management global
- **React Hook Form + Zod** - Formulários e validação

### UI Components
- **Radix UI** - Primitivos acessíveis (Avatar, Dialog, Dropdown, Popover, Select, Tooltip)
- **shadcn/ui** - Componentes estilizados
- **Lucide React** - Ícones
- **cmdk** - Command palette

### Editor de Texto
- **TipTap** - Editor WYSIWYG
  - Suporte a Markdown, LaTeX (KaTeX), código (Lowlight)
  - Imagens, links, emojis, YouTube embeds
  - Formatação rica (bold, italic, highlight, etc)

### Testes
- **Vitest** - Test runner
- **Testing Library** - Testes de componentes
- **Cypress** - Testes E2E

### Desenvolvimento

- **Storybook** - Documentação de componentes e realização de testes E2E com o Cypress
- **ESLint** - Linting
- **TypeScript** - Type checking

## Scripts Disponíveis

```bash
npm run dev              # Inicia dev server na porta 3000
npm run dev:https        # Inicia dev server com HTTPS
npm run build            # Build para produção + type check
npm run serve            # Preview do build de produção
npm start                # Inicia servidor Node.js

# Testes
npm run test             # Executa testes unitários
npm run test:watch       # Testes em modo watch

# Cypress E2E
npm run cypress:open     # Abre interface do Cypress
npm run cypress:run      # Executa testes E2E em headless

# Storybook
npm run storybook        # Inicia Storybook na porta 6006
npm run build-storybook  # Build do Storybook
```

## Bibliotecas Auxiliares
- **Axios** - HTTP client
- **React Toastify** - Notificações
- **Tippy.js** - Tooltips avançados
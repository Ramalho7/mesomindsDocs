# ADR 0003 — Escolha das Principais Bibliotecas e Ferramentas do Front-End

**Data:** 01/09/2025
**Status:** Aprovado

---

## Contexto

Após a definição do React.js como framework principal do front-end, foi necessário escolher o conjunto de ferramentas e bibliotecas que darão suporte ao desenvolvimento, testes, gerenciamento de estado, roteamento, requisições e documentação visual dos componentes.

O objetivo é garantir:

- Um ambiente de desenvolvimento moderno e rápido.  
- Uma arquitetura escalável e bem estruturada.  
- Um design system padronizado e reutilizável.  
- Testes confiáveis e documentação clara dos componentes.  

As opções analisadas incluíam diferentes combinações de bibliotecas para cada finalidade, considerando compatibilidade com React e manutenção a longo prazo.

---

## Decisão

Foram adotadas as seguintes ferramentas para o front-end:

| Finalidade | Ferramenta Escolhida |
|-------------|----------------------|
| Testes unitários e de integração | **Vitest** |
| Gerenciamento de estado global | **Zustand** |
| Roteamento de páginas | **TanStack Router** |
| Gerenciamento de requisições e cache | **TanStack Query** |
| Biblioteca de componentes de UI | **shadcn/ui** |
| Documentação visual de componentes | **Storybook** |

---

## Justificativas

### Vitest

- Integra-se perfeitamente com Vite, proporcionando execução de testes rápida e leve.  
- Compatível com React Testing Library.  
- Excelente performance e relatórios de cobertura nativos.  
- Configuração mínima em comparação com Jest.

### Zustand

- API simples e minimalista para gerenciamento de estado.  
- Evita boilerplate excessivo de ferramentas como Redux.  
- Integração fluida com React Hooks (`useStore`).  
- Escalável para estados locais e globais.

### TanStack Router

- Substitui o React Router com uma abordagem mais declarativa e baseada em arquivos.  
- Suporte nativo a carregamento de dados e rotas aninhadas.  
- Melhor integração com TanStack Query.  
- Performance e tipagem aprimoradas com TypeScript.

### TanStack Query

- Facilita o gerenciamento de dados assíncronos e cache de requisições.  
- Atualiza automaticamente dados em tempo real.  
- Reduz a necessidade de estados manuais relacionados a requisições.  
- Excelente compatibilidade com APIs REST e GraphQL.

### shadcn/ui

- Fornece componentes prontos e acessíveis baseados em Radix UI e TailwindCSS.  
- Facilita a criação de um design system consistente e elegante.  
- Permite customização completa e integração direta com Vite e React.  
- Acelera o desenvolvimento de UI sem engessar o estilo do projeto.

### Storybook

- Cria um ambiente isolado para desenvolvimento e documentação de componentes.  
- Facilita o teste visual e a padronização de UI.  
- Integra-se com Vitest e addons de acessibilidade e responsividade.  
- Melhora a colaboração entre desenvolvimento e design.

---

## Alternativas Consideradas

| Categoria | Alternativas | Motivo da Rejeição |
|------------|---------------|--------------------|
| Testes | Jest | Mais lento e menos integrado ao Vite. |
| Estado | Redux Toolkit, Jotai | Redux é mais verboso; Jotai tem menor adoção e tooling limitado. |
| Roteamento | React Router | TanStack Router oferece tipagem e carregamento de dados superiores. |
| Requisições | Axios isolado, SWR | Axios é manual demais; SWR tem menos controle e cache limitado. |
| UI | Chakra UI, Material UI | shadcn/ui oferece melhor integração com TailwindCSS e mais flexibilidade. |
| Documentação | Styleguidist | Storybook possui maior suporte e ecossistema mais ativo. |

---

## Consequências

- **Positivas:**  
  - Ambiente de desenvolvimento moderno, rápido e tipado.  
  - Redução de código boilerplate e aumento da produtividade.  
  - Facilidade de manutenção e escalabilidade do front-end.  
  - Maior consistência visual e documentação de componentes.  

- **Negativas:**  
  - Curva de aprendizado inicial para dominar todas as ferramentas.  
  - Manutenção de múltiplas dependências exige padronização rigorosa.  

---

## Ações Futuras

- Criar documentação interna com convenções de uso de cada biblioteca.  
- Configurar Storybook integrado ao design system baseado em shadcn/ui.  
- Implementar testes de snapshot e integração com Vitest.  
- Definir padrão de arquitetura para hooks, stores e rotas.  

---

**Status atual:** Aprovado e implementado.
**Última atualização:** 2025-09-01

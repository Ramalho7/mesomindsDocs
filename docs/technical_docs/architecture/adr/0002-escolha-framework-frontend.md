# ADR 0002 — Escolha do Framework Front-End: React.js

**Data:** 01/09/2025
**Status:** Aprovado  

---

## Contexto

O projeto requer a implementação de uma interface moderna, dinâmica e de fácil manutenção.  
A aplicação envolve interação com APIs REST, autenticação via JWT, criação de componentes reutilizáveis e escalabilidade futura.

Foram consideradas três opções principais de frameworks/bibliotecas front-end:

- React.js  
- Vue.js  
- Angular  

---

## Decisão

Optou-se por utilizar **React.js** como principal biblioteca para o desenvolvimento do front-end.

---

## Justificativas

- **Popularidade e suporte:** React é amplamente adotado pela comunidade e possui vasto ecossistema de bibliotecas e ferramentas.  
- **Componentização:** Facilita a criação de componentes reutilizáveis e manutenção do código.  
- **Integração com APIs:** Excelente integração com back-ends baseados em REST e GraphQL.  
- **Compatibilidade:** Alinha-se bem com ferramentas como Vite, TailwindCSS e shadcn/ui, já utilizadas no projeto.  
- **Curva de aprendizado:** A equipe possui experiência prévia em JavaScript, o que facilita a adoção do React.  
- **Performance:** O Virtual DOM e a renderização eficiente proporcionam uma boa experiência ao usuário.  
- **Ecossistema sólido:** Suporte a bibliotecas modernas como React Router, TanStack Query, Zustand e outros recursos do ecossistema.

---

## Alternativas Consideradas

| Alternativa | Prós | Contras |
|--------------|------|---------|
| **Vue.js** | Sintaxe simples e curva de aprendizado rápida. | Menor presença em grandes projetos da equipe e ecossistema mais limitado. |
| **Angular** | Estrutura completa com TypeScript nativo. | Mais complexo, opinativo e pesado para o tipo de aplicação planejada. |

---

## Consequências

- **Positivas:**  
  - Facilita a criação de uma interface modular e escalável.  
  - Grande quantidade de recursos, documentação e suporte.  
  - Facilidade de integração com bibliotecas de UI e back-end via API REST.

- **Negativas:**  
  - Exige configuração inicial de ferramentas (build, roteamento, estado).  
  - A necessidade de gerenciar múltiplas bibliotecas pode aumentar a complexidade do projeto.

---

## Ações Futuras

- Definir arquitetura de componentes padrão (layout, buttons, cards, etc.).  
- Implementar roteamento com TanStack Router.
- Criar documentação de estilo e estrutura de pastas do front-end.  

---

**Status atual:** Aprovado e implementado.
**Última atualização:** 01/09/2025

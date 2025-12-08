# Arquitetura de Múltiplas Aplicações - Mesominds

**Data:** 08/12/2025  
**Responsável:** Lucas Ramalho  
**Status:** Aprovado

---

## Contexto

A plataforma Mesominds possui dois públicos distintos com necessidades e experiências diferentes:

1. **Área Administrativa (Dashboard)** - Acessível via subdomínio `dashboard.mesominds.com`
   - Gerenciamento de conteúdos, usuários e configurações
   - Acesso restrito a administradores, professores e moderadores
   - Interface voltada para operações CRUD e análises

2. **Área Pública** - Acessível via domínio principal `mesominds.com`
   - Consumo de conteúdos educacionais
   - Acesso de estudantes e visitantes
   - Interface voltada para experiência de aprendizagem

## Problema

A implementação inicial utilizava uma única aplicação monolítica com lógica condicional (if/else) para diferenciar as áreas:
```javascript
// Abordagem anterior (problemática)
if (subdomain === 'dashboard') {
  // Renderiza dashboard
} else {
  // Renderiza portal público
}
```

**Limitações identificadas:**

- ✗ Funcionava localmente, mas apresentava falhas em produção
- ✗ Bundle único continha código de ambas as aplicações
- ✗ Builds grandes e lentos
- ✗ Alto acoplamento entre funcionalidades distintas
- ✗ Dificuldade para escalar equipes (conflitos de código)
- ✗ Testabilidade comprometida
- ✗ Deploy único para mudanças em qualquer área

## Solução

Migração para arquitetura de **múltiplos repositórios (polyrepo)** com biblioteca compartilhada de UI.

### Estrutura de Repositórios
```
mesominds/
├── meso-ui/              # Biblioteca compartilhada de componentes
├── mesominds-dashboard/  # Aplicação administrativa
└── mesominds-portal/     # Aplicação pública (site principal)
```

#### 1. **meso-ui** - Design System

Biblioteca de componentes React compartilhados entre as aplicações.

**Responsabilidades:**
- Componentes de UI reutilizáveis (Button, Input, Card, Modal, etc.)
- Tokens de design (cores, tipografia, espaçamentos)
- Hooks customizados compartilhados
- Utilitários e helpers comuns

**Tecnologias:**
- React + TypeScript
- Tailwind CSS
- Storybook para documentação
- Publicado como pacote NPM privado (github packages)

#### 2. **mesominds-dashboard** - Área Administrativa

Aplicação para gerenciamento da plataforma.

**Tecnologias:**
- React 19
- TypeScript
- ShadCN
- TailwindCSS

#### 3. **mesominds** - Público

Aplicação voltada para estudantes e consumo de conteúdo.

**Tecnologias:**
- React 19
- TypeScript
- ShadCN
- TailwindCSS

## Benefícios

### Performance
- **Builds menores**: Cada aplicação contém apenas o código necessário
- **Carregamento mais rápido**: Menos JavaScript para download e parsing
- **Cache otimizado**: Updates independentes não invalidam cache de outras apps

### Manutenibilidade
- **Separação de concerns**: Código isolado por domínio de negócio
- **Menos conflitos**: Equipes podem trabalhar independentemente
- **Clareza**: Estrutura de código mais organizada e previsível

### Escalabilidade
- **Deploy independente**: Cada aplicação pode ser atualizada separadamente
- **Times autônomos**: Equipes podem ter ownership de aplicações específicas
- **Tecnologias flexíveis**: Possibilidade de adotar stacks diferentes quando necessário

### Qualidade
- **Testabilidade**: Testes isolados por aplicação
- **Debugging**: Erros mais fáceis de rastrear e corrigir
- **Monitoramento**: Métricas específicas por aplicação

### Consistência
- **Design System**: meso-ui garante UI consistente
- **Reutilização**: Componentes compartilhados reduzem duplicação
- **Padrões**: Facilita manutenção de guidelines de design

## Comparação

| Aspecto | Monolito (Anterior) | Polyrepo (Atual) |
|---------|---------------------|------------------|
| **Bundle Size** | ~2.5MB | ~800KB cada |
| **Build Time** | ~8min | ~3min cada |
| **Deploy** | Único (tudo junto) | Independente |
| **Conflitos Git** | Frequentes | Raros |
| **Onboarding** | Complexo | Focado |
| **Testabilidade** | Baixa | Alta |

## Implementação

### Fase 1: Setup Inicial ✅
- [x] Criar repositório meso-ui
- [x] Configurar build e publicação NPM
- [x] Documentar componentes no Storybook

### Fase 2: Separação das Aplicações ✅
- [x] Criar repositório mesominds-dashboard
- [x] Criar repositório mesominds-portal
- [x] Migrar código existente
- [x] Configurar CI/CD para cada repo

### Fase 3: Migração Gradual 🔄
- [x] Mover componentes comuns para meso-ui
- [ ] Remover duplicações
- [ ] Estabelecer processo de versionamento

### Fase 4: Otimizações 📋
- [ ] Implementar monitoramento por aplicação
- [ ] Configurar feature flags
- [ ] Documentar guias de desenvolvimento

## Considerações Técnicas

### Versionamento do meso-ui

Seguir **Semantic Versioning**:
- `MAJOR`: Breaking changes
- `MINOR`: Novas features (backward compatible)
- `PATCH`: Bug fixes

### Sincronização de Versões
```json
// package.json das aplicações
{
  "dependencies": {
    "@mesominds/ui": "^1.2.0"
  }
}
```

### Workflow de Atualização

1. Desenvolver componente no meso-ui
2. Publicar nova versão
3. Atualizar dependência nas aplicações
4. Testar integração
5. Deploy

## Riscos e Mitigações

| Risco | Impacto | Mitigação |
|-------|---------|-----------|
| Divergência de UI | Médio | Revisões de PR obrigatórias no meso-ui |
| Versões desatualizadas | Baixo | Dependabot para updates automáticos |
| Breaking changes | Alto | Testes de integração + changelog detalhado |
| Complexidade inicial | Médio | Documentação completa + pair programming |

## Referências

- [Micro Frontends Pattern](https://micro-frontends.org/)
- [Monorepo vs Polyrepo](https://earthly.dev/blog/monorepo-vs-polyrepo/)
- [Design Systems](https://www.designsystems.com/)

---

**Última atualização:** 08/12/2025  
**Próxima revisão:** 08/03/2026
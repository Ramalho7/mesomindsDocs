# ADR 0005 — Escolha do Editor de Texto para Conteúdos/Posts

Data: 12/10/2025  
Status: Aprovado  

---

## Contexto

A plataforma necessita de um rich text editor moderno para criação e edição de conteúdos/posts, questões, simulados, etc, com suporte a formatação avançada, integração com imagens e extensibilidade. Foram analisadas as opções TipTap, Lexical e Toast UI Editor.

## Opções Consideradas

1. **TipTap**
   - Prós: Altamente extensível, boa documentação, integração fácil com React, suporte a customização e plugins.
   - Contras: Curva de aprendizado para customizações avançadas.

2. **Lexical**
   - Prós: Performance elevada, arquitetura moderna, desenvolvido pelo Meta.
   - Contras: Comunidade menor, menos plugins prontos, documentação ainda em evolução.

3. **Toast UI Editor**
   - Prós: Simplicidade de uso, bom suporte a Markdown, fácil integração.
   - Contras: Parou de receber atualizações desde 2022.

## Decisão

Optou-se pelo **TipTap** como editor de texto principal da plataforma.

## Justificativa

- Extensibilidade e customização superiores.
- Comunidade ativa e documentação robusta.
- Facilidade de integração com framework utilizados no projeto.
- Suporte nativo a recursos avançados.
- Suporte a LaTex.

## Consequências

### Benefícios

- Maior flexibilidade para evoluir o editor conforme necessidades futuras.
- Melhor experiência para usuários finais e desenvolvedores.

### Riscos

- Curva de aprendizado para customizações avançadas.
- Dependência de comunidade e manutenção do projeto.
- Pode não funcionar tão bem com Tailwind.

## Revisões Futuras

- Avaliar periodicamente novas versões e alternativas do mercado.
- Monitorar feedback dos usuários e desenvolvedores para ajustes.
- Avaliar experência dos envolvidos na criação de conteúdos para a plataforma. 

---

**Status atual:** Aprovado e implementado  
**Data:** 17/10/2025
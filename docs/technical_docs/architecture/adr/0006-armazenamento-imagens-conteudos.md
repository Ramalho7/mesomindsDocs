# ADR 0006 — Padrão de Armazenamento de Imagens para Conteúdos/Posts

Data: 11/10/2025  
Status: Aprovado  

---

## Contexto

A plataforma necessita de um padrão para armazenamento de imagens associadas a conteúdos/posts, visando facilitar a renderização dinâmica no front-end e manter a estrutura dos posts. A decisão deve considerar facilidade de integração, desempenho e reutilização de imagens.

## Opções Consideradas

1. **File Storage (Laravel)**
   - Prós: Escalável, fácil migração para S3, não sobrecarrega o banco de dados.
   - Contras: Integração menos direta com editores de texto, complexidade adicional para renderização.

2. **Base64 no Banco de Dados**
   - Prós: Simplicidade de integração com editores (TipTap, Lexical), fácil renderização.
   - Contras: Crescimento rápido do banco, possíveis problemas de desempenho.

## Decisão

Optou-se por armazenar imagens em base64 no banco de dados, utilizando relacionamento N:N entre imagens e posts.

## Justificativa

- Permite reutilização de imagens, reduzindo duplicidade.
- Facilita integração com editores de texto modernos.
- Simplifica o processo de renderização no front-end.

## Consequências

### Benefícios

- Integração facilitada com o front-end.
- Reuso de imagens entre diferentes posts.

### Riscos

- Crescimento acelerado do banco de dados.
- Possíveis impactos de desempenho.
- Relacionamento N:N não elimina duplicidades.

## Revisões Futuras

- Monitorar desempenho do banco de dados trimestralmente.
- Avaliar a necessidade de migração para File Storage/S3.
- Revisar integração com o front-end conforme evolução dos editores.

---

**Status atual:** Aprovado e implementado  
**Data:** 18/10/2025
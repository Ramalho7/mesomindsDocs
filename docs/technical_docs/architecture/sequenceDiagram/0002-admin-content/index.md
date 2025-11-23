---
title: Admin Conteúdo - Sequence Diagram
date: 2025-11-23
---

![UML Admin Conteudo - Geral](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-general.svg)

Seção dedicada a apresentação de diagramas de sequência relacionado a gerenciamneto de conteúdos na plataforma.

## Principais atores

- Admin
- Moderador
- Operador

## Principais participantes

- Web App
- Auth API
- User DB
- Session Store

## Diagramas de Sequência - Administração de Conteúdo

Este conjunto de diagramas descreve os fluxos de interação relacionados à administração de conteúdos no sistema. Cada diagrama representa um caso de uso específico, detalhando as interações entre os atores e os componentes do sistema.

### 1. **Alteração de Status**

![Alteração de Status](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-alter-status.svg)

### 2. **Criação de Conteúdo**

![Criação de Conteúdo](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-create.svg)

### 3. **Exclusão de Conteúdo**

![Exclusão de Conteúdo](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-destroy.svg)

### 4. **Edição de Conteúdo**

![Edição de Conteúdo](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-edit.svg)

### 5. **Visão Geral**

![Visão Geral](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-general.svg)

### 6. **Visualização de Conteúdo**

![Visualização de Conteúdo](/img/sequenceDiagram/0002-admin-conteudo/0002-admin-conteudo-view.svg)

> Nota: copie os arquivos SVG gerados para `static/img/sequenceDiagram/0002-admin-conteudo/` para que o Docusaurus os sirva corretamente. Se preferir manter as imagens junto aos arquivos `.md`, use caminhos relativos dentro da pasta `docs/`.

<!-- Exemplos de comando para copiar os SVGs gerados do diretório `out/` para `static/` -->
<!--
mkdir -p static/img/sequenceDiagram/0002-admin-conteudo
find out/docs/technical_docs/architecture/sequenceDiagram/0002-admin-conteudo -type f -name '*.svg' -exec cp {} static/img/sequenceDiagram/0002-admin-conteudo/ \;
npx docusaurus clear
-->

## UMLs relacionados

[UML Conteúdo detalhado](../../diagrams/useCases/secaoAdmin/admin-conteudo/admin-conteudo.md)

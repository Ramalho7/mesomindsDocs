# ADR 0004 — Padrão de Autenticação e Autorização (JWT com Laravel Passport)

Data: 10/09/2025  
Status: Aprovado  

---

## Contexto

O sistema necessita de um mecanismo seguro, escalável e padronizado para autenticação e autorização de usuários.  
O objetivo é permitir que usuários façam login, mantenham sessões válidas e acessem recursos protegidos conforme seus níveis de permissão.

As principais opções avaliadas foram:

- **Sanctum:** autenticação baseada em cookies/sessões e tokens simples.  
- **Passport:** autenticação via OAuth2, utilizando **JWT** para autenticação e autorização de APIs.

## Decisão

Foi decidido utilizar **Laravel Passport** como padrão de autenticação e autorização do sistema.

---

## Justificativa

- **Implementação completa de OAuth2:** O Passport fornece um fluxo de autenticação robusto com suporte a diversos tipos de clientes (SPA, mobile, server-side), o que o torna mais flexível para evoluções futuras.
- **Suporte nativo a JWT:** Diferente do Sanctum, o Passport gera e valida **JSON Web Tokens**, permitindo autenticação stateless e integração fácil com front-ends desacoplados (como React).
- **Gerenciamento de tokens:** Oferece mecanismos internos de expiração, revogação e escopos de permissão, aumentando o controle de acesso.
- **Integração com o ecossistema Laravel:** O Passport é mantido oficialmente pela equipe Laravel, o que garante compatibilidade, documentação clara e atualizações regulares.
- **Escalabilidade e segurança:** A arquitetura sem estado (stateless) e o uso de tokens assinados reduzem dependências de sessão no servidor e melhoram a escalabilidade em ambientes distribuídos.

---

## Consequências

### Positivas

- Integração direta com o Laravel e suporte oficial da comunidade.  
- Controle granular de permissões e escopos.  
- Tokens podem ser usados em múltiplos front-ends (SPA, mobile, etc.).  
- Facilita integração futura com terceiros via OAuth2.

### Negativas

- Configuração inicial mais complexa do que Sanctum.  
- Pode ser excessivo para aplicações menores que não necessitam de OAuth2 completo.  
- Exige atenção à segurança do token (armazenamento, expiração e renovação).

---

## Alternativas Consideradas

1. **Laravel Sanctum:** mais simples, porém limitado para APIs externas e múltiplos tipos de clientes.  
2. **JWT manual (via tymon/jwt-auth):** oferece controle total, mas exige manutenção e integração manual.  
3. **Auth via sessão:** inadequado para SPAs e arquiteturas distribuídas.

---

## Revisões Futuras

- Avaliar a introdução de **refresh tokens** e fluxos híbridos com Sanctum para SPAs.  
- Reconsiderar Sanctum caso o sistema simplifique e não precise mais de OAuth2.  
- Monitorar possíveis melhorias no ecossistema Laravel para autenticação moderna.

---

**Status atual:** Aprovado e implementado
**Última atualização:** 14/10/2025

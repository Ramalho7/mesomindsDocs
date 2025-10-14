# Glossário do Sistema

Este documento descreve os principais termos, conceitos e componentes utilizados no desenvolvimento e funcionamento do sistema.

---

## Conceitos Gerais

| Termo | Descrição |
|--------|------------|
| **Aluno** | Pode pode interagir com o sistema, consumir conteúdos, participar de turmas, participar de campeonatos, realizar provas e simulados. |
| **Administrador** | Usuário com permissões elevadas, responsável pela moderação e gestão do sistema. |
| **Moderador** | Usuário com privilégios intermediários, responsável por revisar e aprovar conteúdos de outros usuários. |
| **Operador** | Uusuário com privilégios menores do que o moderador, ele pode apenas realizar ações de criação/edição(limitados) dentro do sistema. |

---

## Conteúdo e Estrutura

| Termo | Descrição |
|--------|------------|
| **Post / Conteúdo** | Unidade principal de publicação do sistema. Pode ser um artigo, tutorial, notícia, etc. |
| **Content Type** | Categoria do conteúdo (ex: Artigo, Tutorial, Pergunta). |
| **Tag** | Palavra-chave usada para classificar e organizar conteúdos. |
| **Badge** | Recompensa visual concedida a usuários com base em ações ou conquistas. |
| **Status** | Estado atual do conteúdo (ex: `Rascunho`, `Publicado`, `Arquivado`). |
| **Excerpt** | Trecho curto de um post, usado como resumo em listagens. |
| **Slug** | Identificador textual único usado em URLs (ex: `meu-primeiro-post`). |
| **Comentário** | Mensagem deixada por usuários em um conteúdo. |
| **Anexo** | Arquivo (imagem, vídeo, PDF etc.) associado a um conteúdo. |
| **Conteúdo Moderado** | Postagem que precisa de aprovação antes de ser publicada. |

---

## Banco de Dados e Backend

| Termo | Descrição |
|--------|------------|
| **Migration** | Arquivo usado para versionar e estruturar o banco de dados (Laravel). |
| **Seeder** | Script para inserir dados iniciais ou de teste. |
| **Model** | Representa uma tabela no banco e define seus relacionamentos. |
| **Controller** | Gerencia as requisições HTTP, validando e manipulando dados. |
| **Storage** | Diretório onde são salvos arquivos enviados, como imagens e vídeos. |
| **Policy** | Define regras de autorização no Laravel. |
| **Request** | Classe responsável pela validação de dados recebidos nas requisições. |
| **Resource** | Classe usada para formatar o retorno de dados de forma consistente. |
| **Factory** | Gera dados falsos para testes automáticos. |
| **Sessão** | Estado ativo de um usuário autenticado no sistema (login). |
| **Token JWT** | Chave usada para autenticação segura entre o front-end e o back-end. |
| **Autenticação** | Processo de verificação da identidade de um usuário (ex: login com e-mail e senha). |
| **Autorização** | Processo que define quais ações cada usuário pode executar no sistema. |

---

## Front-End

| Termo | Descrição |
|--------|------------|
| **Componente** | Unidade reutilizável da interface, como botões, cards ou modais. |
| **Props** | Dados passados para um componente React. |
| **State** | Variáveis internas de um componente React. |
| **Hook** | Função especial do React para gerenciar estados e efeitos (ex: `useState`, `useEffect`). |
| **shadcn/ui** | Biblioteca de componentes estilizados usada no projeto. |
| **Vite** | Ferramenta de build e desenvolvimento rápido para projetos front-end. |
| **TailwindCSS** | Framework de utilitários CSS usado para estilização. |
| **Layout** | Estrutura base das páginas do sistema (header, footer, sidebar, etc.). |

---

## Infraestrutura e Ferramentas

| Termo | Descrição |
|--------|------------|
| **Docker** | Ferramenta de containerização para padronizar o ambiente de desenvolvimento. |
| **Docker Compose** | Ferramenta para orquestrar múltiplos containers Docker. |
| **.env** | Arquivo de variáveis de ambiente do projeto (credenciais, URLs, chaves secretas). |
| **API REST** | Interface que permite a comunicação entre front-end e back-end. |
| **Endpoint** | URL que representa uma rota específica da API. |
| **Request** | Requisição HTTP enviada ao servidor. |
| **Response** | Resposta retornada pelo servidor à requisição. |
| **Log** | Registro de eventos e erros do sistema. |
| **Middleware** | Camada intermediária que processa requisições antes de chegarem ao controller. |
| **Payload** | Referente ao body de uma requisição HTTP, a informação que será enviada para o servidor |

---

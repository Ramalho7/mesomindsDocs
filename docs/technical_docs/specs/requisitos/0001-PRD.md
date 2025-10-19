## Infos gerais

**Mesominds:** Plataforma para auxiliar na educação de jovens para aprender matemática
**Responsável:** Lucas Ramalho
**Data:** 01/09/2025
**Versão:** 1.0

---

## Visão do projeto

O objetivo do produto é fornecer uma plataforma online que auxilie na aprendizagem de matemática para alunos do ensino médio, pré-vestibular, o sistema conterá: conteúdos/posts, questões, simulados, provas, turmas.

O sistema funcionará como um CMS de conteúdo, questões, simulados, provas, etc.

---

## Objetivos Principais

- Facilitar o aprendizado de matemática
- Uso de metologias modernas
- Histórico básico sobre o usuário

---

## Escopo do produto

### Funcionalidades Principais

1. **Cadastro e autenticação de usuários**

- Login e registro via e-mail/senha
- Recuperação de senha
- Sessão com JWT
- Sistema de roles para separação de responsabilidades por perfil de system_user

2. **Gerenciamento de conteúdos**

- Criar, editar, excluir conteúdos
- Garantir que apenas perfis de usuário: ADM, Moderador, e Operador, possam gerenciar conteúdos, cada um possuindo suas permisões

[] Finalizar

---

## Requisitos funcionais(RF)

| ID   | Requisito                            | Prioridade | Descrição                                                                                                                                                        |
| ---- | ------------------------------------ | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| RF01 | Cadastro de usuário                  | Alta       | O sistema deve permitir criar uma conta com e-mail e senha.                                                                                                      |
| RF02 | Login com JWT                        | Alta       | O sistema deve autenticar o usuário via JWT.                                                                                                                     |
| RF03 | CRUD Questões                        | Alta       | O sistema deve ser capaz de realizar CRUD de questões.                                                                                                           |
| RF04 | CRUD de conteúdos                    | Alta       | O sistema deve ser capaz de realizar CRUD de conteúdos.                                                                                                          |
| RF05 | CRUD de Materia                      | Média      | O sistema deve ser capaz de realizar CRUD de matérias.                                                                                                           |
| RF06 | CRUD de Atividades                   | Alta       | O sistema deve ser capaz de realizar CRUD de atividades.                                                                                                         |
| RF07 | Sistema de campeonatos               | Baixa      | O sistema deve gerenciar campeonatos, consistindo em uma coletânea de questões que o usuário deverá acertar para competir com amigos e outros usuários.          |
| RF08 | Sistema de Badges                    | Baixa      | O sistema deve gerenciar badges na plataforma para recompensar alunos.                                                                                           |
| RF09 | Sistema de "termo" matemático        | Baixa      | Sistema parecido com o Nerdle para gerar desafios diários de matemática aos usuários.                                                                            |
| RF10 | Sistema de quizzes matemáticos       | Baixa      | O sistema deve gerenciar quizzes matemáticos, que aparecerão no primeiro acesso diário do usuário.                                                               |
| RF11 | Alta acessibilidade                  | Alta       | O sistema deve possuir alta acessibilidade para todos os tipos de usuários.                                                                                      |
| RF12 | Sistema Freemium                     | Média      | O sistema deve gerenciar usuários free e premium, garantindo segurança de dados pessoais.                                                                        |
| RF13 | Sistema de roadmap                   | Baixa      | O sistema deve apresentar um roadmap mostrando aos alunos passos para aprender determinado assunto de matemática.                                                |
| RF14 | Modo dislexia                        | Média      | O sistema deve oferecer métodos para melhorar a experiência de usuários com dislexia, como fontes adequadas.                                                     |
| RF15 | Download de conteúdos da plataforma  | Alta       | O sistema deve permitir baixar conteúdos (simulados, provas, questões, atividades, posts) em PDF.                                                                |
| RF16 | Ranking e sistema de pontuação       | Baixa      | O sistema deve manter ranking global e entre amigos baseado em pontuação de quizzes e campeonatos.                                                               |
| RF17 | Notificações e lembretes             | Baixa      | O sistema deve enviar notificações sobre novas atividades, desafios diários e lembretes de estudo.                                                               |
| RF18 | Sistema de mensagens e comunidade    | Baixa      | O sistema deve permitir mensagens entre usuários e fóruns temáticos para troca de conhecimento.                                                                  |
| RF19 | Área administrativa (Painel Admin)   | Alta       | O sistema deve possuir painel administrativo para gerenciar usuários, conteúdos e estatísticas.                                                                  |
| RF20 | Sistema de comentários e avaliações  | Média      | O sistema deve permitir que usuários comentem e avaliem conteúdos ou quizzes.                                                                                    |
| RF21 | Controle de tempo de estudo          | Baixa      | O sistema deve monitorar o tempo dedicado pelo aluno aos estudos e permitir definição de metas semanais.                                                         |
| RF22 | Multi-idioma                         | Baixa      | O sistema deve oferecer suporte a múltiplos idiomas, inicialmente português e inglês.                                                                            |
| RF23 | Painel de conquistas                 | Baixa      | O sistema deve exibir todas as conquistas e badges desbloqueadas pelo usuário.                                                                                   |
| RF24 | Controle de permissões e papéis      | Alta       | O sistema deve gerenciar diferentes níveis de acesso (aluno, professor, admin, premium).                                                                         |
| RF25 | Exportação de relatórios             | Baixa      | O sistema deve permitir exportar relatórios em PDF, CSV e Excel.                                                                                                 |
| RF26 | Integração com sistema de pagamento  | Baixa      | O sistema deve se integrar a gateways de pagamento para planos premium.                                                                                          |
| RF27 | Sistema de logs e auditoria          | Alta       | O sistema deve registrar todas as ações críticas (login, edições, exclusões) para fins de auditoria.                                                             |
| RF28 | IA Tutora Personalizada (Fine-Tuned) | Baixa      | O sistema deve contar com uma IA tutora treinada para auxiliar alunos durante estudos, oferecendo explicações, sugestões de conteúdo e feedbacks personalizados. |

## Requisitos não funcionais(RNF)

| ID    | Requisito Não Funcional      | Categoria           | Descrição                                                                                                               |
| ----- | ---------------------------- | ------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| RNF01 | Desempenho                   | Performance         | O sistema deve responder de forma ágil às interações do usuário, garantindo experiência satisfatória.                   |
| RNF02 | Escalabilidade               | Infraestrutura      | O sistema deve suportar crescimento do número de usuários e dados sem degradação significativa do serviço.              |
| RNF03 | Segurança                    | Autenticação        | Todo acesso deve ser autenticado e as informações sensíveis devem ser armazenadas de forma segura.                      |
| RNF04 | Privacidade                  | Dados pessoais      | O sistema deve proteger os dados dos usuários, garantindo confidencialidade e conformidade com a legislação vigente.    |
| RNF05 | Disponibilidade              | Uptime              | O sistema deve estar disponível na maior parte do tempo, minimizando períodos de indisponibilidade.                     |
| RNF06 | Usabilidade                  | UX/UI               | A interface deve ser intuitiva, responsiva e acessível, permitindo uso por pessoas com diferentes níveis de habilidade. |
| RNF07 | Manutenibilidade             | Código              | O código deve ser modular, documentado e fácil de manter e evoluir.                                                     |
| RNF08 | Compatibilidade              | Navegadores         | O sistema deve funcionar nos principais navegadores modernos e em dispositivos móveis.                                  |
| RNF09 | Backup e Recuperação         | Dados               | O sistema deve possuir mecanismos de backup e recuperação de dados em caso de falha.                                    |
| RNF10 | Monitoramento                | Logs e métricas     | O sistema deve registrar logs de eventos importantes e fornecer métricas para análise e manutenção.                     |
| RNF11 | Acessibilidade               | Inclusão            | O sistema deve atender a padrões de acessibilidade, permitindo uso por pessoas com deficiência.                         |
| RNF12 | Internacionalização          | Idiomas             | O sistema deve permitir suporte a múltiplos idiomas e fácil inclusão de novos idiomas.                                  |
| RNF13 | Tolerância a falhas          | Resiliência         | O sistema deve lidar com falhas de serviço sem comprometer dados ou experiência do usuário.                             |
| RNF14 | Integração com APIs externas | Interoperabilidade  | O sistema deve permitir integração segura com sistemas e serviços externos.                                             |
| RNF15 | IA Tutora                    | Performance/Ética   | A IA deve fornecer respostas pedagógicas corretas e úteis, respeitando a privacidade e contexto do usuário.             |
| RNF16 | Testes                       | Código              | Código deve possuir parte das suas funções, componentes, etc, testados e documentados, teste unitarios e automatizados  |
| RNF17 | Testabilidade                | Qualidade do código | O código deve ser escrito de forma a permitir testes de forma simplificada                                              |

---

## Premissas

#### Back-end

- O sistema será desenvolido em **Laravel + MySQL**
- O sistema usará:
  - Passport para autenticação e autorização
  - O sistema usará o PHP 8.3
  - Sistema usará composer

#### Front-end

- O sistema será um SPA com **React + Vite**
- Sistema usará:
  - ShadCN
  - Tanstack Router
  - Tanstack Query
  - Storybook
  - TailwindCSS

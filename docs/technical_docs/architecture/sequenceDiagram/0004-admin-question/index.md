---
title: Diagrama de sequência question
date: 2025-11-23
---

### 1. **Criação de Questões**
O diagrama de sequência para a criação de questões descreve o fluxo de interação entre o usuário (Admin/Moderador/Operador), o Web App (Frontend), a API (Backend), o serviço de autenticação e o banco de dados. O processo inclui:

- O usuário acessa a página de criação de questões e autentica sua sessão.
- Após preencher o formulário, o Web App envia uma requisição para a API com o token de autenticação e os dados da questão.
- A API valida o token e insere os dados no banco de dados.
- Em caso de sucesso, uma confirmação é retornada ao usuário com o ID da nova questão. Caso o usuário não esteja autenticado, ele é redirecionado para a página de login.

### 2. **Exclusão de Questões**
O diagrama de sequência para a exclusão de questões detalha o fluxo de interação entre o usuário (Admin), o Web App (Frontend), a API (Backend), o serviço de autenticação e o banco de dados. O processo inclui:

- O usuário (Admin) solicita a exclusão de uma questão específica através do Web App.
- O Web App encaminha a requisição para a API, que valida o token de autenticação e verifica se o usuário possui a permissão necessária (role = ADMIN).
- Se o usuário for um administrador, a API realiza a exclusão da questão no banco de dados.
- Em caso de sucesso, uma resposta de "204 No Content" é retornada ao usuário. Se a questão não for encontrada, uma mensagem de "404 Not Found" é enviada. Caso o usuário não tenha permissão, uma resposta de "403 Forbidden" é retornada.

Esses diagramas destacam a importância da autenticação e autorização em operações sensíveis, garantindo que apenas usuários com as permissões adequadas possam criar ou excluir questões.

### 3. **Atualização de Questões**
O diagrama de sequência para a atualização de questões descreve o fluxo de interação entre o usuário (Admin/Moderador/Operador), o Web App (Frontend), a API (Backend), o serviço de autenticação e o banco de dados. O processo inclui:

- O usuário acessa a página de edição de questões e autentica sua sessão.
- O Web App verifica a sessão do usuário e obtém os dados da questão a ser editada através de uma requisição à API.
- A API valida o token de autenticação e consulta o banco de dados para recuperar os dados da questão.
- Após os dados serem exibidos, o usuário altera as informações e clica em "Salvar".
- O Web App valida o payload localmente (por exemplo, usando Zod). Em caso de erro de validação, os erros são exibidos ao usuário.
- Se o payload for válido, o Web App envia uma requisição `PUT` para a API com o token de autenticação e os dados atualizados.
- A API realiza as seguintes ações:
  - Se novas alternativas forem fornecidas ou o tipo da questão for alterado, as alternativas antigas são removidas e as novas são inseridas.
  - Atualiza os dados da questão no banco de dados.
- Em caso de sucesso, uma confirmação é retornada ao usuário indicando que a questão foi atualizada. Caso o usuário não esteja autenticado, ele é redirecionado para a página de login.

Esse diagrama destaca a validação local e no backend, além de garantir que apenas usuários autenticados possam atualizar questões.
---
title: Passo a passo de instalação
---

- **Data:** 08/12/2025
- **Responsável:** Lucas Ramalho

---

## 1. Configurar o arquivo `.npmrc`

Para configurar o acesso ao repositório privado do GitHub, siga os passos abaixo:

1. Crie um arquivo chamado `.npmrc` no diretório raiz do seu projeto.
2. Adicione as seguintes linhas ao arquivo:

    ```ts
    @ramalho7:registry=https://npm.pkg.github.com
    //npm.pkg.github.com/:_authToken=<GITHUB_TOKEN>
    ```

    - Substitua `<GITHUB_TOKEN>` pelo seu token pessoal do GitHub.

3. Salve o arquivo.

### 1.1 Criar o `GITHUB_TOKEN`

Para gerar o token de autenticação:

1. Acesse o link: [Github Generate PAT](https://github.com/settings/tokens).
2. Clique em **Generate new token** e selecione a opção `classic`.
3. Escolha as permissões necessárias:
    - **Repos:** Leitura e escrita.
    - **Packages:** Leitura e escrita.
4. Copie o token gerado.

> **Atenção:** O token será exibido apenas uma vez. Guarde-o em um local seguro.

5. Substitua `<GITHUB_TOKEN>` no arquivo `.npmrc` pelo token gerado.

---

Pronto! Agora você está configurado para acessar os pacotes privados do GitHub.

## 2. Instalando as dependências

Após configurar o arquivo `.npmrc`, siga os passos abaixo para instalar as bibliotecas necessárias:

1. Certifique-se de que está no diretório raiz do projeto.
2. Execute o comando abaixo para instalar as dependências:

    ```bash
    npm install 
    ```

    > Isso instalará todas as dependências listadas no arquivo `package.json`.

    ```bash
    npm install @ramalho7/mesoui
    ```

    > Isso instala a mesoui

---

## 3. Verificando a instalação

Para garantir que as bibliotecas foram instaladas corretamente:

1. Verifique se a pasta `node_modules` foi criada no diretório do projeto.
2. Execute o seguinte comando para verificar se as dependências estão funcionando:

    ```bash
    npm list
    ```

    > Este comando exibirá uma lista das dependências instaladas.

---

## 4. Testando o ambiente

1. Execute o projeto para garantir que tudo está funcionando corretamente:

    ```bash
    npm run dev
    ```

2. Verifique se há erros no terminal ou no navegador.
3. Caso encontre problemas, revise as configurações do `.npmrc` e o token utilizado.

---


Pronto! Agora o ambiente está configurado e pronto para uso.
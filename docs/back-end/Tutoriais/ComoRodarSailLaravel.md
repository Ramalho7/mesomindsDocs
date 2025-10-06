# Subindo container Sail pela primeira vez

Este guia explica como configurar e executar Laravel Sail corretamente para o projeto MesoMinds.

### Requisitos

- Docker 
- Linux, MacOS ou WSL2

# Passo a passo

## 1. Iniciar os containers com Docker Compose

Primeiro, certifique-se de que o Docker esteja em execução, então execute:

```bash
docker compose up -d --build
```

- Este comando constrói e inicia os containers em segundo plano (-d).

## 2. Verificar se o container está funcionando corretamente

- Para confirmar que o container Laravel está rodando:

```bash
docker compose exec laravel.test bash
```

- Dentro do container

```bash
php -v
```

- Você deverá ver a versão 8.3 do PHP na saída, confirmando que o ambiente está funcionando corretamente.

## 3. Instalar as dependências do projeto

```bash
docker compose exec laravel.test composer install --no-interaction --prefer-dist --optimize-autoloader
```

- Este comando instala todas as dependências PHP definidas no composer.json sem solicitar interação do usuário, e otimiza o carregador de classes.

- Para confirmar que está tudo correto, você pode rodar o comando:

```bash
./vendor/bin/sail composer install
```

- A partir desse momento, podemos usar o prório sail para gerenciamento e não mais o docker.

## 4. Gerar chaves da aplicação

- Para gerar a chave da aplicação Laravel:

```bash
./vendor/bin/sail artisan key:generate```

- Em seguida, gere as chaves do Laravel Passport para autenticação:

```bash
./vendor/bin/sail artisan passport:keys
```

## 5. Executar as migrações e seeders do banco de dados

Para criar as tabelas e popular o banco com dados iniciais:

```bash
./vendor/bin/sail artisan migrate:refresh --seed
```

Com esses passos já deve ser possível usar o projeto sem precisar possuir o php/composer na sua máquina.

---

## Informações adicionais

- A aplicação estará acessível em: http://127.0.0.1:8000
- Para testes de API, use este endereço base: http://127.0.0.1:8000/api/
- Não é necessário executar php artisan serve, pois o container já disponibiliza a aplicação

#### Criando alias para o sail

```bash
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
```

---

## Links

[Documentação laravel sail](https://laravel.com/docs/12.x/sail)
[Download docker](https://www.docker.com/products/docker-desktop/)
[Download git](https://git-scm.com/downloads)
[Download WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install)
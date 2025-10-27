---
title: Como rodar Sail - Laravel
---

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
./vendor/bin/sail artisan key:generate
```

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

## 6. Corrigir permissões de arquivos e pastas

Após a instalação das dependências e geração das chaves, é importante ajustar as permissões dos arquivos para garantir o funcionamento correto da aplicação.

### 6.1. Ajustar permissões de storage e cache

Dentro do container, execute os seguintes comandos para corrigir as permissões das pastas de armazenamento e cache:

```bash
./vendor/bin/sail exec laravel.test bash
chown -R sail:sail storage bootstrap/cache
chmod -R 775 storage bootstrap/cache
```

### 6.2. Corrigir permissões das chaves OAuth (Laravel Passport)

As chaves do Laravel Passport requerem permissões específicas por questões de segurança. Execute os comandos abaixo:

```bash
chmod 660 storage/oauth-public.key
chmod 660 storage/oauth-private.key
chown sail:sail storage/oauth-public.key
chown sail:sail storage/oauth-private.key
```

**Importante:** As chaves OAuth devem ter permissões `660` ou `600` para evitar problemas de segurança e alertas do Laravel.

### 6.3. Sair do container

Após ajustar as permissões, saia do container:

```bash
exit
```

### 6.4. Reiniciar os containers

Para garantir que todas as alterações sejam aplicadas corretamente, reinicie os containers:

```bash
./vendor/bin/sail down
./vendor/bin/sail up -d
```

### 6.5. Verificar se a aplicação está funcionando

Teste se a aplicação está acessível:

```bash
curl http://127.0.0.1:8000
```

Ou acesse diretamente no navegador: [http://127.0.0.1:8000](http://127.0.0.1:8000)

Para testar as rotas da API, utilize:

```bash
curl http://127.0.0.1:8000/api/users
```

### Troubleshooting de permissões

**Problema:** Mensagem de erro sobre permissões incorretas das chaves OAuth

**Solução:** Certifique-se de que executou os comandos `chmod` e `chown` **dentro do container**, não no host. O usuário `sail` só existe dentro do ambiente Docker.

**Problema:** Erro `ECONNRESET` ou `Connection reset by peer` ao acessar a aplicação

**Solução:** Verifique se:

1. As permissões de `storage` e `bootstrap/cache` estão corretas
2. As chaves OAuth têm permissões `660`
3. Os containers foram reiniciados após as alterações

---

## Permissões usuários

1. Lembre-se de adicionar seu usuário ao grupo docker para que consiga rodar os comandos corretamente sem uso de `sudo`

```bash
sudo usermod -aG docker $USER
```

Após a adição, reinicie a seção e rode o comando abaixo para que verificar se o seu user foi adicionado corretamente:

```bash
groups
```

Caso sim, deve aparecer o seu usuário participando do group docker.

Pode ser que haja problema ao rodar o docker ainda, para isso tente alterar as persmissões do docker:

```bash
sudo chmod 666 /var/run/docker.sock
```

Após, isso, altere as permissões as pastas:

```bash
chmod 660 storage/oauth-public.key
chmod 660 storage/oauth-private.key
```

---

## Informações adicionais

- A aplicação estará acessível em: <http://127.0.0.1:8000>
- Para testes de API, use este endereço base: <http://127.0.0.1:8000/api/>
- Não é necessário executar php artisan serve, pois o container já disponibiliza a aplicação

#### Criando alias para o sail

```bash
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
```

---

## Links

- [Documentação laravel sail](https://laravel.com/docs/12.x/sail)
- [Download docker](https://www.docker.com/products/docker-desktop/)
- [Download git](https://git-scm.com/downloads)
- [Download WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install)

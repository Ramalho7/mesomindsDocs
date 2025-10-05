# Sail Laravel

O Sail é uma interface de linha de comando leve incorporada ao Laravel para criação e gerenciamento de containers Docker.

## Pré-requisitos

- MacOS, Linux ou Windows com WSL2
- Docker Desktop instalado e rodando
- Git instalado

## Instalação e Configuração

### 1. Clone o projeto

```bash
git clone <url-do-repositorio>
cd mesomindsAPI
```

### 2. Configure o ambiente

Copie o arquivo de exemplo e configure as variáveis de ambiente:

```bash
cp .env.example .env
```

### 3. Inicie os containers

```bash
./vendor/bin/sail up -d
```

O parâmetro `-d` executa os containers em segundo plano.

### 4. Instale as dependências

```bash
./vendor/bin/sail composer install
```

### 5. Gere a chave da aplicação

```bash
./vendor/bin/sail artisan key:generate
```

### 6. Execute as migrations

```bash
./vendor/bin/sail artisan migrate
```

## Comandos Úteis

### Iniciar os containers
```bash
./vendor/bin/sail up -d
```

### Parar os containers
```bash
./vendor/bin/sail down
```

### Ver logs dos containers
```bash
./vendor/bin/sail logs
```

### Acessar o container via shell
```bash
./vendor/bin/sail shell
```

### Executar comandos Artisan
```bash
./vendor/bin/sail artisan <comando>
```

### Executar comandos Composer
```bash
./vendor/bin/sail composer <comando>
```

### Executar testes
```bash
./vendor/bin/sail test
```

## Alias (Opcional)

Para facilitar o uso, você pode criar um alias para o comando `sail`:

**Linux/MacOS:**
```bash
alias sail='[ -f vendor/bin/sail ] && bash vendor/bin/sail || bash sail'
```

**Windows (PowerShell):**
```powershell
Set-Alias -Name sail -Value ./vendor/bin/sail
```

Após isso, você pode usar apenas `sail` ao invés de `./vendor/bin/sail`:
```bash
sail up -d
sail artisan migrate
```

## Conectando ao Banco de Dados

### Credenciais padrão:

- **Host:** `localhost`
- **Porta:** `3306`
- **Database:** `mesominds`
- **Usuário:** `sail`
- **Senha:** `password`

### Configuração no DBeaver (ou outro SGBD):

1. Crie uma nova conexão MySQL
2. Use as credenciais acima
3. Em **Driver Properties**, adicione:
   - `allowPublicKeyRetrieval` = `true`
4. Teste a conexão

## Acessando a Aplicação

Após iniciar os containers, a aplicação estará disponível em:

- **Web:** [http://localhost](http://localhost)
- **API:** [http://localhost/api](http://localhost/api)


## Serviços Incluídos

- **PHP 8.3** - Runtime da aplicação
- **MySQL 8.0** - Banco de dados
- **Supervisor** - Gerenciador de processos

## Recursos Adicionais

- [Documentação oficial do Laravel Sail](https://laravel.com/docs/sail)
- [Documentação do Laravel](https://laravel.com/docs)
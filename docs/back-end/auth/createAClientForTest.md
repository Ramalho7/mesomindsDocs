# Criando um usuário/cliente teste para testes

Isso será útil em muitos momento que será preciso testar algum endpoint que é preciso auth, para que isso seja mais simples, podemos fazer da forma descrita nesse documento.

---

- Para isso, podemos seguir os comandos: 

```bash
php artisan tinker
```

-. Dentro do tinker do artisan, usamos o comando: 

```bash
$user = \App\Models\SystemUser::first();
```

- Que retornará o primeiro usuário do banco, será esse que iremos usar para os testes, sinta-se livre para usar qualquer um, ou até criar o seu próprio.

- Poder ser preciso buscar por um user especifico, para isso, use o método `find` ou o `findOrFail`

```bash
$user = \App\Models\SystemUser::find(11);
```

```bash
php artisan passport:client --personal
```
- Agora, fora do tinker, com o comando acima, iremos criar o nosso "Personal Acess Client" para `users` user provider, sem isso não conseguiremos resgatar o token JWT fornecido pelo passport.

- Você se depará com uma tela de dialogo parecida com essa: 

![alt text](./images/personalTokenPassportLaravel.png)

- Responda como está na imagem, mas sinta-se livre para usar o nome de client que preferir, apenas a próxima pergunta deve ser respondida da mesma forma.

```bash
$token = $user->createToken('postman-test');
```

- Dentro do tinker, rode o comando acima para criar um token
- `postman-test` pode ser qualquer outro nome que queira.

```bash
echo "Bearer " . $token->accessToken;
```

- Dê echo no token e copie a resposta fornecida no console.

### No postman

- Dentro do postman, você irá em `Headers` adicionará: as keys `Authorization` e `Accept` 
  - `Authorization`: adicione o seu JWT fornecido no echo ao `value` no header
  - `Accept`: adicione o texto: application/json ao `value` no header

- Agora você poderá testar endpoints que precisam de autenticação.

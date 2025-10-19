# Caso de Uso: Gerenciar Conteúdos 

## Atores Principais

- Admin
- Moderador
- Operador

## Descrição
Permite ao admin, moderador e Operador a criar, editar, remover e visualizar conteúdos na plataforma, garantindo que apenas usuários autorizados possam realizar essas operações.

## Fluxo Principal

### Admin

1. Ator acessa o painel de gerenciamento de conteúdos.
2. Ator visualiza a lista de conteúdos existentes.
3. Ator pode:
   - Criar novo conteúdo
   - Editar conteúdo existente
   - Remover conteúdo
   - Visualizar detalhes de um conteúdo

## Permisão dos atores

| Ação                | Admin | Moderador | Operador |
|---------------------|:-----:|:---------:|:--------:|
| Criar conteúdo      |   V   |     V     |    V     |
| Editar conteúdo     |   V   |     V     |    V     |
| Remover conteúdo    |   V   |     X     |    X     |
| Visualizar conteúdo |   V   |     V     |    V     |

## Fluxos Alternativos

- Se o Ator tentar editar ou remover um conteúdo inexistente, o sistema exibe uma mensagem de erro.
- Se o Ator tentar criar conteúdo com dados inválidos, o sistema solicita correção.

## Pré-condições

- Atores está autenticado na plataforma.

## Pós-condições

- Conteúdo criado, editado ou removido conforme ação do ator.
- Log de alterações atualizado.

## Regras de Negócio

- Apenas admins podem gerenciar de forma irrestrita conteúdos da plataforma.
- Todos os usuários podem ter acesso a conteúdos ativos e inativos ou rascunhados.
- Apenas admins podem remover conteúdos completamente da plataforma.

## Diagrama de Caso de Uso

[Diagrama de caso de uso](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=UMLMesominds.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22UserCaseConteudos%22%20id%3D%22xWxxbGBoY6L5D_t_7vkr%22%3E7VpdU6MwFP01PO4OgULLY63VfdCxs86s%2BhhLhOwGwoSLbf31G0ooH3Grq1aoQ18kJ5fEnJyk5yY17Fm0Phc4CS%2B5T5hhmf7asE8Ny0KW5co%2FObIpENdFBRAI6qugCrimT0SBpkIz6pO0EQicM6BJE1zyOCZLaGBYCL5qhj1w1uw1wQHRgOslZjp6Q30IC3RijSv8B6FBWPaMXK%2BoucfLP4HgWaz6Myz7YfspqiNctqUGmobY56saZM8NeyY4h%2BIpWs8Iy7ktaSveO%2FtH7e7%2FFiSG17zA7q48tPS90%2FO7hXnpnsQ3M%2FKtnIUUNiUhxJf8qCIXEPKAx5jNK%2FRkO2iSN2vKUhVzwXkiQSTB3wRgoyYbZ8AlFELEVC1ZU7itPd%2FlTX23Wx9VebpWHW0Lm1phQQSNCBBRYjGIzW29UDTslMWqqW1p11bsT3MlyWLMY1IgZ5QxVa8zrchPeSaWZB%2B9StBYBAT2xDlFXE59rQM1j%2BeEy1GKjQwQhGGgj03pYrUCgl1cpQL5oITwP6KwB1H0QBQI9UsV7qCKPqiiZ3vFeFBFH1Qx6pUq8vcHVXSuCqtn3yBFu4%2BYZaqnqR%2FRWJOKdMpJ%2FphFbLoELufh5JEIoNK0X%2BB7whY8pUB5LEPuOQCPagFTRoO8AnLN1MXBM2A0JrNdGrF3CvLmyHovZ2Wtp%2FIBlf9YprLUqyqbsBUU1hIJ1zzU2tNYXsjJxQ9cRDjPS0jKJel%2BqtO%2BohHDW6GuQgrkOsFbFa5k4tfk8gNos5wmbQg9Q1tpOeq8Oc6hiHM04maCYlHknkCMmW2cTH2uEyfbltnqm3jbO4OvJtObNLgc6VQi6xkJTg7FJHpmpUOGGX3a0pkChqz%2FNNpO5zyONB7nPgVdk73nEnWvSX15%2FyQRlyM6OjK7X%2BCWvsB%2F0bRa4ce2YXa%2B0ic6R5%2Fnl0vj%2B9F%2BGfXFLysbcWzHcN6XFwXqvSQ%2BPrHevipHhTe1gITTGNJay4scqDYsx255E8%2Bp6%2Bvl%2BPblQCt%2BNB6%2FLx5NWnovRlipf0fVO751Or2sGHbJfp5LW53eVgyqONhZ0xs3yua5wssbZTPeNU3j4BuZq7nn%2FF5dYJ8LTctHdRjmtA7D7LGjGetPPQz7%2Bhaqy71hfJy%2Beki2%2BiCKvjjrUesgerLf%2BbbjLe8TvjCsTm9ZB8n2zOO0705ekqzTgccZax7nKvmKFge5B7vvk8Xq54HFvFS%2FwbTnfwE%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E)


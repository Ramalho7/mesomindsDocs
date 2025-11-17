---
title: Login
---

- Data: 28/10/2025
- Autor: Lucas Ramalho

---

O sistema de autenticação funciona utilizando o passport laravel OAuth2, gerando um Token para o usuário poder acessar o sistema.

Como nesse momento, não temos mais de um sistema que acessará a nossa aplicação, como por exemplo, um APP de celular e um desktop, não estamos usando o sistema de OAuth2 por completo, simplificando esse para um fluxo como: Email + Senha -> Login -> Geração de Token.

## Payloads

Payloads de login para testes do endpoint.

### Payload requisição

```json
{
  "email": "teste@teste.com",
  "password": "12345678"
}
```

### Payload de resposta de Login

```json
{
  "success": true,
  "message": "Login realizado com sucesso",
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIwMTlhMjY2YS0zYWE1LTcyYWQtODk4Yy1kZjFhYmU5MGUzYTYiLCJqdGkiOiJlNmYyNDRkMGU0NDRiMGUzODRiMjRjYmM2YmY2ZmQzNTIzZWRkYjk2YjBmNGY0NmNhZTI1NDFiNWUyYWMzZDMzZGU2YmJhYTcyMWYxNmE5YyIsImlhdCI6MTc2MTcwMzkwNi41MjQ2MTMsIm5iZiI6MTc2MTcwMzkwNi41MjQ2MTgsImV4cCI6MTc3NzQyODcwNi41MTM0MjcsInN1YiI6IjI2MSIsInNjb3BlcyI6W119.N5bAEh62MKvTeCgHiES75yoHawcXmJw35xsJoWIcpKCit0J6m5G73I_Rv19oXKas0u5v28EptKlg1blk3u8agJ8ajDF_V8pcGwnWkenM-AtozFpnSrbxNdxQrUM6CcLIKuY8HlLx6BFlE95r2VHvylfGVtZ3cXdzN5HjtmZiHtKsSWcL7jiUx0MhJruoBw4ceT1myQRFblVlnPvyDka0_yWgiD8i1P3_1-ddU34pE_wvSSVrah2ydI-jB0oNgvlqXRpxkWV_l5bxFg9DE2V479G1urG1RkMH60l68TUTIcn3SKsqAIYjAKTanUG34N-NiDogfGRAAM1p31YAVDY_TQGQOOUfWbXOaSb5XGmHjg6srYqDfGhqTcKLcSJwIRXyfdKhskisoSG_LZGnkrj6r1Hjlt60aYcvqWE-zWCWXwfaveGf2ATVDp5yEUY_zNVtXi5IPaIh68cf5PKh-sXOScOqi-ceo-gEoe9HvCBIv4MHnkSyUz0tYxv2syvVzuNMAzZS9rEaMc17Am4BJykSkYWqKqL_SwUbN60DptWa_cSBWihjSGOJ1g-OueCIlkoxK2FYSVgIhtJ7eOgsL8Lrq6pTdhQKSkiKSPm6GMAXMWuOTnJeovUUrL9UieKas-bSS0OiALC9lp28o9m1X-1tWYsdQX02lbxTdM_8mUzL3js",
  "user": {
    "id": 261,
    "nome": "Teste",
    "email": "teste@teste.com",
    "tipo": "Aluno",
    "criador": null,
    "ultimo_editor": null,
    "status": "Ativo",
    "created_at": "2025-10-28T23:57:11.000000Z",
    "updated_at": "2025-10-28T23:57:11.000000Z"
  }
}
```

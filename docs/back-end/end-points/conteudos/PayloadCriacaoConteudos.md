# Exemplo de Payload de Criação de Conteúdo

Abaixo está um exemplo de envio de dados (formulário ou payload multipart) para criação de um **post** com imagens e metadados associados.

---

## Campos

| **KEY**              | **VALUE**                        | **TYPE** |
|----------------------|----------------------------------|----------|
| `title`              | Meu primeiro post                | Text     |
| `content`            | Este é o conteúdo do meu post.   | Text     |
| `content_type`       | Artigo                           | Text     |
| `content_tag`        | Tecnologia                       | Text     |
| `status`             | Ativo                            | Text     |
| `published_at`       | 2025-10-14                        | Text     |
| `is_moderator_only`  | 1                                | Text     |
| `images[]`           | (selecione arquivo **imagem1.jpg**) | File     |
| `images[]`           | (selecione arquivo **imagem2.jpg**) | File     |
| `images[]`           | (selecione arquivo **imagem3.jpg**) | File     |
| `image_alt_text[]`   | Descrição imagem 1               | Text     |
| `image_alt_text[]`   | Descrição imagem 2               | Text     |
| `image_alt_text[]`   | Descrição imagem 3               | Text     |

---

## Observações

- `images[]` deve ser um **array de arquivos** enviados via `multipart/form-data`.  
- `image_alt_text[]` deve seguir a **mesma ordem** dos arquivos enviados.  
- `is_moderator_only` define se o post é visível apenas para moderadores (`1` = sim, `0` = não).  
- `status` pode ser algo como `Ativo`, `Rascunho`, `Arquivado`, dependendo da lógica do sistema.  
- `published_at` deve estar no formato `YYYY-MM-DD` ou `YYYY-MM-DD HH:MM:SS`.  

---
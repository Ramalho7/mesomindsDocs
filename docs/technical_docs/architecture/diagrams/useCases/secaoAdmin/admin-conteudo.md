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

[Diagrama de caso de uso](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=UMLMesominds.drawio&dark=auto#R%3Cmxfile%20pages%3D%222%22%3E%3Cdiagram%20name%3D%22UserCaseConteudos%22%20id%3D%22xWxxbGBoY6L5D_t_7vkr%22%3E7Vrfc6IwEP5reGxHQPzxqNa2c9dOnXPmWh%2BjpJBrYJ2wVO1ffwGCQLFMr1MFb%2FBF9suSkC%2Ffkl1AMyfe9kaQtXsPNuWa0bG3mnmlGYbeHQzlX4TsEmTQMRPAEcxWThkwZ29UgR2FhsymQcERATiydRFcge%2FTFRYwIgRsim7PwIujrolDS8B8RXgZfWQ2umoWRj%2FDbylz3HRkvacmvCSrF0dA6KvxNMN8jn9Js0fSvtREA5fYsMlB5lQzJwIAkyNvO6E84jalLTnv%2BoPW%2FXUL6uNnTuCLh6G%2BsodXN4tZ57439h8n9CJdhQB3KSHUlvwoEwS64IBP%2BDRDx%2FGkadRtR1qZzx3AWoK6BP9QxJ1abBIiSMhFj6tWumX4lDteRF1dmu9%2BqvFqqwaKjV3OmFHBPIpUpJiPYveUN5KOrdTMuoqtfV%2B%2BPYqUJE0ffJog14xz1V5mWpEfQChWtIpeJWgiHIoVflbiF1GfG0Ct4w0FOUuxkw6CcoLstShdoiLA2ftlKpAHSgj%2FIgqzFUUDRKHrzVJFr1VFE1TRsHtFv1VFE1TRbZQqovNbVdSuCqNhO0jS7yvhoRppZHvML0lFZsrr6DD0%2BGiFINdh%2FEoFMpm035El5TMIGDLwpcsSEMHLOYw4c6IGjDSTFweEyJlPJ%2FsyonIJou7otpIz1dpVGbQqf%2FZ1zSYrJkwFubk6otc5VuiVSJ7JtSXPIDwSlSU0AMm5HZRZ3zCPk1inG5chna9JLMKNrPuKVH4Da7pVpE0%2FQJuVJkB53qz%2BsYizSsRNBCMiKT2RahNTG49sKBMn%2B5bF6pd4q1zBz5M5tC6tAp29Mpu6cUCFg2ORqR%2BIdQwJZ28xowESDM%2BCSbNfO5XdEpVTm2FZmedAp16%2FMstx%2Fot6ICd1jnzWH%2BlGOdJ%2FsyAL9fO7eXZPGfLjwKDL4O3Hz4vrFy4jezR3b9NEqZ7sOU2Dvzt71o%2BRPb%2FLbL%2BWTqsHG59Mp0%2BQPR8URa0lVSuK6kynLlEMW1E0UhTdOkVR70udVhUf%2BVknEkXVRebStOhdriA2iJJazuoBTN8sPkqwBlYpfTvWE5iD4ddto%2B%2BU0dc%2Fi43aakXRRFGc6pZ8UBO1vlBtNVF78lZ1lbl9%2BmH9P27T%2BuBoL0qkmX1WFbflvl0zp38B%3C%2Fdiagram%3E%3Cdiagram%20id%3D%22Lb9cgC4L9QWGNdLZA6B5%22%20name%3D%22useCaseAtividades%22%3E7ZrfU%2BIwEMf%2FGh69IS2F8oiIOjfeyOiMdz5GGmmctOmkWwH%2F%2Bktp%2BosIngeS4tQXm%2B0mJd98ktndtmOPg%2BWVwJH%2Fi3uEdayut%2BzYFx3LQj13KP%2BlllVmcbt2ZpgL6imn0nBP34gydpU1oR6Ja47AOQMa1Y0zHoZkBjUbFoIv6m7PnNWfGuE50Qz3M8x062%2Fqga9mYQ1K%2BzWhcz9%2FMuqrCQc4d1YziX3s8UXFZE869lhwDtlVsBwTloqX65L1u9xyt%2FhhgoTwLx2uZ%2F3hw8vZ5O4nuvVvHsM4uRqcqVFiWOUTJp6cv2pyAT6f8xCzSWk9FzwJPZKO2pWt0ueG80gakTS%2BEICVWkycAJcmHwKm7pIlhT%2BV68d0qB%2F2xp%2B6ebFUD1o3VpXGlAgaECAit4UgVn%2BqjWxgJ2%2BWQ61bxVihN0pJkc2QhySzXFLG1P1MolSXrcrnMvJEzMgOufuKYCzmBHb4uQUfcmMRLmcpVrKfIAwDfa3%2FDqwInxd%2BJQTyQnHwCSaslokmMjE0yYTdMtFEJhAyCUWvhaKRUHRNQuG0UDQSCsskFOpXvmKWqCeNvICGGioyRo7SyyRgoxlwuQ7nr0QAlfH4DX4ibMpjCpSH0uWJA%2FCg4jBidJ7egJSZKhw8AUZDMi4yhHIJ0r5kuXsRdM3yDkMV6qvUBvVVpL8oEwVbmfxKjpC7HVzlgabyVC4ufuYiwGlGQmIuRfdiXfYFDRheg7rwKZD7CK%2BhW8icrq7lAWSznLpsg3dUQ31dNsf5Kt1cTbexoFikj5Jbg3rYI%2FqhxphMQQ%2Bl2Pbl3Crj0K2p2NNVRNY78LlfJeJQ3%2BKQYEbf1kLGgCHRwWuairZjWsa87lHRceJRODEakXEcEdJ0vCMBlzM%2FKSHN72tkaUI%2B0Ljc2aejZc%2F85jaaRudR7qGDY9TY4BipiKjZ9TZkNI8%2BChXoBJnYO41ed5XTwquKQ8RpCHFl5GlqKM8sx96MSJwqYB%2F654fXNv%2FeYLCf%2F8DdAD6bYYl%2FIdUeO8JoEaE9J5tZg86TwpaKhlGxd23pP0%2FKeh3h45Oy7u%2F0u50vP8msNuJrKLNG35wgvVSXfjohsMeFBsxJFUWdjaKobTta0nXUoihy2x14zB1YfKXT7Jxr2FLRSCoMZV29jVc5vd1Z0aa%2F5Rwjlui2zDaTWTPxr%2FNJZh0T8e%2F3r22dKLNG49984Er8ext9x%2FC3eL9w%2BPBXNsuPh7P9Wn6CbU%2F%2BAg%3D%3D%3C%2Fdiagram%3E%3Cdiagram%20id%3D%22rpkKe8qRKb0YcXmYBBNw%22%20name%3D%22useCaseQuest%C3%B5es%22%3E7VrbcpswEP0aHtuxAGH86DhOOp1k6mmmbfrUUYxilBGICuHb11cYcbNip6kv4A55CXu0EujoSNndyLBGwfKWo8i%2FZx6mhtnzloZ1bZgm6Nmm%2FJUiqwyBjgJmnHjKqQQeyBrnPRWaEA%2FHNUfBGBUkqoNTFoZ4KmoY4pwt6m7PjNbfGqEZ1oCHKaI6%2BoN4ws9Q1%2ByX%2BCdMZn7%2BZuAMspYA5c5qJrGPPLaoQNbYsEacMZE9BcsRpil5OS9Zv5sdrcWHcRyKv%2BmwRt%2BuR2x9P7914a%2Bh%2B%2FI5Gd99UKPEYpVPGHty%2FspkXPhsxkJExyV6xVkSejgdtSet0ueOsUiCQIIvWIiVWkyUCCYhXwRUteIlEY%2BV55%2FpUB%2BtrR%2FVeL1UL9oYq4oxwZwEWGCeY6Hgq8eqkQ0Mc7McamMVY4XeMFWKNEMW4gy5IZSq9oyilJedzOc0soRP8R66HaVgxGdY7PFzC33IjYWZnCVfyX4cUyTIvP4dSCl8VviVIpAPSgfv0ITZaaKNmhg0qQmr00QbNQFAk6KwO1G0UhS9JkUBO1G0UhRmk6JQXzlHNFFvGnoBCTWpyBg5Sh%2BTgA6ngsl1uJpjLoiMx%2B%2FQE6YTFhNBWChdnpgQLKg4DCmZpQ0i1UxVHCwRlIR4VGQI5RKkffFy%2FyLonOUdBirUV6mNCVWkvygTBUtBfiVHcHonYrmvsTyRi4ueGQ9QmpHgmEnSvVinfUECijZCXfhE4IcIbUS3kDldncsj0GbCOm3AeYU24Oi8QXgq4lyNuBEniEvod4JjYYws4wpinTc5tMxDj0Xb7jXdyeXArVFp60wC8xUFuqcicqDvc5EgStYbMmOBRNJ%2BFq1X9vF5acyLHxUexx4RF6hI0LgkAdC4%2FIoDJmd%2BcWQ2v7%2BBqZH5ncTlDr8sPu3mN3qjeXUe9h47WgatjZaBCpHaXYADjSbWZ1EFuEBNHJxXb7rKaaFVxSFiJBRxZeRJCpRnFrS2Di0bVgX2pr%2FV7%2B31t%2Fv9w%2Fwdd0vw2QxL%2BRdUHbAjGq0qdOdkO4vSeZLYqaJlqji42PSPJ2W9sPD2SVn3d2DPOP1Jphdp0n%2Bac%2BQxrqn5osphcKscZptQi67PWg4Dbnc8nPN4KO5ntDu4HnSqaKUqGgqv7a0ivrU%2F%2FN32t%2Bwz%2FNEorhB1mm2ZZpsJdOA7NQsbCHRMve76Jfof45ziquLx4xxplvcDs4Upb1la4z8%3D%3C%2Fdiagram%3E%3Cdiagram%20id%3D%227CBdo273KRjZ22n2PwUX%22%20name%3D%22P%C3%A1gina-4%22%3E7ZlNb5tAEIZ%2FjY%2BJWIg%2FODqOkx5SxWqkJj1VGzMxWy0MXYbYzq%2FvYhYD2ThqJcfgyr6YefcDePYdYKDnTaLVjeJJ%2BBUDkD3XCVY976rnumzoDfVfrqwLxS%2BFhRKB6VQJ9%2BIVjOgYNRMBpI2OhChJJE1xjnEMc2poXClcNrs9o2zuNeELsIT7OZe2%2BiACCgt15A4r%2FQuIRVjumQ38oiXiZWdzJmnIA1zWJG%2Fa8yYKkYqtaDUBmcMruRTjrne0bg9MQUx%2FM2D5cHY3PZviDPrec%2FxztRY30zO3bw6O1uUZQ6ABmBAVhbjAmMtppV4qzOIA8mkdHVV9bhETLTIt%2FgKitVlNnhFqKaRImlZYCXqsbf%2FIpzr33vxM49XK7GgTrGvBDJSIgECVWkxq%2FVgPion7ZVhNtYm2c8XBOLeKDmOMoVCuhZSmvUCUc9mJ3kgpZmoOH%2FAeGAtztQD6oN9oaxCdWYD6LNVaj1MgOYmX5nFwY%2FHFtl%2FlAr1hjPAvphicTNFFUzCnVVcMT67opCtYq67wT67ooiv8Nk3hOSdTdNEUzG3VFezkii66wm3VFeYoX7jMzJ7GQSRiyyq6fEryzSyS4zmhXofLF1AkdKl2y59AzjAVJDDWXZ6QCKNah7EUi7yBcs%2FUzYEZSRHDZFs8VkuQj4XVx4tgMysH%2BOa2aKrekSmzllUJWV4jw1r1OHA%2BCfLQgjzTa8ufUUU8r1UhRc08SG3qSxFJvvHpMhQE9wnfeG6pq%2F0myj1Qc%2FtNat471NjgHWwl3r1zG1ncJjzgKSmutJylWW%2Fi9cZMCbQvbVKKJN0XuN2rupOmP2rAvHAsmMx9x4Ojz%2FKgbyc6ZVyK1w3LlDhltv%2B6RtHrt42xfDFW4zgNBG0givgZ02MzJmvdmYxZSL9BhPrMj41l%2B1lePGI2WH4XaZXnR4XzovVsd22clxJ%2FZ3B8MPsX%2Frl9Qz8wTs%2FGdLgSpKwl9l2CsM6WIMw8eHa8MmX283H%2BJUvxQNcZR12I9N8UIp5jX9EOWom4o1MGHjIDtx9Nu52Brv0Idpf8jwn4eW8CdFh9TN601T7Je9M%2F%3C%2Fdiagram%3E%3C%2Fmxfile%3E)


# Exercicio 03 - CRUD HTTP com Flutter

Aplicacao Flutter simples que consome o recurso `/posts` da API
[JSONPlaceholder](https://jsonplaceholder.typicode.com/).

## Operacoes implementadas

- `GET /posts/1`: busca um post pelo ID;
- `GET /posts?_limit=10`: recupera uma lista de posts;
- `POST /posts`: cria um post;
- `PUT /posts/:id`: atualiza um post;
- `DELETE /posts/:id`: exclui um post.

A lista inicial e carregada uma unica vez em `initState()` e armazenada em
`_postsFuture`. Nenhuma requisicao e iniciada pelo metodo `build()`.

O JSONPlaceholder e uma API de testes: POST, PUT e DELETE retornam respostas de
sucesso, mas nao persistem alteracoes no servidor. Por isso, a interface tambem
atualiza sua lista local depois dessas operacoes.

## Estrutura

```text
lib/
|-- main.dart
|-- models/post.dart
|-- screens/posts_page.dart
`-- services/post_service.dart
```

## Executar

```bash
flutter pub get
flutter run -d chrome
```

## Validar

```bash
flutter analyze
flutter test
```


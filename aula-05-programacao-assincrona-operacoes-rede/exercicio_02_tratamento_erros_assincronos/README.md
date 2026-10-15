# Exercicio 02 - Tratamento de erros em operacoes assincronas

Resolucao traduzida da atividade proposta no tutorial oficial do Dart:
[Practice handling errors](https://dart.dev/libraries/async/async-await#exercise-practice-handling-errors).

## Enunciado traduzido

Este exercicio pratica o tratamento de erros em codigo assincrono. Para
simular uma operacao assincrona, o codigo chama `fetchNewUsername()`, uma
funcao fornecida que pode levar algum tempo e lancar uma excecao.

Implemente a funcao assincrona `changeUsername()` para:

- chamar `fetchNewUsername()` e retornar o resultado obtido;
- capturar qualquer erro ocorrido;
- converter o erro para `String` e retorna-lo.

A implementacao usa `async`, `await` e um bloco `try-catch`. Neste exemplo,
`fetchNewUsername()` lanca `UserError`, e `changeUsername()` captura a excecao
e retorna a mensagem original do teste: `New username is invalid` (o novo nome
de usuario e invalido).

## Executar

```bash
dart run
```

Saida esperada:

```text
Testando...
New username is invalid
Sucesso. Todos os testes passaram!
```

## Testar

```bash
dart test
```


# Exercicio 01 - Pratica usando async e await

Resolucao da atividade proposta no tutorial oficial do Dart:
[Practice using async and await](https://dart.dev/libraries/async/async-await#exercise-practice-using-async-and-await).

O exercicio simula duas operacoes assincronas:

- consulta da funcao do usuario;
- consulta da quantidade de logins.

As funcoes `reportUserRole()` e `reportLogins()` aguardam os respectivos
`Future`s e formatam os valores obtidos.

## Executar

```bash
dart run
```

Saida esperada:

```text
Testing...
User role: administrator
Total number of logins: 42
Success. All tests passed!
```

## Testar

```bash
dart test
```


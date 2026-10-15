import 'package:exercicio_02_tratamento_erros_assincronos/tratamento_erros_assincronos.dart';

Future<void> main() async {
  print('Testando...');

  final result = await changeUsername();
  print(result);

  if (result == UserError().toString()) {
    print('Sucesso. Todos os testes passaram!');
  } else {
    print('Falha no teste! Verifique o valor retornado.');
  }
}

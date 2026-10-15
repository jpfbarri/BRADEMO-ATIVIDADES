import 'package:exercicio_02_tratamento_erros_assincronos/tratamento_erros_assincronos.dart';
import 'package:test/test.dart';

void main() {
  test('changeUsername captura e converte o erro assincrono', () async {
    final result = await changeUsername();

    expect(result, 'New username is invalid');
  });

  test('fetchNewUsername continua lancando UserError', () {
    expect(fetchNewUsername(), throwsA(isA<UserError>()));
  });
}

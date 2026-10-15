import 'package:exercicio_01_async_await/async_await.dart';
import 'package:test/test.dart';

void main() {
  test('reportUserRole retorna a funcao obtida de forma assincrona', () async {
    expect(await reportUserRole(), 'User role: administrator');
  });

  test('reportLogins retorna a quantidade obtida de forma assincrona',
      () async {
    expect(await reportLogins(), 'Total number of logins: 42');
  });
}

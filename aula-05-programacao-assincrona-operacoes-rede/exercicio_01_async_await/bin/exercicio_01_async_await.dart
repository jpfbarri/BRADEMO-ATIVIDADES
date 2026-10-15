import 'package:exercicio_01_async_await/async_await.dart';

Future<void> main() async {
  print('Testing...');

  final roleMessage = await reportUserRole();
  final loginsMessage = await reportLogins();

  print(roleMessage);
  print(loginsMessage);

  const expectedRole = 'User role: administrator';
  const expectedLogins = 'Total number of logins: 42';

  if (roleMessage == expectedRole && loginsMessage == expectedLogins) {
    print('Success. All tests passed!');
  } else {
    print('Test failed!');
  }
}

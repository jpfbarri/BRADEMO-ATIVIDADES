const role = 'administrator';
const logins = 42;
const halfSecond = Duration(milliseconds: 500);

Future<String> reportUserRole() async {
  final userRole = await fetchRole();
  return 'User role: $userRole';
}

Future<String> reportLogins() async {
  final loginAmount = await fetchLoginAmount();
  return 'Total number of logins: $loginAmount';
}

Future<String> fetchRole() => Future.delayed(halfSecond, () => role);

Future<int> fetchLoginAmount() => Future.delayed(halfSecond, () => logins);

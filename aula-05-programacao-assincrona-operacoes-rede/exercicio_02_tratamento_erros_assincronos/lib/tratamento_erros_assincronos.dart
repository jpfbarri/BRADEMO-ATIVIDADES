const halfSecond = Duration(milliseconds: 500);

Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (error) {
    return error.toString();
  }
}

Future<String> fetchNewUsername() =>
    Future.delayed(halfSecond, () => throw UserError());

class UserError implements Exception {
  @override
  String toString() => 'New username is invalid';
}

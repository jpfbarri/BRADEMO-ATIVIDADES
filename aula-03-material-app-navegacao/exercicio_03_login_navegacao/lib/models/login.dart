/// Guarda o usuario e a senha digitados na tela de login.
class Login {
  final String usuario;
  final String senha;

  const Login({required this.usuario, required this.senha});

  /// O login so e valido com "admin" e "1234".
  bool get valido => usuario == 'admin' && senha == '1234';
}

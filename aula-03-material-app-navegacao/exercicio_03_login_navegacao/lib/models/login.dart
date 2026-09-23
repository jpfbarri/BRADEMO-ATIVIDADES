class Login {
  final String usuario;
  final String senha;

  const Login({required this.usuario, required this.senha});

  bool get valido => usuario == 'admin' && senha == '1234';
}

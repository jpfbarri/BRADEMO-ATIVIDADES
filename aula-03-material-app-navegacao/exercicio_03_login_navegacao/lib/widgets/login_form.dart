import 'package:flutter/material.dart';

import '../models/login.dart';

class LoginForm extends StatefulWidget {
  final void Function(Login login) aoEnviar;

  const LoginForm({super.key, required this.aoEnviar});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usuario = TextEditingController();
  final _senha = TextEditingController();

  @override
  void dispose() {
    _usuario.dispose();
    _senha.dispose();
    super.dispose();
  }

  void _enviar() {
    widget.aoEnviar(Login(usuario: _usuario.text, senha: _senha.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usuario,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _senha,
          obscureText: true,
          onSubmitted: (_) => _enviar(),
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ),
        const SizedBox(height: 12),
        FilledButton(
          onPressed: _enviar,
          style: FilledButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Login'),
        ),
      ],
    );
  }
}

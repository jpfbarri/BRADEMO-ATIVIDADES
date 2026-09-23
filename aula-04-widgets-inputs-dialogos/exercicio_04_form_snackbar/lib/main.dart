import 'package:flutter/material.dart';

void main() => runApp(const AppForm());

class AppForm extends StatelessWidget {
  const AppForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Form Demo',
      debugShowCheckedModeBanner: false,
      home: TelaDoFormulario(),
    );
  }
}

class TelaDoFormulario extends StatefulWidget {
  const TelaDoFormulario({super.key});

  @override
  State<TelaDoFormulario> createState() => _TelaDoFormularioState();
}

class _TelaDoFormularioState extends State<TelaDoFormulario> {
  final _nome = TextEditingController();
  final _telefone = TextEditingController();
  final _nascimento = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    _telefone.dispose();
    _nascimento.dispose();
    super.dispose();
  }

  void _enviar() {
    final dados = 'Name: ${_nome.text}\n'
        'Phone: ${_telefone.text}\n'
        'Dob: ${_nascimento.text}';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(dados)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Flutter Form Demo'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CampoComIcone(
                icone: Icons.person,
                rotulo: 'Name',
                controlador: _nome,
              ),
              CampoComIcone(
                icone: Icons.phone,
                rotulo: 'Phone',
                controlador: _telefone,
                teclado: TextInputType.phone,
              ),
              CampoComIcone(
                icone: Icons.calendar_today,
                rotulo: 'Dob',
                controlador: _nascimento,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _enviar,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CampoComIcone extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final TextEditingController controlador;
  final TextInputType? teclado;

  const CampoComIcone({
    super.key,
    required this.icone,
    required this.rotulo,
    required this.controlador,
    this.teclado,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icone, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: controlador,
              keyboardType: teclado,
              decoration: InputDecoration(hintText: rotulo),
            ),
          ),
        ],
      ),
    );
  }
}

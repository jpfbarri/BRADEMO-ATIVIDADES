import 'package:flutter/material.dart';

void main() => runApp(const AppBottomBar());

const abas = ['This', 'Is', 'A', 'Bottom', 'Bar'];

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BottomAppBar with FAB',
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _abaSelecionada = 2;
  bool _opcoesAbertas = false;

  void _trocarAba(int i) {
    setState(() {
      _abaSelecionada = i;
      _opcoesAbertas = false;
    });
  }

  void _alternarOpcoes() {
    setState(() => _opcoesAbertas = !_opcoesAbertas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('BottomAppBar with FAB'),
      ),
      body: Center(
        child: Text(
          'TAB: ${_abaSelecionada + 1}',
          style: const TextStyle(fontSize: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_opcoesAbertas) ...[
            const OpcaoExtra(icone: Icons.chat, nome: 'chat'),
            const SizedBox(height: 12),
            const OpcaoExtra(icone: Icons.mail, nome: 'mail'),
            const SizedBox(height: 12),
            const OpcaoExtra(icone: Icons.phone, nome: 'phone'),
            const SizedBox(height: 12),
          ],
          FloatingActionButton(
            onPressed: _alternarOpcoes,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            child: AnimatedRotation(
              turns: _opcoesAbertas ? 0.125 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < abas.length; i++)
              ItemDaBarra(
                nome: abas[i],
                selecionado: i == _abaSelecionada,
                mostrarIcone: i != abas.length ~/ 2,
                aoTocar: () => _trocarAba(i),
              ),
          ],
        ),
      ),
    );
  }
}

class OpcaoExtra extends StatelessWidget {
  final IconData icone;
  final String nome;

  const OpcaoExtra({super.key, required this.icone, required this.nome});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: nome,
      onPressed: () {},
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      child: Icon(icone),
    );
  }
}

class ItemDaBarra extends StatelessWidget {
  final String nome;
  final bool selecionado;
  final bool mostrarIcone;
  final VoidCallback aoTocar;

  const ItemDaBarra({
    super.key,
    required this.nome,
    required this.selecionado,
    required this.mostrarIcone,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado ? Colors.red : Colors.grey;

    return InkWell(
      onTap: aoTocar,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (mostrarIcone) Icon(Icons.circle, size: 16, color: cor),
            if (mostrarIcone) const SizedBox(height: 2),
            Text(nome, style: TextStyle(fontSize: 11, color: cor)),
          ],
        ),
      ),
    );
  }
}

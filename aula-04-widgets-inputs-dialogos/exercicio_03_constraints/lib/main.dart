import 'package:flutter/material.dart';

const red = Color(0xFFEF5350);
const green = Color(0xFF66BB6A);
const blue = Color(0xFF42A5F5);
const big = TextStyle(fontSize: 30);

void main() => runApp(const AppConstraints());

class AppConstraints extends StatelessWidget {
  const AppConstraints({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Constraints',
      debugShowCheckedModeBanner: false,
      home: ListaDeExemplos(),
    );
  }
}

class Exemplo {
  final int numero;
  final bool temScaffold;
  final WidgetBuilder construir;

  const Exemplo({
    required this.numero,
    required this.temScaffold,
    required this.construir,
  });
}

final List<Exemplo> exemplos = [
  Exemplo(
    numero: 1,
    temScaffold: false,
    construir: (context) => Container(color: red),
  ),
  Exemplo(
    numero: 2,
    temScaffold: false,
    construir: (context) => Container(width: 100, height: 100, color: red),
  ),
  Exemplo(
    numero: 3,
    temScaffold: false,
    construir: (context) => Center(child: Container(width: 100, height: 100, color: red)),
  ),
  Exemplo(
    numero: 4,
    temScaffold: false,
    construir: (context) => Align(
            alignment: Alignment.bottomRight,
            child: Container(width: 100, height: 100, color: red),
          ),
  ),
  Exemplo(
    numero: 5,
    temScaffold: false,
    construir: (context) => Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: red,
            ),
          ),
  ),
  Exemplo(
    numero: 6,
    temScaffold: false,
    construir: (context) => Center(child: Container(color: red)),
  ),
  Exemplo(
    numero: 7,
    temScaffold: false,
    construir: (context) => Center(
            child: Container(
              color: red,
              child: Container(color: green, width: 30, height: 30),
            ),
          ),
  ),
  Exemplo(
    numero: 8,
    temScaffold: false,
    construir: (context) => Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: red,
              child: Container(color: green, width: 30, height: 30),
            ),
          ),
  ),
  Exemplo(
    numero: 9,
    temScaffold: false,
    construir: (context) => ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: red, width: 10, height: 10),
          ),
  ),
  Exemplo(
    numero: 10,
    temScaffold: false,
    construir: (context) => Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: red, width: 10, height: 10),
            ),
          ),
  ),
  Exemplo(
    numero: 11,
    temScaffold: false,
    construir: (context) => Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: red, width: 1000, height: 1000),
            ),
          ),
  ),
  Exemplo(
    numero: 12,
    temScaffold: false,
    construir: (context) => Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: red, width: 100, height: 100),
            ),
          ),
  ),
  Exemplo(
    numero: 13,
    temScaffold: false,
    construir: (context) => UnconstrainedBox(
            child: Container(color: red, width: 20, height: 50),
          ),
  ),
  Exemplo(
    numero: 14,
    temScaffold: false,
    construir: (context) => UnconstrainedBox(
            child: Container(color: red, width: 4000, height: 50),
          ),
  ),
  Exemplo(
    numero: 15,
    temScaffold: false,
    construir: (context) => OverflowBox(
            minWidth: 0,
            minHeight: 0,
            maxWidth: double.infinity,
            maxHeight: double.infinity,
            child: Container(color: red, width: 4000, height: 50),
          ),
  ),
  Exemplo(
    numero: 16,
    temScaffold: false,
    construir: (context) => UnconstrainedBox(
            child: Container(color: Colors.red, width: double.infinity, height: 100),
          ),
  ),
  Exemplo(
    numero: 17,
    temScaffold: false,
    construir: (context) => UnconstrainedBox(
            child: LimitedBox(
              maxWidth: 100,
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 100,
              ),
            ),
          ),
  ),
  Exemplo(
    numero: 18,
    temScaffold: false,
    construir: (context) => const FittedBox(child: Text('Some Example Text.')),
  ),
  Exemplo(
    numero: 19,
    temScaffold: false,
    construir: (context) => const Center(child: FittedBox(child: Text('Some Example Text.'))),
  ),
  Exemplo(
    numero: 20,
    temScaffold: false,
    construir: (context) => const Center(
            child: FittedBox(
              child: Text(
                'This is some very very very large text that is too big to fit a regular screen in a single line.',
              ),
            ),
          ),
  ),
  Exemplo(
    numero: 21,
    temScaffold: false,
    construir: (context) => const Center(
            child: Text(
              'This is some very very very large text that is too big to fit a regular screen in a single line.',
            ),
          ),
  ),
  Exemplo(
    numero: 22,
    temScaffold: false,
    construir: (context) => FittedBox(
            child: Container(height: 20, width: double.infinity, color: Colors.red),
          ),
  ),
  Exemplo(
    numero: 23,
    temScaffold: false,
    construir: (context) => Row(
            children: [
              Container(
                color: red,
                child: const Text('Hello!', style: big),
              ),
              Container(
                color: green,
                child: const Text('Goodbye!', style: big),
              ),
            ],
          ),
  ),
  Exemplo(
    numero: 24,
    temScaffold: false,
    construir: (context) => Row(
            children: [
              Container(
                color: red,
                child: const Text(
                  'This is a very long text that '
                  'won\'t fit the line.',
                  style: big,
                ),
              ),
              Container(
                color: green,
                child: const Text('Goodbye!', style: big),
              ),
            ],
          ),
  ),
  Exemplo(
    numero: 25,
    temScaffold: false,
    construir: (context) => Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    color: red,
                    child: const Text(
                      'This is a very long text that won\'t fit the line.',
                      style: big,
                    ),
                  ),
                ),
              ),
              Container(
                color: green,
                child: const Text('Goodbye!', style: big),
              ),
            ],
          ),
  ),
  Exemplo(
    numero: 26,
    temScaffold: false,
    construir: (context) => Row(
            children: [
              Expanded(
                child: Container(
                  color: red,
                  child: const Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: green,
                  child: const Text('Goodbye!', style: big),
                ),
              ),
            ],
          ),
  ),
  Exemplo(
    numero: 27,
    temScaffold: false,
    construir: (context) => Row(
            children: [
              Flexible(
                child: Container(
                  color: red,
                  child: const Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: green,
                  child: const Text('Goodbye!', style: big),
                ),
              ),
            ],
          ),
  ),
  Exemplo(
    numero: 28,
    temScaffold: true,
    construir: (context) => Scaffold(
            body: Container(
              color: blue,
              child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
            ),
          ),
  ),
  Exemplo(
    numero: 29,
    temScaffold: true,
    construir: (context) => Scaffold(
            body: SizedBox.expand(
              child: Container(
                color: blue,
                child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
              ),
            ),
          ),
  ),
];

class ListaDeExemplos extends StatelessWidget {
  const ListaDeExemplos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Flutter - Restrições de layout'),
      ),
      body: ListView.separated(
        itemCount: exemplos.length,
        separatorBuilder: (context, i) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final exemplo = exemplos[i];
          return ListTile(
            leading: CircleAvatar(child: Text('${exemplo.numero}')),
            title: Text('Exemplo ${exemplo.numero}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaDoExemplo(exemplo: exemplo)),
            ),
          );
        },
      ),
    );
  }
}

class TelaDoExemplo extends StatelessWidget {
  final Exemplo exemplo;

  const TelaDoExemplo({super.key, required this.exemplo});

  @override
  Widget build(BuildContext context) {
    if (exemplo.temScaffold) {
      return exemplo.construir(context);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Exemplo ${exemplo.numero}'),
      ),
      body: exemplo.construir(context),
    );
  }
}

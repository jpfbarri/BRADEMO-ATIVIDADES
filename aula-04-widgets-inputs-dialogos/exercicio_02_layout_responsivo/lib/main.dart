import 'package:flutter/material.dart';

void main() => runApp(const AppResponsivo());

const pratos = ['Massas', 'Pizzas', 'Saladas', 'Sobremesas', 'Bebidas'];

class AppResponsivo extends StatelessWidget {
  const AppResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layouts',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Responsive Layouts',
            style: TextStyle(fontSize: 14),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final telaLarga = constraints.maxWidth > 600;

            if (telaLarga) {
              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Cabecalho(empilhado: false)),
                  Expanded(child: ListaDePratos()),
                ],
              );
            }

            return const Column(
              children: [
                Cabecalho(empilhado: true),
                Expanded(child: ListaDePratos()),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Cabecalho extends StatelessWidget {
  final bool empilhado;

  const Cabecalho({super.key, required this.empilhado});

  @override
  Widget build(BuildContext context) {
    final Widget botoes = empilhado
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Botao('CARDÁPIO'), Botao('PEDIDOS')],
          )
        : const Column(
            children: [
              Botao('CARDÁPIO'),
              SizedBox(height: 12),
              Botao('PEDIDOS'),
            ],
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Sabor & Cia',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(height: 16),
          botoes,
        ],
      ),
    );
  }
}

class Botao extends StatelessWidget {
  final String texto;

  const Botao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(),
        ),
        child: Text(texto, style: const TextStyle(fontSize: 11)),
      ),
    );
  }
}

class ListaDePratos extends StatelessWidget {
  const ListaDePratos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pratos.length,
      separatorBuilder: (context, i) =>
          const Divider(color: Colors.white24, height: 1),
      itemBuilder: (context, i) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          pratos[i],
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

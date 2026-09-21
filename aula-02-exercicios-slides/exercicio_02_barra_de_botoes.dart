// Exercício 2 - Barra de botões CALL / ROUTE / SHARE com Row, Column, Icon e Text.

import 'package:flutter/material.dart';

void main() {
  runApp(const AppExercicio2());
}

class AppExercicio2 extends StatelessWidget {
  const AppExercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Barra de Botões',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BarraDeBotoes(),
        ),
      ),
    );
  }
}

class BarraDeBotoes extends StatelessWidget {
  const BarraDeBotoes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Botao(icone: Icons.call, rotulo: 'CALL'),
        Botao(icone: Icons.near_me, rotulo: 'ROUTE'),
        Botao(icone: Icons.share, rotulo: 'SHARE'),
      ],
    );
  }
}

class Botao extends StatelessWidget {
  final IconData icone;
  final String rotulo;

  const Botao({super.key, required this.icone, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    const Color corRoxa = Color(0xFF5C4EE5);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: corRoxa, size: 48),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            rotulo,
            style: const TextStyle(
              color: corRoxa,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}

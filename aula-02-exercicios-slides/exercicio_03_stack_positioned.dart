// Exercício 3 - Containers coloridos sobrepostos com Stack e Positioned.

import 'package:flutter/material.dart';

void main() {
  runApp(const AppExercicio3());
}

class AppExercicio3 extends StatelessWidget {
  const AppExercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack & Positioned Widget',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Stack & Positioned Widget'),
        ),
        body: const Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: CaixaColorida(
                cor: Color(0xFF66BB6A),
                rotulo: 'Green',
                largura: 170,
                altura: 180,
              ),
            ),
            Positioned(
              top: 40,
              left: 40,
              child: CaixaColorida(
                cor: Color(0xFFEF5350),
                rotulo: 'Red',
                largura: 170,
                altura: 180,
              ),
            ),
            Positioned(
              top: 70,
              left: 70,
              child: CaixaColorida(
                cor: Color(0xFFAB47BC),
                rotulo: 'Purple',
                largura: 180,
                altura: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaixaColorida extends StatelessWidget {
  final Color cor;
  final String rotulo;
  final double largura;
  final double altura;

  const CaixaColorida({
    super.key,
    required this.cor,
    required this.rotulo,
    required this.largura,
    required this.altura,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      height: altura,
      color: cor,
      padding: const EdgeInsets.all(6),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          rotulo,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}

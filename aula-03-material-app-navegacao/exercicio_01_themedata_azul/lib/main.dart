// Exercício 1 - ThemeData com cor de background azul no MaterialApp.

import 'package:flutter/material.dart';

void main() => runApp(const AppExercicio1());

class AppExercicio1 extends StatelessWidget {
  const AppExercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThemeData',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.lightBlue,
        scaffoldBackgroundColor: const Color(0xFFE8E8E8),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('ThemeData')),
        body: const Center(child: CaixaDoTema()),
      ),
    );
  }
}

/// Nao tem cor propria: pega a cor de background do ThemeData mais proximo.
class CaixaDoTema extends StatelessWidget {
  const CaixaDoTema({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Widget', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Container(
          width: 150,
          height: 105,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border.all(color: Colors.orange),
          ),
        ),
      ],
    );
  }
}

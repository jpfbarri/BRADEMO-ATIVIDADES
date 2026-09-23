// Exercício 2 - Um segundo ThemeData sobrescreve o inicial com background amarelo.

import 'package:flutter/material.dart';

void main() => runApp(const AppExercicio2());

class AppExercicio2 extends StatelessWidget {
  const AppExercicio2({super.key});

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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CaixaDoTema(),
              const SizedBox(width: 40),
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color(0xFFBDBDBD),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('ThemeData (Sobrescreve)',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: const Color(0xFFFFE082),
                      ),
                      child: const CaixaDoTema(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

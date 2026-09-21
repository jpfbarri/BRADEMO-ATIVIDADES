// Exercício 1 - Tela "Flutter is Fun!" com Container, Colors, Icon e Text.

import 'package:flutter/material.dart';

void main() {
  runApp(const AppExercicio1());
}

class AppExercicio1 extends StatelessWidget {
  const AppExercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter is Fun!',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          title: const Text(
            'Flutter is Fun!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE0E0E0),
                Color(0xFFFAFAFA),
                Color(0xFFBDBDBD),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 100, left: 60),
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(6),
              color: Colors.red,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Mom',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.thumb_up, size: 10, color: Colors.amber),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

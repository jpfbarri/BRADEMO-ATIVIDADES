// Exercício 5 - Tutorial de layout do Flutter (Oeschinen Lake Campground).
// https://docs.flutter.dev/ui/layout/tutorial

import 'package:flutter/material.dart';

void main() {
  runApp(const AppExercicio5());
}

class AppExercicio5 extends StatelessWidget {
  const AppExercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    const Color corPrimaria = Colors.blue;

    return MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Flutter layout demo',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: ListView(
          children: const [
            ImagemDoLago(),
            SecaoTitulo(),
            SecaoBotoes(cor: corPrimaria),
            SecaoTexto(),
          ],
        ),
      ),
    );
  }
}

class ImagemDoLago extends StatelessWidget {
  const ImagemDoLago({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class SecaoTitulo extends StatelessWidget {
  const SecaoTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );
  }
}

class SecaoBotoes extends StatelessWidget {
  final Color cor;

  const SecaoBotoes({super.key, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _botao(Icons.call, 'CALL'),
        _botao(Icons.near_me, 'ROUTE'),
        _botao(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _botao(IconData icone, String rotulo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: cor),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            rotulo,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: cor,
            ),
          ),
        ),
      ],
    );
  }
}

class SecaoTexto extends StatelessWidget {
  const SecaoTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}

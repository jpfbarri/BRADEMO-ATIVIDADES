import 'package:flutter/material.dart';

void main() => runApp(const AppGridView());

class Lugar {
  final String titulo;
  final String subtitulo;
  final String imagem;

  const Lugar(this.titulo, this.subtitulo, this.imagem);
}

const lugares = [
  Lugar('Café', 'Com mel', 'https://picsum.photos/id/312/400/400'),
  Lugar('Chá', 'Gengibre e limão', 'https://picsum.photos/id/326/400/400'),
  Lugar('Cappuccino', 'Na cafeteria', 'https://picsum.photos/id/431/400/400'),
  Lugar('Bruges', 'Canais', 'https://picsum.photos/id/164/400/400'),
  Lugar('Chambord', 'Castelo', 'https://picsum.photos/id/142/400/400'),
  Lugar('Campo', 'Pôr do sol', 'https://picsum.photos/id/110/400/400'),
];

class AppGridView extends StatelessWidget {
  const AppGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text('GridView'),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: lugares.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, i) => CelulaDoGrid(lugar: lugares[i]),
        ),
      ),
    );
  }
}

class CelulaDoGrid extends StatelessWidget {
  final Lugar lugar;

  const CelulaDoGrid({super.key, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(lugar.titulo, style: const TextStyle(fontSize: 13)),
          subtitle: Text(lugar.subtitulo, style: const TextStyle(fontSize: 13)),
        ),
        child: Image.network(lugar.imagem, fit: BoxFit.cover),
      ),
    );
  }
}

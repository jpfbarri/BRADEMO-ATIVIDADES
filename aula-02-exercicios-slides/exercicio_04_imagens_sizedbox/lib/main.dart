import 'package:flutter/material.dart';

void main() {
  runApp(const AppExercicio4());
}

class AppExercicio4 extends StatelessWidget {
  const AppExercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insert Image Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text(
            'Insert Image Example',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 170,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('images/imagem_01.jpg'),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 280,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('images/imagem_02.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

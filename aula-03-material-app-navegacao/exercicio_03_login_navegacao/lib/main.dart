import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() => runApp(const AppExercicio3());

class AppExercicio3 extends StatelessWidget {
  const AppExercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

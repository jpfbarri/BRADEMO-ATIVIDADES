import 'package:flutter/material.dart';

import 'screens/posts_page.dart';

void main() => runApp(const JsonPlaceholderApp());

class JsonPlaceholderApp extends StatelessWidget {
  const JsonPlaceholderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSONPlaceholder CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PostsPage(),
    );
  }
}

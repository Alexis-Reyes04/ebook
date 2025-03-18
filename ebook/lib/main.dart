import 'package:ebook/screens/ebook_home_screen.dart.';
import 'package:flutter/material.dart';
import 'ebook_home_screen.dart'; // Importa la pantalla principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Book App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EbookHomeScreen(), // Pantalla principal de Ebook
    );
  }
}

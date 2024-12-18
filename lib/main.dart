import 'package:flutter/material.dart';
import 'calculadora.dart';  // Importando o arquivo calculadora.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(), // Usando a classe Calculadora como tela inicial
    );
  }
}

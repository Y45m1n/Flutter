import 'package:flutter/material.dart';

import 'ViewLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kkkkk',
      home: LoginView(), // Definindo LoginView como a tela inicial
    );
  }
}

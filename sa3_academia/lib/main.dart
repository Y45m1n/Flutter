import 'package:flutter/material.dart';
import 'package:sa3_academia/View/LoginView.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ACADEMIA",
      debugShowCheckedModeBanner: false,
      home: PaginaLogin(),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Item $index');
<<<<<<< HEAD
=======

>>>>>>> 88841886b7d96c245b49a0e283c5a328234c37cd
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exercicio 3")),
<<<<<<< HEAD
=======
        backgroundColor: Colors.pink,
>>>>>>> 88841886b7d96c245b49a0e283c5a328234c37cd
        body: ListView(
          children: [
            for (String item in items)
              Card(
<<<<<<< HEAD
                child: ListTile(
                  title: Text(item),
                  subtitle: Text('Informações fictícias'),
                  leading: Icon(Icons.info),
=======
                color: Colors.grey, // Altere a cor aqui
                child: ListTile(
                  title: Text(item),
                  subtitle: Text('Informações fictícias'),
                  leading: Icon(Icons.android),
>>>>>>> 88841886b7d96c245b49a0e283c5a328234c37cd
                ),
              ),
          ],
        ),
      ),
    );
  }
}

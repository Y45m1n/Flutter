import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 1"),
        ),
        body: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.cyan,
              child: Text("Container 1"),
              alignment: Alignment.center,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.amber,
              child: Text("Container 2"),
              alignment: Alignment.topRight,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.purple,
              child: Text("Container 3"),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}

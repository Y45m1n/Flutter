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
          title: Text("Exercicio 4"),
          backgroundColor: Colors.pink,
        ),
        body: Center(child: Text("Pagina Inicial")),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings_sharp),
              label: 'Adm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Config',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Sobre Nós',
            ),
          ],
        ),
      ),
    );
  }
}

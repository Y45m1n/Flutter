import 'package:flutter/material.dart';
import 'package:projeto_flutter/ToBuyListController.dart';
import 'package:projeto_flutter/ToBuyListView.dart';

class ListaDeComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListaDeComprasController controller = ListaDeComprasController();

    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListaDeComprasView(controller: controller),
    );
  }
}

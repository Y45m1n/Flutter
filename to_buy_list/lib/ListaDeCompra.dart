import 'package:flutter/material.dart';
import 'package:to_buy_list/ListaDeComprasController.dart';
import 'package:to_buy_list/ListaDeComprasView.dart';

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

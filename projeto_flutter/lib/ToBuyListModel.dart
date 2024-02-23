import 'package:flutter/material.dart';

class ItemDeCompra {
  String nome;
  double preco;
  bool concluido; // Propriedade para armazenar o status do item

  ItemDeCompra({
    required this.nome,
    required this.preco,
    this.concluido = false, // Valor padrão é false (pendente)
  });
}

class Item {
  String nome;
  double preco;
  bool concluido; // Propriedade para armazenar o status do item

  Item({
    required this.nome,
    required this.preco,
    this.concluido = false, // Valor padrão é false (pendente)
  });
}

class ListaDeComprasModel extends ChangeNotifier {
  List<ItemDeCompra> _listaDeCompras = [];

  List<ItemDeCompra> get listaDeCompras => _listaDeCompras;

  void adicionarItem(ItemDeCompra item) {
    _listaDeCompras.add(item);
    notifyListeners();
  }

  void removerItem(int index) {
    _listaDeCompras.removeAt(index);
    notifyListeners();
  }

  double calcularTotal() {
    double total = 0.0;
    for (var item in _listaDeCompras) {
      total += item.preco;
    }
    return total;
  }

  void atualizarTotal() {
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ItemListaDeCompras {
  String nome;
  double preco;
  bool concluido; // Adicionando o atributo concluido

  ItemListaDeCompras({
    required this.nome,
    required this.preco,
    this.concluido = false, // Definindo o valor padrão como false
  });
}

class ListaDeComprasController {
  TextEditingController textController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  List<ItemListaDeCompras> listaDeCompras = [];

  void addItem(BuildContext context) {
    final nome = textController.text;
    final preco = double.tryParse(precoController.text) ?? 0;

    if (nome.isNotEmpty && preco > 0) {
      listaDeCompras.add(ItemListaDeCompras(nome: nome, preco: preco));
      textController.clear();
      precoController.clear();
      atualizarTotal();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tarefa adicionada com sucesso')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    }
  }

  void removeItem(int index) {
    listaDeCompras.removeAt(index);
    atualizarTotal();
  }

  double calcularTotal() {
    double total = 0;
    for (var item in listaDeCompras) {
      total += item.preco;
    }
    return total;
  }

  void atualizarTotal() {
    // Método para atualizar o total, se necessário
  }
}

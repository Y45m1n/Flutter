import 'package:flutter/material.dart';
import 'package:to_buy_list/ListaDeComprasController.dart';

class ListaDeComprasView extends StatefulWidget {
  final ListaDeComprasController controller;

  ListaDeComprasView({required this.controller});

  @override
  _ListaDeComprasViewState createState() => _ListaDeComprasViewState();
}

class _ListaDeComprasViewState extends State<ListaDeComprasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Supermecado'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: widget.controller.textController,
                    decoration: InputDecoration(
                      hintText: 'Nome do item',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: widget.controller.precoController,
                    decoration: InputDecoration(
                      hintText: 'Preço',
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.controller.addItem(context);
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.controller.listaDeCompras.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.controller.listaDeCompras[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Checkbox(
                      value: item.concluido,
                      onChanged: (value) {
                        setState(() {
                          item.concluido = value!;
                          widget.controller.atualizarTotal();
                          if (item.concluido) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Tarefa Concluida')),
                            );
                          }
                        });
                      },
                    ),
                    title: TextFormField(
                      initialValue: item.nome,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      onChanged: (value) {
                        setState(() {
                          item.nome = value;
                          widget.controller.atualizarTotal();
                        });
                      },
                    ),
                    subtitle: TextFormField(
                      initialValue: item.preco.toString(),
                      decoration: InputDecoration(
                        labelText: 'Preço',
                      ),
                      onChanged: (value) {
                        setState(() {
                          item.preco = double.tryParse(value) ?? 0;
                          widget.controller.atualizarTotal();
                        });
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.controller.removeItem(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tarefa apagada')),
                          );
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              'Total: R\$ ${widget.controller.calcularTotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

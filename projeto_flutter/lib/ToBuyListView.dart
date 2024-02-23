import 'package:flutter/material.dart';
import 'package:projeto_flutter/ToBuyListController.dart';

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
        title: Text('Lista de Compras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextField(
                      controller: widget.controller.textController,
                      decoration: InputDecoration(
                        hintText: 'Nome do item',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: widget.controller.precoController,
                      decoration: InputDecoration(
                        hintText: 'Preço',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
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
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.controller.listaDeCompras.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.controller.listaDeCompras[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Checkbox(
                        value: item.concluido,
                        onChanged: (bool? value) {
                          setState(() {
                            item.concluido = value ?? false;
                          });
                        },
                      ),
                      title: Text(
                        item.nome,
                        style: TextStyle(
                          decoration: item.concluido
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: TextFormField(
                        initialValue: item.preco.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total: R\$ ${widget.controller.calcularTotal().toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

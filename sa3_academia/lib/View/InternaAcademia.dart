import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  final String nMatricula;

  PaginaHome({required this.nMatricula});

  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences _prefs;
  List<String> listaItens = ["Item 1", "Item 2", "Item 3"];
  late List<bool> listaSelecao; // Definindo como late para inicialização no initState

  @override
  void initState() {
    super.initState();
    listaSelecao = List<bool>.filled(listaItens.length, false); // Inicializa com false
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int index = 0; index < listaItens.length; index++) {
        listaSelecao[index] = _prefs.getBool('${widget.nMatricula}_item_$index') ?? false;
      }
    });
  }

  Future<void> _atualizarSelecao(int index, bool valor) async {
    setState(() {
      listaSelecao[index] = valor;
    });
    await _prefs.setBool('${widget.nMatricula}_item_$index', valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACADEMIA LIMAS'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Selecione os itens:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaItens.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      listaItens[index],
                      style: TextStyle(fontSize: 16),
                    ),
                    value: listaSelecao[index],
                    onChanged: (value) async {
                      await _atualizarSelecao(index, value ?? false);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

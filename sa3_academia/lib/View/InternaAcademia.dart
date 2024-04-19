import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  String nMatricula;
  PaginaHome({required this.nMatricula});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(nMatricula: nMatricula);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro
  String nMatricula;
  String? _idioma;

  _PaginaHomeState({required this.nMatricula});

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${nMatricula}_darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
      _idioma = _prefs.getString('${nMatricula}_idioma') ?? 'pt-br';
    });
  }

  Future<void> _mudarDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('${nMatricula}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarIdioma(String novoIdioma) async {
    setState(() {
      _idioma = novoIdioma;
    });
    await _prefs.setString('${nMatricula}_idioma', _idioma!);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Armazenamento Interno'), // Título da barra de aplicativos
        ),
        body: Center(
          child: Column(
            children: [
              Text("Selecione o Modo(Claro  ou Escuro)"),
              Switch(
                value:
                    _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
                onChanged: (value) {
                  _mudarDarkMode(); // Chama a função para alternar o tema escuro
                },
              ),
              Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: _idioma,
                onChanged: (value) {
                  _mudarIdioma(value!);
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'pt-br',
                    child: Text('Português (Brasil)'),
                  ),
                  DropdownMenuItem(
                    value: 'en-us',
                    child: Text('Inglês (EUA)'),
                  ),
                  DropdownMenuItem(
                    value: 'es-ar',
                    child: Text('Espanhol (Argentina)'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
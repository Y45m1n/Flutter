import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Usando Shared Preferences",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState creatState() => _HomePageState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences _prefs;
  bool _DarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _DarkMode = _prefs.getBool('darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _DarkMode = !_DarkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('darkMode',
        _DarkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Armazenamento Interno'), // Título da barra de aplicativos
      ),
      body: Center(
        child: Switch(
          value:
              _DarkMode, // Valor do interruptor baseado no estado atual do tema escuro
          onChanged: (value) =>
              _toggleDarkMode(), // Método chamado quando o interruptor é alterado
        ),
      ),
    );
  }
}

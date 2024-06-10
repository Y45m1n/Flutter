import 'package:flutter/material.dart';
import 'cadastroPage.dart'; // Importe a página de cadastro

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navegue para a página de cadastro quando o botão for pressionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductRegistrationForm()),
                  );
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

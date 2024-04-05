import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Cadastro',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                        SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'CPF',
                          ),
                        ),
                        SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirmar Senha',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            // Implementar a lógica de cadastro aqui
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add),
                              SizedBox(width: 8.0),
                              Text('Cadastrar'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

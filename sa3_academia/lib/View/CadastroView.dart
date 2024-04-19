import 'package:flutter/material.dart';
import 'package:sa3_academia/Controller/bdAcademia.dart';
import 'package:sa3_academia/Model/Usuario.dart';


class PaginaCadastro extends StatefulWidget {
  @override
  _PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
   TextEditingController _nMatriculaController = TextEditingController();
    TextEditingController _senhaController = TextEditingController();
     TextEditingController _telefoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
 

  void cadastrarUsuario(BuildContext context) async {
    String nome = _nomeController.text;
     String nMatricula = _nMatriculaController.text;
      String senha = _senhaController.text;
       String telefone = _telefoneController.text;
    String email = _emailController.text;
   

    Usuario usuario = Usuario(nome: nome, nMatricula: nMatricula, senha: senha, telefone: telefone, email: email);

    BancoDadosCrud bancoDados = BancoDadosCrud();
    try {
      bancoDados.create(usuario);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      Navigator.pop(context); // Redireciona para a tela de login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar usuário: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página de Cadastro"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cadastro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira seu nome';
                    }
                    if (!RegExp(r'^[a-zA-ZÀ-ú-\s]+$').hasMatch(value!)) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                ),
                 SizedBox(height: 20),
                TextFormField(
                  controller: _nMatriculaController,
                  decoration: InputDecoration(labelText: 'Número de Matrícula'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira seu número de matrícula';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                      return 'Numero inválido';
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 20),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 20),
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira seu telefone';
                    }
                    if (RegExp(r'^[0-9]+$').hasMatch(value!)) {
                      return 'Telefone inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira seu e-mail';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value!)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
              
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cadastrarUsuario(context);
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa3_academia/Controller/bdAcademia.dart';
import 'package:sa3_academia/Model/Usuario.dart';
import 'package:sa3_academia/View/CadastroView.dart';
import 'package:sa3_academia/View/InternaAcademia.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nMatriculaController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nMatriculaController,
                  decoration: InputDecoration(labelText: 'Número de Matrícula'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, insira seu e-mail';
                    } else if (!isValidnMatricula(value)) {
                      return 'Número de Matrícula inválido';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
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
                _loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: Text('Acessar'),
                      ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaCadastro()),
                    );
                  },
                  child: Text('Não tem uma conta? Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      String nMatricula = _nMatriculaController.text;
      String senha = _senhaController.text;

      setState(() {
        _loading = true;
      });

      BancoDadosCrud bancoDados = BancoDadosCrud();
      try {
        Usuario? usuario = await bancoDados.getUsuario(nMatricula, senha);
        if (usuario != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaginaHome(nMatricula: usuario.email),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Número de Matrícula ou senha incorretos'),
          ));
        }
      } catch (e) {
        print('Erro durante o login: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro durante o login. Tente novamente mais tarde.'),
        ));
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  bool isValidnMatricula(String nMatricula) {
    return RegExp(r'^[0-9]+$').hasMatch(nMatricula);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Usuario'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite seu usuario';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite sua senha';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Implement your login logic here
                // For demonstration purposes, let's print the username and password
                print('Usuario: ${_usernameController.text}');
                print('Senha: ${_passwordController.text}');
                // After successful login, navigate to home page or perform desired actions
              }
            },
            child: Text('Login'),
          ),
          SizedBox(height: 8.0),
          Text(
            "Ainda não tem cadastro? Faça agora!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Implement your registration navigation here
            },
            child: Text('Cadastre-se'),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: Center(
        child: Text('Bem vindo a página inicial!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Login Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginView(),
      '/home': (context) => HomePage(),
    },
  ));
}

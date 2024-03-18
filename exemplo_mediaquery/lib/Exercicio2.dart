import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 2"),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0), // Adicionando padding para espaçamento
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Chegou o programa de fidelidade do Méqui! A cada R1 gasto, você ganha 100 pontos. É Méqui que vira ponto, que vira mais Méqui!',
                      textAlign:
                          TextAlign.center, // Alinhando o texto ao centro
                    ),
                    SizedBox(
                        height:
                            10), // Adicionando um espaço entre o texto e a imagem
                    Image.network(
                      'https://www.mcdonalds.com.br/uploads/Pagina_Home_Desk_580x250px_7dddce6875.png',
                      height: 150, // Definindo a altura da imagem
                      width: 300, // Definindo a largura da imagem
                    ),
                    // Ícone
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Ele é doce, mas também é suavemente picante. Crocante, mas também suculento. Tem sentido isso?? Descubra provando o novo McCrispy Chicken.',
                      textAlign:
                          TextAlign.center, // Alinhando o texto ao centro
                    ),
                    SizedBox(
                        height:
                            10), // Adicionando um espaço entre o texto e a imagem
                    Image.network(
                      'https://www.mcdonalds.com.br/uploads/HOME_2modulo_desk_580x250_22e17d7614.png',
                      height: 150, // Definindo a altura da imagem
                      width: 300, // Definindo a largura da imagem
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

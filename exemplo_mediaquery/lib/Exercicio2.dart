import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Exercicio 2")),
          body: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                        'Atenção! Se olhar pro McFlurry não vai ter mais jeito, vai ter que provar.'),
                    Text(
                        'O McFlurry Kit Kat com o Leite em Pó mais querido do Brasil chegou com tudo no Méqui pra matar a sua fome geladinha.'),
                    Image.network(
                      'https://www.mcdonalds.com.br/uploads/Segundo_modulo_desktop_d8f756a387.png',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Já add o Méqui Zap?'),
                    Text(
                        ' Aquele contato do whatsapp que nunca te deixa no vácuo e sempre manda promoção boa é o nosso.'),
                    Image.network(
                      'https://www.mcdonalds.com.br/uploads/Meiqui_Zap_Desk_56f8b5fbe5.png',
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

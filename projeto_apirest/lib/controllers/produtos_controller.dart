import 'dart:convert';

import '../models/produto.dart';
import 'package:http/http.dart' as http;

class ProdutosController {
  List<Produto> _listProdutos = [];

  List<Produto> get listProdutos => _listProdutos;

  //getPRodutosFromJson http
  Future<Produto> getProdutosFromJson() async {
    final response = await http.get(Uri.parse('http://SEUIP/produto'));
    if (response.statusCode == 200) {
      return Produto.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Produtos');
    }
  }

  //postProdutos toJson http
  Future<String> postProdutosToJson(Produto produto) async {
    final response = await http.post(Uri.parse('http://SEUIP/produto'),
        body: json.encode(produto.toJson()));
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to load Produtos');
    }
  }
}

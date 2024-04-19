class Usuario {
  //atributos
  String nome;
  String nMatricula;
  String senha;
    String telefone;
      String email;
  //Construtor
  Usuario({required this.nome, required this.nMatricula, required this.senha,required this.telefone, required this.email });

  Map<String, dynamic> toMap() {
     return {
      'nome': nome,
      'nMatricula': nMatricula,
      'senha': senha,
       'telefone': telefone,
       'email': email
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'],
      nMatricula: map['nMatricula'],
      senha: map['senha'],
       telefone: map['telefone'],
       email: map['email']
    );
  }

}
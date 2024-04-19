
import 'package:path/path.dart';
import 'package:sa3_academia/Model/Usuario.dart';

import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  static const String Nome_BD = 'usuariosAcademia.db'; // Nome do banco de dados
  static const String Nome_Tabela = 'usuarios'; // Nome da tabela
  static const String
      Script_Criacao_Tabela = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS usuarios("+
      "nome TEXT, nMatricula TEXT UNIQUE PRIMARY KEY, senha TEXT," +
          "  telefone TEXT , email TEXT )";

  
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(
          await getDatabasesPath(), Nome_BD), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            Script_Criacao_Tabela); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }
  // Método para criar um novo contato no banco de dados
  Future<void> create(Usuario usuario) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          Nome_Tabela, usuario.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter o dado do usuario
  Future<Usuario?> getUsuario(String nMatricula, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(Nome_Tabela,
          where: 'nMatricula = ? AND senha = ?',
          whereArgs: [nMatricula,senha]
          ); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty){
        return Usuario.fromMap(maps[0]);
      }else{
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }
  // Método para verificar existência do usuario
  Future<bool> existsUsuario(String nMatricula, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(Nome_Tabela,
          where: 'nMatricula = ? AND senha = ?',
          whereArgs: [nMatricula,senha]
          ); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty){
        return true;
      }else{
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

}


// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static Database? _database;

//   DatabaseHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'selecao_database.db');
//     return await openDatabase(path, version: 1, onCreate: _createDatabase);
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE selecao (
//         id INTEGER PRIMARY KEY,
//         itemIndex INTEGER,
//         isSelected INTEGER
//       )
//     ''');
//   }

//   Future<int> insertSelecao(int itemIndex, bool isSelected) async {
//     Database db = await instance.database;
//     Map<String, dynamic> row = {
//       'itemIndex': itemIndex,
//       'isSelected': isSelected ? 1 : 0,
//     };
//     return await db.insert('selecao', row);
//   }

//   Future<int> updateSelecao(int itemIndex, bool isSelected) async {
//     Database db = await instance.database;
//     Map<String, dynamic> row = {
//       'itemIndex': itemIndex,
//       'isSelected': isSelected ? 1 : 0,
//     };
//     return await db.update('selecao', row,
//         where: 'itemIndex = ?', whereArgs: [itemIndex]);
//   }

//   Future<List<Map<String, dynamic>>> getAllSelecao() async {
//     Database db = await instance.database;
//     return await db.query('selecao');
//   }
// }

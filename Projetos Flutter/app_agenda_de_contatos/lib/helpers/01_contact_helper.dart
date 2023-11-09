// ignore_for_file: file_names
/* BIBLIOTECAS */
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
/* FIM BIBLIOTECAS */



/* DADOS DA TABELA DO BANCO DE DADOS */
const String contactTable = "contactTable";
const String idColumn = "idColumn";
const String nameColumn = "nameColumn";
const String emailColumn = "emailColumn";
const String phoneColumn = "phoneColumn";
const String imgColumn = "imgColumn";
/* fim dados da tabela do banco de dados */



/* CLASSE ContactHelper -> PADRÃO SINGLETON (DESIGN PATTERNS) */
/* O padrão singleton garante que uma classe tenha apenas uma instância */

/*
  A classe ContactHelper tem a responsabilidade de lidar com o armazenamento e a 
  recuperação de contatos em um banco de dados. Ela não precisa conhecer os detalhes 
  específicos da estrutura de dados de um contato, apenas como interagir com o banco de dados.
*/
class ContactHelper { 

  static final ContactHelper _instance = ContactHelper.internal(); //variável
  factory ContactHelper() => _instance; //método
  ContactHelper.internal(); //construto privado da classe


  /* MÉTODO PARA OBTER A INSTÂNCIA DO BANCO DE DADOS */
  Database? _db;
  Future<Database> get db async {
    // ignore: unnecessary_null_comparison
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }
  /* ------fim da instancia do banco de dados------ */


  /* MÉTODO PARA INICIALIZAR e CONFIGURAR O BANCO DE DADOS */
  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath(); //caminho do diretório dentro da variável databasesPath
    final path = join(databasesPath, "contactsnew.db"); //caminho completo para o arquivo do banco de dados.
    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)");
    });
  }
  /* fim do método de inicializacao do banco de dados */



  /* MÉTODO PARA SALVAR O CONTATO */
  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }
  /* fim método para salvar contato */


  /* OBTER OS DADOS DE UM CONTATO */
  Future<Contact?> getContact(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(contactTable,
        columns: [idColumn, nameColumn, emailColumn, phoneColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }
  /* fim do método para obter os dados do contato */

    //FUNÇÃO PARA OBTER TODOS OS CONTATOS
  Future<List> getAllContacts() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $contactTable");
    List<Contact> listContact = [];
    for (Map m in listMap) {
      listContact.add(Contact.fromMap(m));
    }
    return listContact;
  }


  /* FUNÇÃO PARA DELETAR UM CONTATO */
  Future<int> deleteContact(int id) async {
    Database dbContact = await db;
    return dbContact
        .delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
  }
  /* fim do método para deletar um contato */


  /* FUNÇÃO PARA ATUALIZAR UM CONTATO */
  Future<int> updateContact(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.update(contactTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }
  /* fim do método de atualizar contato */



}

/*
  A class Contact tem a responsabilidade de definir a estrutura de dados
  de um contato e fornecer métodos para converter entre o formato de objeto e mapa.
  Ela não precisa saber nada sobre como os contatos são armazenados em um banco de dados.
*/
class Contact {

  /* ATRIBUTOS */
  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;
  /* fim dos atributos */

  Contact(); //construtor

  Contact.fromMap(Map map) {
    //ao armazenar os dados no banco de dados, será armazenado no formato de map
    id = map["idColumn"];
    name = map["nameColumn"];
    email = map["emailColumn"];
    phone = map["phoneColumn"];
    img = map["imgColumn"];
  }

  Map<String, dynamic> toMap() {
    //função que ir converter para um map
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, img$img)";
  }
}

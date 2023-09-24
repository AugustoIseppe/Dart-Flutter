// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

const String contactTable = "contactTable";
const String idColumn = "idColumn";
const String nameColumn = "nameColumn";
const String emailColumn = "emailColumn";
const String phoneColumn = "phoneColumn";
const String imgColumn = "imgColumn";

class ContactHelper { //Padrao Singletown
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

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

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)");
    });
  }

  //MÉTODO PARA SALVAR O CONTATO
  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  //OBTER OS DADOS DE UM CONTATO
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

  //FUNÇÃO PARA DELETAR UM CONTATO
  Future<int> deleteContact(int id) async {
    Database dbContact = await db;
    return dbContact
        .delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  //FUNÇÃO PARA ATUALIZAR UM CONTATO
  Future<int> updateContact(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.update(contactTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }


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
}

class Contact {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;

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

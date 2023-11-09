// ignore_for_file: file_names, unused_field

import 'package:app_agenda_de_contatos/helpers/01_contact_helper.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact; //chama a classe responsável por criar o contato
  ContactPage({this.contact}); //as chaves deixam o parametro opcional

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _userEdited = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  Contact? _editedContact;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact!.name ?? "";
      _emailController.text = _editedContact!.email ?? "";
      _phoneController.text = _editedContact!.phone ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_editedContact!.name ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            child: const Icon(Icons.save),
            onPressed: () {
              if (_editedContact!.name != null &&
                  _editedContact!.name!.isNotEmpty) {
                Navigator.pop(context, _editedContact);
              } else {
                FocusScope.of(context).requestFocus(_nameFocus);
              }
            }),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _editedContact!.img != null
                                ? FileImage(File(_editedContact!.img!))
                                : AssetImage("images/person.png")
                                    as ImageProvider,
                                    fit: BoxFit.cover
                                    ),),
                  ),
                  onTap: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then((file) {
                      if (file == null) return;
                      setState(() {
                        _editedContact!.img = file.path;
                      });
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    focusNode: _nameFocus,
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nome"),
                    onChanged: (text) {
                      _userEdited = true;
                      setState(() {
                        _editedContact!.name = text;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      _userEdited = true;
                      _editedContact!.email = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: "Telefone",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      _userEdited = true;
                      _editedContact!.phone = text;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Descartar Alteracoes?"),
            content: Text("Se sair as alteracoes não serão salvas!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Descartar Alteracoes"))
            ],
          );
        },
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

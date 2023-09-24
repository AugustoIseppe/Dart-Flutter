// ignore_for_file: file_names, avoid_print, prefer_const_constructors
import 'dart:io';
import 'package:app_agenda_de_contatos/helpers/01_contact_helper.dart';
import 'package:app_agenda_de_contatos/ui/02_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum OrderOptions {orderaz, orderza} //ordernar a lista por ordem alfabética

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  List contacts = [];

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        actions: [
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>> [
              const PopupMenuItem<OrderOptions>(
                child: Text("Ordernar de A a Z"),
                value: OrderOptions.orderaz,
                ),
              const PopupMenuItem<OrderOptions>(
                child: Text("Ordernar de Z a A"),
                value: OrderOptions.orderza,
                ),
            ],
            onSelected: _orderList,
        )
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 10,
          onPressed: () {
            _showContactPage();
          },
          child: Icon(
            Icons.add,
            color: Colors.purpleAccent,
            size: 40.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          //construtor de itens
          return _contactCard(context, index);
        },
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _showOptions(context, index);
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: contacts[index].img != null ? FileImage(File(contacts[index].img)) :
                            AssetImage("images/person.png") as ImageProvider,
                            fit: BoxFit.cover)),
                child: Container(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contacts[index].name ?? "",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              launchUrl(Uri.parse('tel: ${contacts[index].phone}'));
                              Navigator.pop(context);
                            }, 
                            child: Text('Ligar')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              Navigator.pop(context); //fechar a caixa de dialogo ao trocar de página
                              _showContactPage(contact: contacts[index]);
                            }, 
                            child: Text('Editar')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              helper.deleteContact(contacts[index].id);
                              setState(() {
                                contacts.removeAt(index);
                                Navigator.pop(context);
                              });
                            }, 
                            child: Text('Excluir')),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  void _showContactPage({Contact? contact}) async {
    //parametro opcional
    final recContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
        _getAllContacts();
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  void _orderList (OrderOptions result) { //funcao para ordenar a lista
    switch (result) {
      case OrderOptions.orderaz:
        contacts.sort((a, b) {
         return a.name.toLowerCase().compareTo(b.name.toLowseCase());
        },);
      break;
      case OrderOptions.orderza:
        contacts.sort((a, b) {
        return b.name.toLowerCase().compareTo(a.name.toLowseCase());
        },);
      break;
    }
    setState(() {
      
    });
  }
}

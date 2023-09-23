// ignore_for_file: file_names, avoid_print

import 'package:app_agenda_de_contatos/helpers/01_contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();
    Contact c = Contact();
    c.name = 'DarinhaLinda';
    c.email = 'DarinhaLinda.iseppe@gmail.com';
    c.phone = '19999009175';
    c.img = 'imgTeste';

    helper.saveContact(c);

    helper.getAllContacts().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

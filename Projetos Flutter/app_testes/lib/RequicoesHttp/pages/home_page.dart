import 'package:app_testes/RequicoesHttp/dummyData/dummy_data.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';
import 'form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Users> usuarios = dummyUsers;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage(),)), icon: Icon(Icons.add))
          ],
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(usuarios[index].nome),
            subtitle: Text(usuarios[index].profissao),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 20,
              child: ClipOval(
                child: Image.network(
                  usuarios[index].imagemUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

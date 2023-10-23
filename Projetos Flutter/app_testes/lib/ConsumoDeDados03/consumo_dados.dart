import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumoDados03 extends StatefulWidget {
  const ConsumoDados03({Key? key}) : super(key: key);

  @override
  State<ConsumoDados03> createState() => _ConsumoDados03State();
}

class _ConsumoDados03State extends State<ConsumoDados03> {


  Future<List<dynamic>> buscarDadosApi() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> retorno = jsonDecode(response.body);
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<dynamic>>(
          future: buscarDadosApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            snapshot.data![index]["url"],
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(snapshot.data![index]["id"].toString())
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

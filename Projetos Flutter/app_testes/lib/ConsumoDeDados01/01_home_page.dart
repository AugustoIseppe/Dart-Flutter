// ignore_for_file: file_names

import 'package:app_testes/ConsumoDeDados01/02_post.dart';
import 'package:app_testes/ConsumoDeDados01/03_remote_services.dart';
import 'package:flutter/material.dart';

class ConsumoDeDadosHTTP extends StatefulWidget {
  const ConsumoDeDadosHTTP({super.key});

  @override
  State<ConsumoDeDadosHTTP> createState() => _ConsumoDeDadosHTTPState();
}

class _ConsumoDeDadosHTTPState extends State<ConsumoDeDadosHTTP> {
  List<Post>? posts;
  bool isLoaded = false;
  int contador = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null ) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consumo de Dados com HTTP'), centerTitle: true,),
      body: Visibility(
        visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                      
                    ),
                    child: Text('$index', style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    )
                    ,
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        Text(
                          posts![index].body ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ],
              ));
          },
          ),
      ),
    );
  }
}
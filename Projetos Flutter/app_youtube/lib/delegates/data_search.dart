import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      query = ""; //query -> limpar o campo de pesquisa
    }, 
    icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, null);
      }, 
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        ),
      );
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((value) => close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: suggestions(query), 
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                  leading: const Icon(Icons.search_sharp),
                  onTap: () {
                    close(context, snapshot.data![index]);
                  },
                );
              },
              );
          }
        },
        );
    }
  }


  // Requisiçao via API do google -> necessário para pegar as sugestões
  Future<List> suggestions(String search) async {
    http.Response response = await http.get(Uri.parse(
      "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json" //link -> api do youtube para gerar as sugestões no campo de pesquisa
    ));
    if(response.statusCode == 200) {
      return json.decode(response.body)[1].map((video){
        return video[0];
      }).toList();
    } else {
      throw Exception("Failed to load suggestions");
    }
  }
}

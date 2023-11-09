// ignore_for_file: file_names

import 'package:app_testes/ConsumoDeDados01/02_post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);

    if(response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}
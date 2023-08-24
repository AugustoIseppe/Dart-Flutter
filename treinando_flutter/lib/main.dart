import 'package:flutter/material.dart';
import 'package:treinando_flutter/jsonPlaceholder.dart';


//coordenadas pirassununga = -22.0012278478714, -47.42619858643563

void main()  {

  // http.Response response = await get(Uri.parse(urlWeather));
  // convert.jsonDecode(response.body);
  // print(response.body);
  //
  runApp(const MaterialApp(
    home: HomeJsonPlaceholder(),
  ));
}


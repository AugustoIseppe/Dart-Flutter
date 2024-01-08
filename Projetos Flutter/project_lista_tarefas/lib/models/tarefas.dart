// ignore: unused_import

class Tarefas {

  
  late String title;
  late DateTime dateTime;

  Tarefas({required this.title, required this.dateTime});

  Tarefas.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['datetime']);

  //1ª transformar a classe Tarefas em um Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'datetime': dateTime.toIso8601String()
      //converte o dateTime para uma String
    }; //fecha return
  } //fecha toJason
} //fecha classe

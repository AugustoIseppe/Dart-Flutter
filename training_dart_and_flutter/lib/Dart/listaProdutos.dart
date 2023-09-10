// ignore_for_file: avoid_print, file_names, duplicate_ignore

import 'dart:io';

main() {
  //adiconar um produto
  //imprimir o produto
  //sair do programa

  // ignore: unused_local_variable
  final List produtos = [];

  bool isRunning = true;

  while (isRunning) {
    print("\x1B[2J\x1B[0;0h");
    print(
        "LISTA DE COMPRAS (${produtos.length}) - comandos -> [add, imprimir]");
    var input = stdin.readLineSync();

    // ignore: duplicate_ignore
    if (input == "add") {


      // ignore: avoid_print
      print("\x1B[2J\x1B[0;0h");
      // ignore: avoid_print
      print('Adicione um produto');
      var product = stdin.readLineSync();
      produtos.add(product);

      
    } else if (input == "imprimir") {


      print("\x1B[2J\x1B[0;0h");
      print('Listar todos os produtos');
      print('\n');
      for (int i = 0; i < produtos.length; i++) {
        print('Produto: $produtos[i]');
      }
      stdin.readLineSync();
      
    } else {


      isRunning = false;
    }
  }
  print("\x1B[2J\x1B[0;0h");

  print('===fim do programa===');
}

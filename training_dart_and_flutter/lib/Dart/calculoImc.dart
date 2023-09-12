import 'dart:io';

main() {
  final String nome = pegarNome();
  double peso = pegarPeso();
  double altura = pegarAltura();
  double imc = calcularImc(peso, altura);

  if (imc < 18) {
    print("$nome, Voce está abaixo do peso");
  } else if (imc >= 18 && imc < 26) {
    print("$nome, Você está no peso ideal");
  } else {
    print("$nome, Você está obeso");
    print("$nome, Você está obeso");
  }
}

String pegarNome() {
  print("Qual o seu nome?");
  String? name = stdin.readLineSync();
  if (name == null) {
    return "Anônimo";
  } else {
    return name;
  }
}

double pegarPeso() {
  print("Informe seu peso");
  final String? pesoString = stdin.readLineSync();
  if (pesoString == null) {
    return 0.0;
  } else {
    return double.parse(pesoString);
  }
}

double pegarAltura() {
  print("Informe sua altura");
  final String? alturaString = stdin.readLineSync();
  if (alturaString == null) {
    return 0.0;
  } else {
    return double.parse(alturaString);
  }
}

double calcularImc(double peso, double altura) {
  return peso / (altura * altura);
}

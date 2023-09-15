void main() {
  final pessoa1 = Pessoa(
    nome: 'Augusto',
    peso: 85.5,
    altura: 1.80,
  );
  print(pessoa1.calcularImc());
}

class Pessoa {
  final String nome;
  final double peso;
  final double altura;

  Pessoa({
    //construtor
    required this.nome,
    required this.peso,
    required this.altura,
  });

  double calcularImc() {
    return peso / (altura * altura);
  }
}

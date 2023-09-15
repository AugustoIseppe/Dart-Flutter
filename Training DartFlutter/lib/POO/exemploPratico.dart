// ignore: file_names
class ContaCorrente {

  ContaCorrente({saldo = 0, status = false});

  //Atributos
  int? _numeroConta;
  String? _tipo; //cc- contaCorrente(50R$) cp->contaPoupança(150R$)
  String? _dono;
  double? _saldo;
  bool? _status;


  //métodos
  void abrirConta(String valueTipo){
    if ( valueTipo == "CC" ) {
      saldo = 50;
    } else {
      saldo = 150;
    };
  }

  void fecharConta(){
    if (saldo > 0) {
      print('Salco com dinheiro');
    } else if (saldo < 0 ) {
      print('Conta negativada');
    } else {
      status = false;
    }
  }
  void depositar(int v){
    if (status == true) {
      saldo = saldo + v;
    } else {
      print('Impossivel depostiar');
    }
  }
  void sacar(int v){
    if ( saldo == true) {
      if (saldo > v) {
        saldo = saldo -v;
      } else {
        print('Saldo insuficiente');
      }
    }
  }
  void pegarMensal(){}

  //getters and setter
    int get numeroConta => _numeroConta!;
    set nome(int valueNumeroConta) {
    _numeroConta = valueNumeroConta;
  }

    String get tipo => _tipo!;
    set tipo(String valueTipo) {
      _tipo = valueTipo;
    }

    String get dono => _dono!;
    set dono(String valueDono) {
      _dono = valueDono;
    }

    double get saldo => _saldo!;
    set saldo(double valueSaldo) {
      _saldo = valueSaldo;
    }

    bool get status => _status!;
    set status(bool valueStatus) {
      _status = valueStatus;
    }
}
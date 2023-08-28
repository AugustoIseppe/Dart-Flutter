class Usuario {
  //atributos
  String? _nome;
  String? _email;

  Usuario(this._nome, this._email);

  String get nome => _nome!;
  set nome(String value) {
    _nome = value;
  }

  String get email => _email!;
  set email(String value) {
    _email = value;
  }

}
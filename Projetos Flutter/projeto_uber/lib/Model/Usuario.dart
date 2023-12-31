class Usuario {
  /*------------------------------------*/
  String? _idUsuario;
  String? _nome;
  String? _email;
  String? _senha;
  String? _tipoUsuario; //tipo usuario? passageiro ou motorista?

  /*------------------------------------*/

  //Construtor
  Usuario();

  /*------------------------------------*/

  Map<String, dynamic> toMap() { 
    //método toMap() -> função que retorna um unico Map<String, dynamic>

    Map<String, dynamic> map = { //map -> usado para armazenar os dados
      "nome" : this.nome,
      "email" : this.email,
      "tipoUsuario" : this.tipoUsuario
    };

    return map;
  }
  /*------------------------------------*/

  //VERIFICAR O TIPO DE USUARIO
  String verificarTipoUsuario(bool tipoUsuario) {
    /*                     TRUE           FALSE         */
    return tipoUsuario? "motorista" : "passageiro";
  }

  String get tipoUsuario => _tipoUsuario!;
  set tipoUsuario(String value) {
    _tipoUsuario = value;
  }

  /*------------------------------------*/

  String get senha => _senha!;
  set senha(String value) {
    _senha = value;
  }

  /*------------------------------------*/

  String get email => _email!;
  set email(String value) {
    _email = value;
  }

  /*------------------------------------*/

  String get nome => _nome!;
  set nome(String value) {
    _nome = value;
  }

  /*------------------------------------*/

  String get idUsuario => _idUsuario!;
  set idUsuario(String value) {
    _idUsuario = value;
  }
}
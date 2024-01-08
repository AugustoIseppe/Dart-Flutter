void main() {
  /*
  Escreva uma função que aceite um array de 10 inteiros (entre 0 e 9), que retorne uma string desses números na forma de um número de telefone.
   */

  int criarNumero(List<int> vetor) {
    vetor = [0,1,2,3,4,5,6,7,8,9];

    int ddd = 0; 
    
    for(int i = 0 ; i<= vetor.length ; i++) {
      if(vetor[i] <= 2) {
        ddd = vetor.length - 1;
      }
    }
    return ddd;
  }
  print(criarNumero.toString());
}
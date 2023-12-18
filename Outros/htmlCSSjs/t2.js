function buscaBinaria(arr, alvo) {
  let inicioBusca = 0;
  let fimBusca = arr.length - 1;
  let ultimaPosicaoEncontrada = -1;

  while (inicioBusca <= fimBusca) {
    const meio = Math.floor((inicioBusca + fimBusca) / 2);

    if (arr[meio] === alvo) {
      ultimaPosicaoEncontrada = meio;
      inicioBusca = meio + 1; 
    } else if (arr[meio] < alvo) {
      inicioBusca = meio + 1;
    } else {
      fimBusca = meio - 1;
    }
  }

  return ultimaPosicaoEncontrada;
}

const listaOrdenada = [
  'a', 'a',
  'a', 'b', 'e',
  'e', 'g', 'i',
  'l', 'n', 'o',
  'p', 'p', 's',
  's', 't', 'u',
  'u'
];

const alvoBusca = 'u';

const posicaoUltimaOcorrencia = buscaBinaria(listaOrdenada, alvoBusca);

console.log(posicaoUltimaOcorrencia);

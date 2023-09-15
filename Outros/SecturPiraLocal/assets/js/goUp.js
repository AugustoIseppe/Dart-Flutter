function topFunction() {
    document.body.scrollTop = 0; // Para Safari
    document.documentElement.scrollTop = 0; // Para Chrome, Firefox, IE e Opera
  }
  
// Seleciona o botão pelo ID
var btn = document.getElementById("goUp");

// Quando a página é rolada, executa a função
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  // Se o usuário rolar mais de 20 pixels, o botão será exibido
  if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
    btn.style.display = "block";
  } else {
    btn.style.display = "none";
  }
  
  // Define a posição do botão à medida que a página é rolada
  var bottomOffset = 20; // Define a distância entre a borda inferior do botão e a borda inferior da página
  var topOffset = 20; // Define a distância entre a borda superior do botão e a borda superior da página
  btn.style.bottom = bottomOffset + "px";
  btn.style.top = "auto";
  
  if (window.innerWidth <= 768) { // Verifica se a largura da janela é menor ou igual a 768 pixels (por exemplo, em dispositivos móveis)
    btn.style.bottom = "20px";
    btn.style.top = "auto";
  }
}

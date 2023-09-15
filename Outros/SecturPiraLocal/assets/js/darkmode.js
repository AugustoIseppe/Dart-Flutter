// script.js

document.addEventListener('DOMContentLoaded', function() {
    var image = document.getElementById('myImage');
  
    image.addEventListener('click', function() {
      if (image.src.endsWith('circle-half.svg')) {
        image.src = "assets/img/circle-fill.svg";
        alert ("Modo Escuro ativado");
      } else {
        image.src = "assets/img/circle-half.svg";
      }
    });
  });
  
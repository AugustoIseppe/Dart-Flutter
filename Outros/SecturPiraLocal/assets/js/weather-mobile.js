fetch('https://api.openweathermap.org/data/2.5/weather?q=Pirassununga&appid=e8a5fb0a53e59983352eda87deba4d90&units=metric')
  .then(response => response.json())
  .then(data => {
    const temperatura = parseFloat(data.main.temp);
    const elementoTemperatura = document.getElementById('temperatura-mobile');
    elementoTemperatura.innerHTML = `
    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="currentColor" class="bi bi-cloud-fog2" viewBox="0 -3 16 16">
    <path d="M8.5 4a4.002 4.002 0 0 0-3.8 2.745.5.5 0 1 1-.949-.313 5.002 5.002 0 0 1 9.654.595A3 3 0 0 1 13 13H.5a.5.5 0 0 1 0-1H13a2 2 0 0 0 .001-4h-.026a.5.5 0 0 1-.5-.445A4 4 0 0 0 8.5 4zM0 8.5A.5.5 0 0 1 .5 8h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z"/>
  </svg>${temperatura.toFixed(0)} °C`;
  });

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/piramap.css">
    <script type="module" src="./assets/js/initmap.js"></script>
    <title>Mapa de Pirassununga</title>
    <style>
        *{
            margin:0;
            padding:0;
        }
        #cabecalho-imagem {
            background-image:url(./front-image1.jpg);
            margin-bottom: 3%;
        }

    </style>
</head>
<body>
    <?php include 'menu.php' ?>
    <div class="container-full"> 
        <div id="cabecalho-imagem">
            <div class="infos-cabecalho">
                <h1 style="text-shadow:2px 2px 0px black;">Pirassununga</h1>
                <p style="text-shadow:2px 2px 0px black;">Venha conhecer nossa cidade do interior paulista!</p>
            </div>
        </div>

        <br><br><br><br>
        <div id="map" style="
            width: calc(80%);
            height: 30rem;
            margin-left:calc(10%);
            margin-right:0px;
            margin-bottom:0px;
            background-color: #a5a4a4; 
            border: 4px solid transparent;
            border-image-slice: 1;"> 
        </div>
   
        <br><br><br><br><br><br><br><br>
    </div>
    <?php include 'rodape.html' ?>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs&callback=initMap&libraries=places&v=weekly" defer></script>
</body>
</html>
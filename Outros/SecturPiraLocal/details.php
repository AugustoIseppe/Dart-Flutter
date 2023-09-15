<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes</title>
    <link rel="stylesheet" href="assets/css/details.css">
    <script type="module" src="inimap.js"></script>
</head>

<body>

    <?php
    session_start();
    include 'conexao.php';
    include 'menu.php';
    if (!empty($_GET['id'])) {
        $id_prod = $_GET['id'];
        $consulta = $conexao->query("SELECT * FROM local WHERE localid='$id_prod'");
        $exibir = $consulta->fetch(PDO::FETCH_ASSOC);
    }
    $placeId = $exibir['place_id'];
    $apiKey = 'AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs';
    $apiUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=opening_hours&key=$apiKey&language=pt-BR";
    date_default_timezone_set('America/Sao_Paulo');
    $apiResponse = file_get_contents($apiUrl);
    $apiData = json_decode($apiResponse, true);
    $status_abertura = "Fechado"; // Define um valor padrão
    if ($apiResponse && isset($apiData['result']['opening_hours']['periods'])) {
        $periodos = $apiData['result']['opening_hours']['periods'];
        // Obtém o dia da semana atual (0 = domingo, 6 = sábado)
        $dia_atual = date('w');
        foreach ($periodos as $periodo) {
            if ($periodo['open']['day'] == $dia_atual) {
                $hora_abertura = substr($periodo['open']['time'], 0, 2);
                $minuto_abertura = substr($periodo['open']['time'], 2, 2);
                $hora_fechamento = substr($periodo['close']['time'], 0, 2);
                $minuto_fechamento = substr($periodo['close']['time'], 2, 2);
                $horario_atual = date('H:i');
                $minutos_abertura = $hora_abertura * 60 + $minuto_abertura;
                $minutos_fechamento = $hora_fechamento * 60 + $minuto_fechamento;
                $minutos_atual = intval(substr($horario_atual, 0, 2)) * 60 + intval(substr($horario_atual, 3, 2));
                if ($minutos_atual >= $minutos_abertura && $minutos_atual <= $minutos_fechamento) {
                    $status_abertura = "Aberto";
                    break;
                }
            }
        }
    }
    ?>
    <!--CONTAINER PRINCIPAL-->
    <div id="container-principal">
        <!--##############################################-->
        <!--CABEÇALHO-->
        <div class="cabecalho">
            <h1 class="fontedetalhes"><?php echo $exibir['localnome']  ?></h1>
            <p>
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" height="0.75em" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" />
                    </svg>
                    Pirassununga, São Paulo, Brasil
                </span>
            <p> <?php echo nl2br($exibir['localenderecodescricao']); ?> </p>
            </p>
        </div>
        <div class="image-container">
            <div class="main-image" style="background-color: cornflowerblue;">
                <!-- Conteúdo da imagem à esquerda -->
                <img src="assets/apartamento.jpg" class="imagem-grid">
            </div>
            <div class="image" style="background-color: blueviolet;">
                <!-- Conteúdo da outra imagem 1 -->
                <img src="assets/foto_header_hoteis.jpg" class="imagem-grid">
            </div>
            <div class="image" class="imagem-grid">
                <img src="assets/hotel-fazenda.jpg" class="imagem-grid">
                <!-- Conteúdo da outra imagem 2 -->
            </div>
            <div class="image" class="imagem-grid">
                <!-- Conteúdo da outra imagem 3 -->
                <img src="assets/hotel-room-g680230bde_1280.jpg" class="imagem-grid">
            </div>
            <div class="image" class="imagem-grid">
                <img src="assets/motel.jpg" class="imagem-grid">
                <!-- Conteúdo da outra imagem 4 -->
            </div>
        </div>
        <!--##############################################-->
        <div class="container-endereco">
        </div>
        <!--##############################################-->
        <div class="container-informacoes">
            <div class="infos-lugar">
                <h2 style="text-align: start;">O que esse lugar oferece</h2>
                <div class="conteudo-informacoes">
                    <div class="infos-local">
                        <!--###-->
                        <p>
                            <span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M54.2 202.9C123.2 136.7 216.8 96 320 96s196.8 40.7 265.8 106.9c12.8 12.2 33 11.8 45.2-.9s11.8-33-.9-45.2C549.7 79.5 440.4 32 320 32S90.3 79.5 9.8 156.7C-2.9 169-3.3 189.2 8.9 202s32.5 13.2 45.2 .9zM320 256c56.8 0 108.6 21.1 148.2 56c13.3 11.7 33.5 10.4 45.2-2.8s10.4-33.5-2.8-45.2C459.8 219.2 393 192 320 192s-139.8 27.2-190.5 72c-13.3 11.7-14.5 31.9-2.8 45.2s31.9 14.5 45.2 2.8c39.5-34.9 91.3-56 148.2-56zm64 160a64 64 0 1 0 -128 0 64 64 0 1 0 128 0z" />
                                </svg></span> <span style="padding-left: 2%;">Wi-Fi</span>
                        </p>
                        <!--###-->

                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M346.3 271.8l-60.1-21.9L214 448H32c-17.7 0-32 14.3-32 32s14.3 32 32 32H544c17.7 0 32-14.3 32-32s-14.3-32-32-32H282.1l64.1-176.2zm121.1-.2l-3.3 9.1 67.7 24.6c18.1 6.6 38-4.2 39.6-23.4c6.5-78.5-23.9-155.5-80.8-208.5c2 8 3.2 16.3 3.4 24.8l.2 6c1.8 57-7.3 113.8-26.8 167.4zM462 99.1c-1.1-34.4-22.5-64.8-54.4-77.4c-.9-.4-1.9-.7-2.8-1.1c-33-11.7-69.8-2.4-93.1 23.8l-4 4.5C272.4 88.3 245 134.2 226.8 184l-3.3 9.1L434 269.7l3.3-9.1c18.1-49.8 26.6-102.5 24.9-155.5l-.2-6zM107.2 112.9c-11.1 15.7-2.8 36.8 15.3 43.4l71 25.8 3.3-9.1c19.5-53.6 49.1-103 87.1-145.5l4-4.5c6.2-6.9 13.1-13 20.5-18.2c-79.6 2.5-154.7 42.2-201.2 108z" />
                                </svg></span> <span style="padding-left: 2%;">Acesso à Praia</span>
                        </p>
                        <!--###-->

                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M135.2 117.4L109.1 192H402.9l-26.1-74.6C372.3 104.6 360.2 96 346.6 96H165.4c-13.6 0-25.7 8.6-30.2 21.4zM39.6 196.8L74.8 96.3C88.3 57.8 124.6 32 165.4 32H346.6c40.8 0 77.1 25.8 90.6 64.3l35.2 100.5c23.2 9.6 39.6 32.5 39.6 59.2V400v48c0 17.7-14.3 32-32 32H448c-17.7 0-32-14.3-32-32V400H96v48c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32V400 256c0-26.7 16.4-49.6 39.6-59.2zM128 288a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm288 32a32 32 0 1 0 0-64 32 32 0 1 0 0 64z" />
                                </svg>
                                </svg>
                            </span> <span style="padding-left: 2%;">Estacionamento Incluso</span>
                        </p>
                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M272 24c0-13.3-10.7-24-24-24s-24 10.7-24 24v5.2c0 34 14.4 66.4 39.7 89.2l16.4 14.8c15.2 13.7 23.8 33.1 23.8 53.5V200c0 13.3 10.7 24 24 24s24-10.7 24-24V186.8c0-34-14.4-66.4-39.7-89.2L295.8 82.8C280.7 69.1 272 49.7 272 29.2V24zM0 320v16V448c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V320c0-35.3-28.7-64-64-64H277.3c-13.8 0-27.3-4.5-38.4-12.8l-85.3-64C137 166.7 116.8 160 96 160c-53 0-96 43-96 96v64zm128 16v96c0 8.8-7.2 16-16 16s-16-7.2-16-16V336c0-8.8 7.2-16 16-16s16 7.2 16 16zm80-16c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16s-16-7.2-16-16V336c0-8.8 7.2-16 16-16zm112 16v96c0 8.8-7.2 16-16 16s-16-7.2-16-16V336c0-8.8 7.2-16 16-16s16 7.2 16 16zm80-16c8.8 0 16 7.2 16 16v96c0 8.8-7.2 16-16 16s-16-7.2-16-16V336c0-8.8 7.2-16 16-16zM360 0c-13.3 0-24 10.7-24 24v5.2c0 34 14.4 66.4 39.7 89.2l16.4 14.8c15.2 13.7 23.8 33.1 23.8 53.5V200c0 13.3 10.7 24 24 24s24-10.7 24-24V186.8c0-34-14.4-66.4-39.7-89.2L407.8 82.8C392.7 69.1 384 49.7 384 29.2V24c0-13.3-10.7-24-24-24zM64 128A64 64 0 1 0 64 0a64 64 0 1 0 0 128z" />
                                </svg>
                            </span> <span style="padding-left: 2%;">Jacuzzi</span>
                        </p>
                        <!--###-->

                    </div>
                    <div class="infos-local">

                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M240 144A96 96 0 1 0 48 144a96 96 0 1 0 192 0zm44.4 32C269.9 240.1 212.5 288 144 288C64.5 288 0 223.5 0 144S64.5 0 144 0c68.5 0 125.9 47.9 140.4 112h71.8c8.8-9.8 21.6-16 35.8-16H496c26.5 0 48 21.5 48 48s-21.5 48-48 48H392c-14.2 0-27-6.2-35.8-16H284.4zM144 80a64 64 0 1 1 0 128 64 64 0 1 1 0-128zM400 240c13.3 0 24 10.7 24 24v8h96c13.3 0 24 10.7 24 24s-10.7 24-24 24H280c-13.3 0-24-10.7-24-24s10.7-24 24-24h96v-8c0-13.3 10.7-24 24-24zM288 464V352H512V464c0 26.5-21.5 48-48 48H336c-26.5 0-48-21.5-48-48zM48 320h80 16 32c26.5 0 48 21.5 48 48s-21.5 48-48 48H160c0 17.7-14.3 32-32 32H64c-17.7 0-32-14.3-32-32V336c0-8.8 7.2-16 16-16zm128 64c8.8 0 16-7.2 16-16s-7.2-16-16-16H160v32h16zM24 464H200c13.3 0 24 10.7 24 24s-10.7 24-24 24H24c-13.3 0-24-10.7-24-24s10.7-24 24-24z" />
                                </svg>
                            </span> <span style="padding-left: 2%;">Cozinha</span>
                        </p>
                        <!--###-->

                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M309.5 178.4L447.9 297.1c-1.6 .9-3.2 2-4.8 3c-18 12.4-40.1 20.3-59.2 20.3c-19.6 0-40.8-7.7-59.2-20.3c-22.1-15.5-51.6-15.5-73.7 0c-17.1 11.8-38 20.3-59.2 20.3c-10.1 0-21.1-2.2-31.9-6.2C163.1 193.2 262.2 96 384 96h64c17.7 0 32 14.3 32 32s-14.3 32-32 32H384c-26.9 0-52.3 6.6-74.5 18.4zM160 160A64 64 0 1 1 32 160a64 64 0 1 1 128 0zM306.5 325.9C329 341.4 356.5 352 384 352c26.9 0 55.4-10.8 77.4-26.1l0 0c11.9-8.5 28.1-7.8 39.2 1.7c14.4 11.9 32.5 21 50.6 25.2c17.2 4 27.9 21.2 23.9 38.4s-21.2 27.9-38.4 23.9c-24.5-5.7-44.9-16.5-58.2-25C449.5 405.7 417 416 384 416c-31.9 0-60.6-9.9-80.4-18.9c-5.8-2.7-11.1-5.3-15.6-7.7c-4.5 2.4-9.7 5.1-15.6 7.7c-19.8 9-48.5 18.9-80.4 18.9c-33 0-65.5-10.3-94.5-25.8c-13.4 8.4-33.7 19.3-58.2 25c-17.2 4-34.4-6.7-38.4-23.9s6.7-34.4 23.9-38.4c18.1-4.2 36.2-13.3 50.6-25.2c11.1-9.4 27.3-10.1 39.2-1.7l0 0C136.7 341.2 165.1 352 192 352c27.5 0 55-10.6 77.5-26.1c11.1-7.9 25.9-7.9 37 0z" />
                                </svg> </span> <span style="padding-left: 2%;">Piscina</span>
                        </p>
                        <!--###-->

                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M258.6 0c-1.7 0-3.4 .1-5.1 .5C168 17 115.6 102.3 130.5 189.3c2.9 17 8.4 32.9 15.9 47.4L32 224H29.4C13.2 224 0 237.2 0 253.4c0 1.7 .1 3.4 .5 5.1C17 344 102.3 396.4 189.3 381.5c17-2.9 32.9-8.4 47.4-15.9L224 480v2.6c0 16.2 13.2 29.4 29.4 29.4c1.7 0 3.4-.1 5.1-.5C344 495 396.4 409.7 381.5 322.7c-2.9-17-8.4-32.9-15.9-47.4L480 288h2.6c16.2 0 29.4-13.2 29.4-29.4c0-1.7-.1-3.4-.5-5.1C495 168 409.7 115.6 322.7 130.5c-17 2.9-32.9 8.4-47.4 15.9L288 32V29.4C288 13.2 274.8 0 258.6 0zM256 224a32 32 0 1 1 0 64 32 32 0 1 1 0-64z" />
                                </svg> </span> <span style="padding-left: 2%;">Ar-condicionado</span>
                        </p>
                        <!--###-->
                        <p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M64 64V352H576V64H64zM0 64C0 28.7 28.7 0 64 0H576c35.3 0 64 28.7 64 64V352c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V64zM128 448H512c17.7 0 32 14.3 32 32s-14.3 32-32 32H128c-17.7 0-32-14.3-32-32s14.3-32 32-32z" />
                                </svg> </span> <span style="padding-left: 2%;">TV</span>
                        </p>
                        <!--###-->
                    </div>
                </div>
            </div>
            <div class="infos-descricao">
                <h2 style="text-align: start;">Descrição do Local</h2>
                <p style="text-align: justify;">
                    <?php echo nl2br($exibir['localdescricao']); ?>
                </p>
            </div>
        </div>
        <!--##############################################-->
        <div class="container-map">
            <h2>Localização</h2>
            <div id="map" class="column">
                <h1>Localização</h1>
            </div>
        </div>
        <div class="user-coments">
            <h1>Comentarios dos Usuários</h1>
            <?php
            include 'local_rating.php';
            foreach ($reviews as $review) {
                $authorProfilePhoto = $review['profile_photo_url'];
                $authorName = $review['author_name'];
                $reviewText = $review['text'];
                $reviewRating = $review['rating'];
                // Exiba a avaliação 
                echo "<img src='$authorProfilePhoto' alt='$authorName' style='width: 50px; height: 50px; border-radius: 50%;'<p><b>$authorName</b> avaliou com $reviewRating estrelas:</p>";
                echo "<p>$reviewText</p>";
            }
            ?>
        </div>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs&libraries=places&callback=initMap"></script>
        <script>
            function initMap() {
                var latitude = <?php echo $exibir['locallatitude']; ?>;
                var longitude = <?php echo $exibir['locallongitude']; ?>;

                var mapOptions = {
                    center: {
                        lat: latitude,
                        lng: longitude
                    },
                    zoom: 15
                };
                var map = new google.maps.Map(document.getElementById('map'), mapOptions);
                var marker = new google.maps.Marker({
                    position: {
                        lat: latitude,
                        lng: longitude
                    },
                    map: map,
                    title: '<?php echo $exibir['localnome']; ?>'
                });
            }
        </script>
    </div>
    <?php include 'rodape.html' ?>
</body>

</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/testehoteis.css">
    <link rel="stylesheet" type="text/css" href="gerar_css.php">

    <style>
    .minha-classe {
        background-image: url('assets/uploads/<?php echo $exibir['localfoto1']; ?>');
    }
</style>

</head>

<body>
    <?php
    session_start();
    include 'conexao.php';
    include 'menu.php';
    // Verifica se um ID foi passado pela URL
    $id_prod = !empty($_GET['id']) ? $_GET['id'] : null;

    // Monta a consulta SQL com base no valor de $id_prod
    $sql = "SELECT * FROM `local` WHERE categoriaid=1";
    if ($id_prod !== null) {
        $sql .= " AND localid='$id_prod'";
    }

    // Executa a consulta
    $consulta = $conexao->query($sql);
    $locais_abertos = [];
    $locais_fechados = [];

    // Obtém o resultado da consulta (pode ser vazio se não houver ID)
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);
    ?>


    <div id="main-container">


        <?php while ($exibir = $consulta->fetch(PDO::FETCH_ASSOC)) {
            include 'estabelecimento_estado.php' ?>
            <!--início card-->
            <ul>

                <li class="booking-card" style="background-image: url(assets/uploads/<?php echo $exibir ['localfoto1'];?>); ">

                    <div class="book-container ">

                        <div class="content">
                            <!--botao mais informações-->
                            <!-- <a href="">Mais Informações</a> -->
                            <div class="box-3">
                            <a href="detalhes.php?id=<?php echo $exibir ['localid'];?>">
                                <div class="btn btn-three">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="0.75em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z" />
                                    </svg>
                                        Detalhes
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div class="informations-container">

                        <h2 class="title"><?php echo ucwords($exibir['localnome']) ?></h2>

                        <p class="sub-title">
                            <svg class="icon" xmlns="http://www.w3.org/2000/svg" height="0.9em" style="color: gainsboro !important;" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" />
                            </svg>

                            <?php echo $exibir['localcidade']; ?>
                        </p>

                        <p class="price" >
                        <svg class="icon" xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>                            
                        <?php echo $exibir['localemail']; ?>
                        </p>


                        <div class="more-information">
                            <div class="info-and-date-container">
                                <div class="box info">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z" />
                                    </svg>
                                    <br>
                                    <p>(19) 99955-7828</p>
                                </div>
                                <div class="box date">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z" />
                                    </svg>
                                    <p><?php echo $exibir['localtelefone']; ?></p>
                                </div>
                            </div>
                            <div class="area-disclaimer" style="overflow: auto; padding: 5px;">
                                <p class="disclaimer" style="word-wrap: break-word;">
                                    <!--DESCRIÇÃO DO LOCAL-->
                                    <?php echo substr($exibir['localdescricao'], 0, 100) . "..."; ?>
                                </p>
                            </div>

                        </div>
                    </div>
                </li>
                <!--fim card-->
            <?php } ?>


    </div>

    <?php include './rodape.html' ?>
</body>

</html>
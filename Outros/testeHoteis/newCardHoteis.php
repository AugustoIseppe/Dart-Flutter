<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

    <style>

    </style>
    <title>Slider com 5 imagens</title>
</head>

<body>
    <div id="main-container">
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

        <?php while ($exibir = $consulta->fetch(PDO::FETCH_ASSOC)) {
            include 'estabelecimento_estado.php' ?>

            <div class="card">
                <div class="image-container">

                    <div class="slider">
                        <div><img src="assets/uploads/<?php echo $exibir['localfoto1']; ?>" alt="Imagem 1"></div>
                        <div><img src="assets/uploads/<?php echo $exibir['localfoto2']; ?>" alt="Imagem 2"></div>
                        <div><img src="assets/uploads/<?php echo $exibir['localfoto3']; ?>" alt="Imagem 3"></div>
                        <div><img src="assets/uploads/<?php echo $exibir['localfoto4']; ?>" alt="Imagem 4"></div>
                        <div><img src="assets/uploads/<?php echo $exibir['localfoto5']; ?>" alt="Imagem 5"></div>
                    </div>

                </div>

                <label class="favorite">
                    <input checked="" type="checkbox">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#000000">
                        <path d="M12 20a1 1 0 0 1-.437-.1C11.214 19.73 3 15.671 3 9a5 5 0 0 1 8.535-3.536l.465.465.465-.465A5 5 0 0 1 21 9c0 6.646-8.212 10.728-8.562 10.9A1 1 0 0 1 12 20z">
                        </path>
                    </svg>
                </label>

                <div class="content">
                    <div class="brand"><?php echo $exibir['localnome']; ?></div>
                    <div class="product-name"><?php echo $exibir['localcidade']; ?>, São Paulo, Brasil</div>


                    <!--LOCAL DESCRIÇÃO-->
                    <div class="color-size-container">
                        <?php
                        echo substr($exibir['localdescricao'], 0, 150) . "..."
                        ?>
                    </div>
                    <!-- FIM LOCAL DESCRIÇÃO-->


                    <!-- <div class="colors">
                    Contato: <span>(19)99955-2525</span>
                
                </div>
                <div class="sizes">
                  
                  <span>
                </span>
                </div> -->

                    <div class="rating">
                        <svg viewBox="0 0 99.498 16.286" xmlns="http://www.w3.org/2000/svg" class="svg four-star-svg">
                            <path fill="#fc0" transform="translate(-0.001 -1.047)" d="M9.357,1.558,11.282,5.45a.919.919,0,0,0,.692.5l4.3.624a.916.916,0,0,1,.509,1.564l-3.115,3.029a.916.916,0,0,0-.264.812l.735,4.278a.919.919,0,0,1-1.334.967l-3.85-2.02a.922.922,0,0,0-.855,0l-3.85,2.02a.919.919,0,0,1-1.334-.967l.735-4.278a.916.916,0,0,0-.264-.812L.279,8.14A.916.916,0,0,1,.789,6.576l4.3-.624a.919.919,0,0,0,.692-.5L7.71,1.558A.92.92,0,0,1,9.357,1.558Z" id="star-svgrepo-com"></path>
                            <path fill="#fc0" transform="translate(20.607 -1.047)" d="M9.357,1.558,11.282,5.45a.919.919,0,0,0,.692.5l4.3.624a.916.916,0,0,1,.509,1.564l-3.115,3.029a.916.916,0,0,0-.264.812l.735,4.278a.919.919,0,0,1-1.334.967l-3.85-2.02a.922.922,0,0,0-.855,0l-3.85,2.02a.919.919,0,0,1-1.334-.967l.735-4.278a.916.916,0,0,0-.264-.812L.279,8.14A.916.916,0,0,1,.789,6.576l4.3-.624a.919.919,0,0,0,.692-.5L7.71,1.558A.92.92,0,0,1,9.357,1.558Z" data-name="star-svgrepo-com" id="star-svgrepo-com-2"></path>
                            <path fill="#fc0" transform="translate(41.215 -1.047)" d="M9.357,1.558,11.282,5.45a.919.919,0,0,0,.692.5l4.3.624a.916.916,0,0,1,.509,1.564l-3.115,3.029a.916.916,0,0,0-.264.812l.735,4.278a.919.919,0,0,1-1.334.967l-3.85-2.02a.922.922,0,0,0-.855,0l-3.85,2.02a.919.919,0,0,1-1.334-.967l.735-4.278a.916.916,0,0,0-.264-.812L.279,8.14A.916.916,0,0,1,.789,6.576l4.3-.624a.919.919,0,0,0,.692-.5L7.71,1.558A.92.92,0,0,1,9.357,1.558Z" data-name="star-svgrepo-com" id="star-svgrepo-com-3"></path>
                            <path fill="#fc0" transform="translate(61.823 -1.047)" d="M9.357,1.558,11.282,5.45a.919.919,0,0,0,.692.5l4.3.624a.916.916,0,0,1,.509,1.564l-3.115,3.029a.916.916,0,0,0-.264.812l.735,4.278a.919.919,0,0,1-1.334.967l-3.85-2.02a.922.922,0,0,0-.855,0l-3.85,2.02a.919.919,0,0,1-1.334-.967l.735-4.278a.916.916,0,0,0-.264-.812L.279,8.14A.916.916,0,0,1,.789,6.576l4.3-.624a.919.919,0,0,0,.692-.5L7.71,1.558A.92.92,0,0,1,9.357,1.558Z" data-name="star-svgrepo-com" id="star-svgrepo-com-4"></path>
                            <path fill="#e9e9e9" transform="translate(82.431 -1.047)" d="M9.357,1.558,11.282,5.45a.919.919,0,0,0,.692.5l4.3.624a.916.916,0,0,1,.509,1.564l-3.115,3.029a.916.916,0,0,0-.264.812l.735,4.278a.919.919,0,0,1-1.334.967l-3.85-2.02a.922.922,0,0,0-.855,0l-3.85,2.02a.919.919,0,0,1-1.334-.967l.735-4.278a.916.916,0,0,0-.264-.812L.279,8.14A.916.916,0,0,1,.789,6.576l4.3-.624a.919.919,0,0,0,.692-.5L7.71,1.558A.92.92,0,0,1,9.357,1.558Z" data-name="star-svgrepo-com" id="star-svgrepo-com-5"></path>
                        </svg>
                        <span>(29,062)</span>
                    </div>
                </div>
                <div class="button-container">
                    <a href="detalhes.php?id=<?php echo $exibir ['localid'];?>">
                        <button class="buy-button button">+ informações</button>
                    </a>

                </div>
            </div>
        <?php } ?>

        <!-- INICIO SCRIPT-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.slider').slick({
                    autoplay: true, // Ativa o autoplay
                    autoplaySpeed: 2000, // Define o intervalo em milissegundos (5 segundos)
                    arrows: true, //insere as flechas laterais
                    dots: false,
                    prevArrow: '<div class="slick-prev">‹</div>',
                    nextArrow: '<div class="slick-next">›</div>'
                });
            });
        </script>
        <!-- FIM SCRIPT-->

    </div>

    <?php include 'rodape.html'; ?>
</body>

</html>
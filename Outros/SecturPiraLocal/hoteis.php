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
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="assets/css/hoteis.css">
    <title>Hoteis-Pirassununga</title>
    <style>
        .fa-location-dot {
            color: black;
            /* Cor vinho */
            font-size: 0.7em !important;
            text-transform: capitalize;
        }

        .fa fa-map-marker {
            text-transform: capitalize !important;
        }
        #cabecalho-imagem {
            background-image: url(hospedagem/backgroundsp.jpg);
        }
        #menu {
            background-color: #146C94;
            display: flex; 
            justify-content: center;
            align-items: center;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1;
        }
        #menu a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.78rem !important;
            padding: 0.2;
            margin: 1.5% !important;
            border-radius: 50px 20px;
        }
        #menu a:hover {
            background-color: #044A6B;
            color: #7CF09F;
            transition: 0.2s ; 
            transition-timing-function: linear;
        }
        .menu-bg {
            background-color: rgb(255, 255, 255);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>
    <?php
 
 $apiKey = 'AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs';
 

 $status_abertura = "Fechado"; // Define um valor padrão

 
    ?>


    <div id="cabecalho-imagem">
        <div class="infos-cabecalho">
            <h1>Hotéis em Pirassununga</h1>
            <p>Venha se hospedar em nossa cidade e experimente a
                hospitalidade do interior paulista!</p>
        </div>
    </div>



    <!--inicio container-->
    <div id="container">


    
       <?php  while ($exibir = $consulta->fetch(PDO::FETCH_ASSOC)) {
        include 'estabelecimento_estado.php' ?>
            <!--início card-->
            <div class="card-principal">

            <div class="imagem-hotel">
            <a href="detalhes.php?id=<?php echo $exibir ['localid'];?>">
    <img src="./assets/uploads/<?php echo $exibir['localfoto1']; ?>" alt="imagem-hotel">
    <?php if (!empty($exibir['localfoto5'])): ?>
        <img src="./assets/uploads/<?php echo $exibir['localfoto5']; ?>" class="circulo" alt="imagem-logo">
    <?php endif; ?>
</div>
<?php  ?>

                <div class="conteudo-card">
                    <!--strtoupper -> função para deixar o local nome em maiúsculo-->
                    <h1><?php echo strtoupper($exibir['localnome']); ?></h1>
                    <?php
                    
                    if (!empty($status_abertura)) {
                        $cor_texto = strtolower($status_abertura) == "aberto" ? "green" : "red";
                        echo "<span style='color: $cor_texto; font-weight:bolder; font-size:0.9rem;'>$status_abertura</span>.";
                    }
                    include 'local_rating.php'  ?>
                    <br>
                    <!-- <p><?php echo substr($exibir['localdescricao'], 0, 100); ?>...</p> -->
                    <br> 
                    <span class="fa-solid fa-location-dot"> <?php echo $exibir['localcidade']; ?></span>

<!-- Sistema de avaliaçoes do local -->
                    <p>Saiba mais</p>
                    
    </a>
                    <hr><br>

                    <!--REDES SOCIAIS DO ESTABELECIMENTO -> classes alteradas para não dar conflito -->
                    <div id="ftr_scl_md">
                        <?php if($exibir['localinstagram'] != null) { ?>
                        <a href="<?php echo $exibir ['localinstagram'];?>" class="ftr-lnk" id="instagram" style="text-decoration: none;">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                        <?php } ?>
                        <?php if($exibir['localfacebook'] != null) { ?>
                        <a href="<?php echo $exibir ['localfacebook'];?>" class="ftr-lnk" id="facebook" style="text-decoration: none;">
                            <i class="fa-brands fa-facebook-f"></i>
                        </a>
                        <?php } ?>
                       <?php if($exibir['localcelularwhatsapp'] != null) { ?>
                        <a href="#" class="ftr-lnk" id="whatsapp" style="text-decoration: none;">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                        <?php } ?>
                    </div>
                </div>

            </div>
            <!--fim card-->
   <?php } ?>

    </div>
    <!--fim container-->
    <footer>
        <?php include './rodape.html' ?>
    </div>
    
        <footer>

</body>

</html>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SecturPira</title>
    <link rel="stylesheet" href="./assets/css/index.css">
    <link rel="stylesheet" href="./assets/css/mobile.css">
    <link rel="stylesheet" href="./assets/css/menu-background.css">
    <link rel="stylesheet" href="./assets/css/cadastro-dropdown.css">
    <link rel="stylesheet" href=./assets/css/sidebar-balao.css>

    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--Fim Bootstrap-->

    <!-- Favicon/ Icone site -->
    <link rel="shortcut icon" type="imagex/png" href="./assets/img/web-icon.png">
    
    <style>

        .background-image {
            height: 77.9vh;
            /* 86.7 */
            position: relative;
        }

        .background-image::before {
            content: "";
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url(./background1-menu.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            z-index: 0;
            filter: brightness(90%);
        }

        .front-image {

            background: url(./front-image1.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: left 30%;
            width: 190vh;
            min-width: calc(5rem + 10%);
            height: 70vh;
            /* 78 */
            float: left;
            margin-left: 1%;
        }

        .background-image .front-image {
            position: relative;
        }

    </style>
</head>
<body>
    <?php
    session_start();
    ?>
    <header>
        <nav class="nav-bar background-image">

            <div class="nav-list front-image">
                <ul class="menu" id="menu">
                    <li class="nav-item"><a class="nav-link" href="Cidade.php">A Cidade</a></li>
                    <li class="nav-item"><a class="nav-link" href="OqFazer.php">O Que Fazer</a></li>
                    <li>
                    <button class="btn-btn light botao-menu-teste dropdown no-arrows" id="dropdownMenu2" style="cursor: pointer; margin-top: 0.430rem;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Onde Ficar</button>
                    
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2" style="margin-top: 0.45%;">
                       
                        <a class="dropdown-item" href="newCardHoteis.php">Hotel</a>
                        <a class="dropdown-item" href="moteis.php">Motel</a>
                        <a class="dropdown-item" href="apartamentos.php">Apartamentos</a>
                        <a class="dropdown-item" href="fazendas.php">Fazendas</a>
                        
                    </div>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="gastronomia.php">Gastronomia</a></li>
                    <li class="nav-item"><a class="nav-link" href="Eventos.php">Eventos</a></li>
                    <li class="nav-item"><a class="nav-link" href="news.php">Noticias</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Serviços</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Roteiros</a></li>
                    <li class="nav-item"><a class="nav-link" href="https://pirassununga.sp.gov.br/tag/comtur/">Comtur</a></li>
                    <!-- <li class="nav-item"><a class="nav-link" href="#">Mais</a></li> -->
                </ul>
                <div class="welcome">
                    <p>Bem-vindo à</p>
                    <h1>Pirassununga </h1>
                </div>
            </div>

            <!--Menu lateral-->
            <div class="side-bar">
                <a></a>

                <?php
                include 'conexao.php';
                if (empty($_SESSION['id'])) {
                ?>
                <!-- Icone de Login -->
                    <a href="login.php"><img src="assets/img/log-in.svg" width="25" height="25" style="cursor: pointer"></a>


                    <?php
                } else {
                    $consulta_admin = $conexao->prepare("SELECT usuariotipo from usuario WHERE usuarionome = '$_SESSION[username]'");
                    $consulta_admin->execute();
                    $retorno_consulta_admin = $consulta_admin->fetch();
                    $consulta_user = $conexao->query("SELECT usuarionome FROM usuario WHERE usuarioid='$_SESSION[id]'");

                    if ($retorno_consulta_admin["usuariotipo"] == 0) {
                        $exibe_user = $consulta_user->fetch(PDO::FETCH_ASSOC);
                    ?>

                        <!-- EXIBIÇÃO DO CADASTRO DE LOCAL PARA USUARIO CNPJ -->

                        <li><a class="no-hover"><img id="user" src="./assets/img/circle-user.svg" width="30" height="30"><span class="glyphicon glyphicon-user"></span></a></li>
                      

                        <!-- CNPJ -->
                        <p style="text-align:center; margin-bottom:0%; font-weight:bolder; color:white; text-shadow: 1px 1px 7px red;">CNPJ</p>
                        
                        <!-- Dropdown Cadastro -->
                        <div class="btn-group dropleft" style="display:flex; flex-direction:row; justify-content:center;">
                            <button class="btn-sm btn-primary dropdown" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-top:20%; background-color:firebrick; font-weight:bolder; border-style:none; outline:none; border-radius:12px;">Cadastro
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="margin-right: 7%"> <!--Dropdown -->

                                <a class="dropdown-item" class="testinho" href="lista_local.php">Local</a>
                                <!-- <div role="separator" class="dropdown-divider"></div> -->

                            </div>
                        </div>
                        <!-- EXIBIÇÃO DA OPÇÃO SAIR PARA USUARIO CNPJ -->
                        <li><a id="log-out" href="sair.php" style="text-decoration:none;">Sair</a></li>
                    <?php

                    } else { ?>

                        <!--/* EXIBIÇÃO DE LOGIN PARA USUARIO ADMINISTRADOR */-->
                        <li><a class="no-hover"><img id="user" src="./assets/img/user-admin.svg" width="30" height="30"><span class="glyphicon glyphicon-user"></span></a></li>
                        <p style="text-align:center; margin-bottom:0%; font-weight:bolder; color:white; text-shadow: 1px 1px 7px red;">ADMIN</p>
                        <!-- DROPDOWN CADASTRO ADMIN -->
                        <div class="btn-group dropleft" style="display:flex; flex-direction:row; justify-content:center;">
                            <button class="btn-sm btn-primary dropdown" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-top:20%; background-color:darkorange; font-weight:bolder; border-style:none; outline:none; border-radius:12px;">Cadastro
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="margin-right:7%"> <!--Dropdown -->
                                <a class="dropdown-item" href="visualizar_auditoria.php">Auditoria</a>
                                <a class="dropdown-item" href="lista_usuario.php">Usuário</a>
                                <a class="dropdown-item" href="lista_categoria.php">Categoria</a>
                                <a class="dropdown-item" href="lista_subcategoria.php">Subcategoria</a>
                                <a class="dropdown-item" href="lista_local.php">Local</a>
                                <a class="dropdown-item" href="lista_meioacessibilidade.php">Acessibilidade</a>
                                <a class="dropdown-item" href="lista_artesanato.php">Artesanato</a>
                                <a class="dropdown-item" href="lista_gastronomia.php">Gastronomia</a>
                                <a class="dropdown-item" href="lista_idioma.php">Idioma</a>
                                <a class="dropdown-item" href="lista_meioacesso.php">Meios de Acesso</a>
                                <a class="dropdown-item" href="lista_natureza.php">Natureza</a>
                                <a class="dropdown-item" href="lista_formapagto.php">Pagamento</a>
                                <a class="dropdown-item" href="lista_formasrecreacao.php">Recreação</a>
                                <a class="dropdown-item" href="lista_formassinalizacao.php">Sinalização</a>
                            </div>
                        </div>
                        <li><a id="log-out" href="sair.php" style="text-decoration: none;">Sair<span class="glyphicon glyphicon-off leave" ></span></a></li>
                        </ul>
                <?php }
                } ?>
                


                 <!-- Buscar -->
                <a>
                    <p class="balao1" id="balao1">
                        Buscar
                    </p>
                        <img class="icone" onmouseover="mostrarBalao1()" onmouseout="esconderBalao1()" src="assets/img/search.svg" width="25" height="25" style="cursor: pointer">
                </a>

               <!-- Mapa -->
                <a href="piramap.php">
                <p class="balao2" id="balao2">
                        Mapa
                    </p>
                    <img class="icone" onmouseover="mostrarBalao2()" onmouseout="esconderBalao2()" src="assets/img/map.svg" width="25" height="25" style="cursor: pointer;">
                </a>

                <!-- "Modo escuro" -->
                <a>
                <p class="balao3" id="balao3">
                        Escuro
                    </p>
                    <img id="myImage" class="icone" onmouseover="mostrarBalao3()" onmouseout="esconderBalao3()", onclick="darkMode()" src="assets/img/circle-half.svg" width="25" height="25" style="cursor: pointer;">
                </a>
                <!-- Acessibilidade -->
                <a>
                <p class="balao4" id="balao4">
                        Acessibilidade
                    </p>
                    <img class="icone" onmouseover="mostrarBalao4()" onmouseout="esconderBalao4()" src="assets/img/universal-access.svg" width="25" height="25" style="cursor: pointer;">
                </a>
            </div>
            <!--Fim Menu lateral-->

            <!--Menu Inferior-->
            <div class="bottom-menu">
                <ul>
                    <li><a id="temperatura" href="https://weather.com/weather/today/l/-21.99,-47.42?par=google" style="font-size:1.6em;"></a> <!-- API TEMPERATURA-->
                    </li>
            </div>
            <!--Fim Menu Inferior-->

            <!-- mobile -->
            <div class="mobile-menu-icon">
                <div class="mobile-menu-items">
                    <a><img src="./assets/img/person-fill.svg" width="22" height="22"></a>
                    <a><img src="./assets/img/search.svg" width="22" height="22"></a>
                    <a><img src="./assets/img/map.svg" width="22" height="22"></a>
                    <button onclick="menuShow()"><img class="icon" src="./assets/img/menu_white_36dp.svg"></button>
                </div>

                <div class="mobile-menu">
                    <ul>
                        <li> <a class="navbar-item" href="#">A cidade</a> </li>
                        <li> <a class="navbar-item" href="#">O Que Fazer</a></li>
                        <li><a class="navbar-item" href="#">Onde Ficar</a></li>
                        <li><a class="navbar-item" href="#">Gastronomia</a></li>
                        <li><a class="navbar-item" href="#">Eventos</a></li>
                        <li><a class="navbar-item" href="#">Noticias</a></li>
                        <li><a class="navbar-item" href="#">Serviços</a></li>
                        <li><a class="navbar-item" href="#">Roteiros</a></li>
                        <li><a class="navbar-item" href="#">Comtur</a></li>
                        <li><a class="navbar-item" href="#">Mais</a></li>
                    </ul>


                </div>
        </nav>

        <!--fim mobile-->
    </header>
       
   
    </div>
             <br><br><br>
            <?php include 'about_pirassununga.html'; ?>

            <br><br><br>

            <?php include 'conhecerMais/conhecer_mais.html'; ?>

            <br><br><br>

            <?php
            include 'servicos.html';
            ?>
            <br><br><br>
    <footer>
        <?php include './rodape.html' ?>
    </div>
    
        <footer>
            <script src="./assets/js/sidebar-balao.js"></script>
            <script src="./assets/js/script.js"></script>
            <script src="./assets/js/button.js"></script>
            <script src="./assets/js/goUp.js"></script>
            <script src="./assets/js/weather.js"></script>
            <script src="./assets/js/darkmode.js"></script>
            <script src="./assets/js/dropdown-scroll.js"></script>

</body>
</html>
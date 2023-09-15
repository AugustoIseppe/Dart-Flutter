<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Visualizar Local</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>

        .container-fluid {
            margin: 0 auto;
            padding: 5px;
            width: 80%;
            height: auto;
        }

        .responsive-table {
            border-style: solid;
            border-color: #00000;
            margin-top: 5%;
            margin-right: auto;
            margin-left: auto;
            font-size: 0.8em;
            font-family: sans-serif;
            background-color: snow;
        }

        .responsive-table thead th {
            padding: 10px 8px;
            background-color: #DCDCDC;
            color: #00000;
            text-align: center;
        }

        .container-modal {
            width: fit-content;
        }

        .modal-table {
            padding: 12px;
        }

        .modal-table th {
            width: 10%;
        }
        
        .modal-table td {
            width: fit-content;
        }

        .modal-th {
            padding: 8px;
            text-align: center;
            vertical-align: center;
        }

        .modal-td {
            padding: 8px;
            text-align: justify;
            vertical-align: top;
        }

        .modal-foto {
            margin-top: 15px;
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

        #button-cadastro {
            background-color: #FAFBFC;
            border: 1px solid rgba(27, 31, 35, 0.15);
            border-radius: 2px;
            box-shadow: rgba(27, 31, 35, 0.04) 0 1px 0, rgba(255, 255, 255, 0.25) 0 1px 0 inset;
            color: #24292E;
            cursor: pointer;
            font-family: "Segoe UI Emoji";
            font-size: 14px;
            font-weight: light;
            padding: 6px 16px;
            transition: background-color 0.2s cubic-bezier(0.3, 0, 0.5, 1);
            touch-action: manipulation;
            vertical-align: middle;
        }

        #button-cadastro:hover {
            background-color: #F3F4F6;
            text-decoration: none;
            transition-duration: 0.1s;
        }

    </style>
</head>

<body>
    <?php

        session_start();
        include 'conexao.php';
        include 'menu.php'; 

        $userid = $_SESSION['id'];
        $userRole = $_SESSION['admin'][0]; // Obter o primeiro elemento do array 'admin'

        // Verificar se o usuário é um administrador
        if ($userRole === "1") {
            $consulta = $conexao->query("SELECT * FROM local");
        } else {
            $consulta = $conexao->query("SELECT * FROM local WHERE usuarioid = '$userid'");
        }

    ?>

    <br><br>

    <div class="container-fluid">

        <table class="responsive-table" border="1">

            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Descriçao</th>
                    <th>Foto Principal</th>
                    <th>Expandir</th>
                </tr>
            </thead>

            <div class="row">
                
                <?php

                    while ($exibir = $consulta->fetch(PDO::FETCH_ASSOC)) {
                    
                ?>

                <tbody>
                    <tr style="border-bottom: transparent;">
                        <td style="padding: 8px; text-align: center; width: 10%;"><?php echo $exibir['localnome']; ?> </td>
                        <td style="padding: 8px; text-align: justify; vertical-align: top; width: 85%;"><?php echo $exibir['localdescricao'] ; ?> </td>
                        <td style="padding: 4px 4px 0px 4px;"><img src="assets/uploads/<?php echo $exibir['localfoto1']; ?>" width="100" height="80"></td>
                    
                        <td style="text-align: center; width: 5%;">

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<?php echo $exibir['localid'];?>">&plus;</button>

                        </td>
                    </tr>

                    <tr class="fade-out <?php if ($exibir['localstatus'] == 'S') echo 'hidden'; ?>" id="row-<?php echo $exibir['localid']; ?>">

                        <div class="container-modal">    
                    
                            <td>
                                <!-- The Modal -->
                                <div class="modal fade" id="myModal<?php echo $exibir['localid'];?>">
                                <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                
                                <!-- Modal Header -->
                                <div style="display: flex">
                                    <div style="margin: 0 auto;" class="modal-header">
                                        <h4>Informações do Local: <?php echo $exibir['localnome']; ?> </h4>
                                    </div>
                                    <div style="padding: 5px;">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>  
                                </div>
                                
                                <!-- Modal Body -->
                                <div class="modal-table">
                                    <table border="1">
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Nome do Local:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localnome'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Descrição Local:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localdescricao'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Descrição Endereço:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localenderecodescricao'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Rua:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localrua'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Número:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localnumero'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Bairro:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localbairro'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Cidade:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localcidade'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Estado:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localestado'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> CEP:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localcep'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Complemento:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localcomplemento'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Telefone:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localtelefone'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Latitude:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['locallatitude'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Longitude:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['locallongitude'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Posiçao Google:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localposicaogoogle'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Foto 1:</p>
                                            </th>
                                            <td>
                                            <center><a href="assets/uploads/<?php echo $exibir['localfoto1'] ; ?>" target="_blank"><p class="modal-foto"><img src="assets/uploads/<?php echo $exibir['localfoto1'] ; ?> "width="320px"></img></p></a></center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Foto 2:</p>
                                            </th>
                                            <td>
                                            <center><a href="assets/uploads/<?php echo $exibir['localfoto2'] ; ?>" target="_blank"><p class="modal-foto"><img src="assets/uploads/<?php echo $exibir['localfoto2'] ; ?> "width="320px"></img></p></a></center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Foto 3:</p>
                                            </th>
                                            <td>
                                            <center><a href="assets/uploads/<?php echo $exibir['localfoto3'] ; ?>" target="_blank"><p class="modal-foto"><img src="assets/uploads/<?php echo $exibir['localfoto3'] ; ?> "width="320px"></img></p></a></center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Foto 4:</p>
                                            </th>
                                            <td>
                                            <center><a href="assets/uploads/<?php echo $exibir['localfoto4'] ; ?>" target="_blank"><p class="modal-foto"><img src="assets/uploads/<?php echo $exibir['localfoto4'] ; ?> "width="320px"></img></p></a></center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Foto 5:</p>
                                            </th>
                                            <td>
                                            <center><a href="assets/uploads/<?php echo $exibir['localfoto5'] ; ?>" target="_blank"><p class="modal-foto"><img src="assets/uploads/<?php echo $exibir['localfoto5'] ; ?> "width="320px"></img></p></a></center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Website:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localwebsite'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> E-mail:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localemail'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Celular:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localcelular'];?></p>
                                            </td>
                                        </tr><tr>
                                            <th>
                                            <p class="modal-th"> WhatsApp:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localcelularwhatsapp'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Facebook:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localfacebook'];?></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                            <p class="modal-th"> Instagram:</p>
                                            </th>
                                            <td>
                                            <p class="modal-td"> <?php echo $exibir['localinstagram'];?></p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">

                                    <script>

                                        $(".modal-footer").on( "click", "#alterar", function() {
                                            window.open("form_alterar_local.php?id=<?php echo $exibir['localid']; ?>");
                                        });

                                        $(".modal-footer").on( "click", "#excluir", function() {
                                            window.open("excluir_local.php?id=<?php echo $exibir['localid']; ?>");
                                        });
                                        
                                    </script>
                                    
                                    <button type="button" id="alterar" class="btn btn-warning" style="outline:none; color: white;">Alterar</button>
                                    <button type="button" id="excluir" class="btn btn-danger" style="outline:none">Excluir</button>
                            
                                </div>
                            </td>
                        </div>
                    </tr>
                </tbody>

                <?php } ?>

            </div>

        </table>

        <br><br>

        <div style="text-align:center">
            <a href="form_local.php">
                <button id="button-cadastro">Novo Cadastro +</button>
            </a>
        </div>
    </div>
</body>
</html>
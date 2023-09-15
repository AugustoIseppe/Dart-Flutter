<!DOCTYPE html>
<html lang="pt-br">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Área Administrativa - Banco de Dados</title>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
            font-size: 0.87em;
            font-family: sans-serif;
            background-color: snow;
        }

        .responsive-table thead th {
            padding: 10px 8px;
            background-color: #DCDCDC;
            color: #00000;
            text-align: center;
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

        .navbar {
            margin-bottom: 0;  /* Barra de navegação superior */
        }

    </style>	

</head>
<body>

    <?php 

        session_start();
        
        include 'conexao.php';
        include 'menu.php'; 

        $consulta= $conexao->query('SELECT usuarionome, usuarioemail, usuarioid, usuariocnpj FROM usuario');

    ?>

    <br><br>

    <div class="container-fluid">
        
        <table class="responsive-table" border="1">
        
        <thead>
            <tr>
                <th style="text-align: center;">Usuário</th>
                <th style="text-align: center;">Email</th>
                <th style="text-align: center;">CNPJ</th>
                <th style="text-align: center; padding: 0px 15px;">Alterar</th>
                <th style="text-align: center;">Remover</th>
            </tr>
        </thead>
        
        <div class="row">

            <?php

                while ($exibir=$consulta->fetch(PDO::FETCH_ASSOC)) {

            ?>

                <tbody>
                    <tr>
                        <td style="padding: 8px; text-align: center; width: 10%;"><?php echo $exibir['usuarionome'] ; ?> </td>
                        <td style="padding: 8px; text-align: justify; vertical-align: top; width: 60%;"><?php echo $exibir['usuarioemail'] ; ?> </td>
                        <td style="padding: 8px 8px; text-align: center;"><?php echo $exibir['usuariocnpj'] ; ?> </td>
                        
                        <td style="text-align: center; padding: 15px 15px;">
                            <a href="form_alterar_usuario.php?id=<?php echo $exibir['usuarioid']; ?>">
                                <button class="btn btn-sm btn-warning" style="outline:none; border-radius: 2px;"><span class="glyphicon glyphicon-pencil"></span></button>
                            </a>
                        </td>
                        
                        <td style="text-align: center; padding: 18px 18px;">
                            <a href="excluir_usuario.php?id=<?php echo $exibir['usuarioid']; ?>"> 
                                <button class="btn btn-sm btn-danger" style="outline:none; border-radius: 2px;"><span class="glyphicon glyphicon-remove"></span></button>
                            </a>
                        </td>    
                    </tr> 
                </tbody>
                    
            <?php } ?> 
        
        </table>
        
        <br><br>

        <div style="text-align:center">
            <a href="form_usuario.php">
                <button id="button-cadastro">Novo Cadastro +</button>
            </a>
        </div>
        
        </div>
        
    </div>
</body>
</html>

	


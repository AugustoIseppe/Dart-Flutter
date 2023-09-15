<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Área Administrativa - Natureza</title>
    
    <link rel="stylesheet" href="./assets/css/button-lista.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    <style>

        .dark .row h3 {
            color: #CCC;
        }

        .nav-bar .nav-links li{
            height: 8px !important;
        }

        .navbar{
            margin-bottom: 0;
        }
            
    </style>
</head>

<body>
    <?php
        
        session_start();

        /* if (empty($_SESSION['adm']) || $_SESSION['adm']!=1) {
            header('location:index.php');
        } */
            
        include 'conexao.php';	
        include 'menu.php';
        
    ?>
        
    <div class="container-fluid">
    
        <div class="row">
        
            <div class="col-sm-4 col-sm-offset-4 text-center">
                
            <br><br><br><br><br>
                
                <h3>Área Administrativa - Natureza</h3>
                
                <hr>
                
                <a href="form_natureza.php">	
                    <button type="submit" id="button" class="btn btn-block btn-lg" style="font-size: 15px;">
                        
                        Cadastrar Natureza
                        
                    </button>
                </a>
                
                <a href="visualizar_natureza.php">
                    <button type="submit" id="button2" class="btn btn-block btn-lg" style="font-size: 15px;">
                        
                        Alterar / Excluir Natureza
                        
                    </button>
                </a>
                
                <hr>
                
            </div>

        </div>

    </div>    
</body>
</html>
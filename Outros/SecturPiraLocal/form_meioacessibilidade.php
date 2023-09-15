<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Área Administrativa - Cadastro</title>
		
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	

	<script src="jquery.mask.js"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

	<style>

		fieldset {
			margin-top: 1em 0;
			padding: 1em;
			background: #f8f8f8;
			border: 1px solid #ccc;
			border-radius: 10px;
		}
		label {
			display: block;
			cursor: pointer;
		}
		legend {
			font-weight: bold;
			text-align: center;
		}
		.navbar{
			margin-bottom: 0;
		}

	</style>
</head>

<body>
    <?php    
        
        session_start();  

        include 'conexao.php';	
        include 'menu.php';
        
    ?>

    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-4 col-sm-offset-4">

                <br><br>

                <legend>Inclusão de Acessibilidade</legend>
                
                <form method="post" action="incluir_meioacessibilidade.php" name="incluirAcessibilidade" enctype="multipart/form-data">
                <fieldset>

                    <div class="form-group">

                        <label for="acessibilidade">Meio de Acessibilidade <span style="color: red">*</span></label>

                        <input maxlength="50" name="acessibilidade" type="text" class="form-control" required>

                    </div>

                    <br>

                    <div style="text-align: center;">

                        <button type="submit" id="button" class="btn btn-lg btn-default">

                            <span class="glyphicon glyphicon-pencil"> Cadastrar </span>

                        </button>

                    </div>

                </fieldset>
                </form>
                <br>

            </div>

        </div>

    </div>
</body>
</html>
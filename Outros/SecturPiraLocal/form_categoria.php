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
		.display {
			display:inline;
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
				
				<legend>Inclusão de Categoria</legend>
				
				<form method="post" action="incluir_categoria.php" name="incluirCategoria" enctype="multipart/form-data">
				<fieldset>
				    
					<div class="form-group">
				
						<label for="categoria">Nome <span style="color: red">*</span></label>
						
						<input maxlength="30" name="categoria" type="text" class="form-control" required>
						
					</div>
					<div class="form-group">
				
					    <label for="descricao">Descrição</label>
					
						<textarea rows="5" maxlength="150" class="form-control" name="descricao"></textarea>
						
					</div>
					<div class="form-group">
				
					    <label for="sequencia">Sequência <span style="color: red">*</span></label>
					
						<input style="width:20%" name="sequencia" type="number" min="1" max="7" onkeydown="return false;" class="form-control" required>

					</div>
					<div name="radio"> 
						
						<div>

							<label for="menu" style="white-space:nowrap;">Mostrar no Menu ?</label>

							<input type="checkbox"  id="menu" name="menu" style="float:left;">

						</div>
                    
                	</div> 
					
					<br>
					
                    <div style="text-align: center;">
                    
						<button type="submit" id="button" class="btn btn-lg btn-default">
						
							<span class="glyphicon glyphicon-pencil "> Cadastrar </span>
						
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

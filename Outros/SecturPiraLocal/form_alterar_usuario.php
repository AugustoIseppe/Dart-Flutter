<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Área Administrativa - Alteração</title>
		
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
		
		$id_usuario = $_GET['id'];
		
		include 'conexao.php';
		include 'menu.php';
		
		$consulta = $conexao->query("SELECT * FROM usuario WHERE usuarioid='$id_usuario'");
		$exibir = $consulta->fetch(PDO::FETCH_ASSOC)
	
	?>

	<script src="./assets/js/validar_usuario.js"></script>

	<div class="container-fluid">
		
		<div class="row">
		
			<div class="col-sm-4 col-sm-offset-4">

				<br><br>
				
				<legend>Alteração de Usuario</legend>
				
				<form method="post" action="alterar_usuario.php?id=<?php echo $id_usuario; ?>" name="alterarUsuario" onsubmit="return validarCNPJ(cnpj)" enctype="multipart/form-data">
				<fieldset>

					<div class="form-group">
				
						<label for="nome">Nome <span style="color: red">*</span></label>

						<input maxlength="30" type="text" name="nome" value="<?php echo $exibir['usuarionome']; ?>" class="form-control"  required>
					
					</div>
					<div class="form-group">
					
						<label for="email">Email <span style="color: red">*</span></label>
					
						<input maxlength="70" type="email" name="email" value="<?php echo $exibir['usuarioemail']; ?>" class="form-control" required>
						
					</div>
					<div class="form-group">
				
						<label for="senha">Senha <span style="color: red">*</span></label>
						
						<input minlength="7" maxlength="20" type="text" name="senha" value="<?php echo $exibir['usuariosenha']; ?>" class="form-control" required>
						
					</div>
					<div class="form-group">
				
						<label for="cnpj">CNPJ <span style="color: red">*</span></label>
					
						<input maxlength="14" type="text" name="cnpj" id="cnpj" value="<?php echo $exibir['usuariocnpj']; ?>" class="form-control" onkeypress="$(this).mask('00.000.000/0000-00')" required></input>
					
					</div>
					
					<br>
	
					<div style="text-align: center;">

						<button type="submit" value="Submit" class="btn btn-lg btn-default">
							
							<span class="glyphicon glyphicon-pencil"> Alterar </span>
							
						</button>

					</div>	

					<!--	<fieldset>
							<hr>
						<h2>Usuário Administrador?</h2>

						<div>
						<input type="radio" id="Yes" name="drone" value="<?php echo $exibir['usuarioADM']; ?>"
								>
						<label for="Yes">Sim</label>
						</div>

						<div>
						<input type="radio" id="No" name="drone" value="<?php echo $exibir['usuarioADM']; ?>" checked>
						<label for="Nao">Não</label>
						</div>

					</fieldset>  -->
				
				</fieldset>
				</form>
				<br>
				
			</div>

		</div>

	</div>
</body>
</html>
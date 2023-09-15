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

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
		
		$id_local = $_GET['id'];
		
		include 'conexao.php';
		include 'menu.php';
		
		$consulta = $conexao->query("SELECT * FROM local WHERE localid='$id_local'");
		$exibir = $consulta->fetch(PDO::FETCH_ASSOC)
		
	?>

	<div class="container-fluid">
	
		<div class="row">
		
			<div class="col-sm-4 col-sm-offset-4">

				<br><br>
				
				<legend>Alteração de Local</legend>

				<form method="post" action="alterar_local.php?id=<?php echo $id_local; ?>" name="alterarLocal" enctype="multipart/form-data" required>
				<fieldset>

                    <div class="form-group">
				
                        <label for="nome">Nome <span style="color: red">*</span></label>
                
                        <input maxlength="50" name="nome" type="text" value="<?php echo $exibir['localnome']; ?>" class="form-control" required>
                
                    </div>				
                    <div class="form-group">
                
                        <label for="descricao">Descrição <span style="color: red">*</span></label>
                    
                        <textarea rows="5" maxlength="500" name="descricao" type="text" class="form-control" required><?php echo $exibir['localdescricao']; ?></textarea>
                        
                    </div>
                    <div class="form-group">
                
                        <label for="enderecodescricao">Descrição do Endereço</label>
            
                        <textarea rows="5" maxlength="300" name="enderecodescricao" type="text" class="form-control"><?php echo $exibir['localenderecodescricao']; ?></textarea>
                
                    </div>
                    <div class="form-group">
                
                        <label for="rua">Rua</label>
                        
                        <input maxlength="50" name="rua" type="text" value="<?php echo $exibir['localrua']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="numero">Número</label>
                        
                        <input maxlength="10" name="numero" type="text" value="<?php echo $exibir['localnumero']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="bairro">Bairro</label>
                        
                        <input maxlength="50" name="bairro" type="text" value="<?php echo $exibir['localbairro']; ?>" class="form-control">
                        
                    </div>                    
                    <div class="form-group">
                
                        <label for="cidade">Cidade</label>
                        
                        <input maxlength="50" name="cidade" type="text" value="<?php echo $exibir['localcidade']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="estado">Estado</label>
                        
                        <input maxlength="2" name="estado" type="text" value="<?php echo $exibir['localestado']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="cep">Cep</label>
                        
                        <input maxlength="11" name="cep" type="text" value="<?php echo $exibir['localcep']; ?>" class="form-control" onkeypress="$(this).mask('00000-000')">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="complemento">Complemento</label>
                        
                        <input maxlength="150" name="complemento" type="text" value="<?php echo $exibir['localcomplemento']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="telefone">Telefone</label>
                        
                        <input maxlength="15" name="telefone" type="text" value="<?php echo $exibir['localtelefone']; ?>" class="form-control" onkeypress="$(this).mask('(00) 0000-0000')">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="latitude">Latitude</label>
                        
                        <input maxlength="30" name="latitude" type="text" value="<?php echo $exibir['locallatitude']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="longitude">Longitude</label>
                        
                        <input maxlength="30" name="longitude" type="text" value="<?php echo $exibir['locallongitude']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
                
                        <label for="posicaogoogle">Posição no Google</label>
                        
                        <input maxlength="50" name="posicaogoogle" type="text" value="<?php echo $exibir['localposicaogoogle']; ?>" class="form-control">
                        
                    </div>
                    <div class="form-group">
				
						<label for="foto1"> Foto 1 <span style="color: red">*</span></label>
						
                        <input type="file" accept="image/*" class="form-control" name="foto1" required>
                        <br>
                        <center><img src="assets/uploads/<?php echo $exibir['localfoto1']; ?>" width="350px"></center>
                        
					</div>
                    <div class="form-group">
				
						<label for="foto2"> Foto 2 </label>
						
                        <input type="file" accept="image/*" class="form-control" name="foto2" id="foto2">
                        <br>
                        <center><img src="assets/uploads/<?php echo $exibir['localfoto2']; ?>" width="350px"></center>
                        
					</div>
                    <div class="form-group">
				                  
						<label for="foto3"> Foto 3 </label>
						
                        <input type="file" accept="image/*" class="form-control" name="foto3">
                        <br>
                        <center><img src="assets/uploads/<?php echo $exibir['localfoto3']; ?>" width="350px"></center>
                        
					</div>
					<div class="form-group">
				
						<label for="foto4"> Foto 4 </label>
						
                        <input type="file" accept="image/*" class="form-control" name="foto4">
                        <br>
                        <center><img src="assets/uploads/<?php echo $exibir['localfoto4']; ?>" width="350px"></center>	

					</div>
					<div class="form-group">
				
						<label for="foto5"> Foto 5 </label>
						
                        <input type="file" accept="image/*" class="form-control" name="foto5">
                        <br>
                        <center><img src="assets/uploads/<?php echo $exibir['localfoto5']; ?>" width="350px"></center>
                        
					</div>
					
					<hr>
					
					<div class="form-group">
				
						<label for="website">Website</label>
						
						<input maxlength="50" name="website" type="text" value="<?php echo $exibir['localwebsite']; ?>" class="form-control">
						
					</div>
					<div class="form-group">
				
						<label for="email">Email</label>
						
						<input maxlength="50" name="email" type="text" value="<?php echo $exibir['localemail']; ?>" class="form-control">
						
					</div>
					<div class="form-group">
				
						<label for="celular">Tel. Celular</label>
						
						<input maxlength="15" name="celular" type="text" value="<?php echo $exibir['localcelular']; ?>" class="form-control" onkeypress="$(this).mask('(00) 0 0000-0000')">
						
					</div>
					<div class="form-group">
				
						<label for="celularwhatsapp">Tel. Celular WhatsApp</label>
						
						<input maxlength="1" name="celularwhatsapp" type="text" value="<?php echo $exibir['localcelularwhatsapp']; ?>" class="form-control">
						
					</div>
					<div class="form-group">
				
						<label for="facebook">Facebook</label>
						
						<input maxlength="50" name="facebook" type="text" value="<?php echo $exibir['localfacebook']; ?>" class="form-control">
						
					</div>
					<div class="form-group">
				
						<label for="instagram">Instagram</label>
						
						<input maxlength="50" name="instagram" type="text" value="<?php echo $exibir['localinstagram']; ?>" class="form-control">
						
					</div>
					
					<br>
					
					<div style="text-align: center;">

				        <button type="submit" class="btn btn-lg btn-default" name="btn-enviar">
					
					        <span class="glyphicon glyphicon-pencil">Cadastrar</span>
					
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

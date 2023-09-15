<?php

	include 'conexao.php';
	
	$recebe_nome = $_POST['nome'];
	$recebe_email = $_POST['email'];
	$recebe_senha = $_POST['senha'];
	$recebe_cnpj = $_POST['cnpj'];

	try {

		$inserir=$conexao->query("INSERT INTO usuario (
			
			usuarionome, 
			usuarioemail, 
			usuariosenha, 
			usuariotipo, 
			usuariocnpj) 
			
			VALUES (
				
				'$recebe_nome',
				'$recebe_email',
				'$recebe_senha',
				'0',
				'$recebe_cnpj')
				
			");
		
		header('location:lista_usuario.php');

	} catch(PDOException $e) {
			
		echo $e->getMessage();
		
	}

?>

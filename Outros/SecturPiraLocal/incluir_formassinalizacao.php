<?php

	include 'conexao.php';

	$recebe_sinalizacao = $_POST['sinalizacao'];

	try {
		
		$inserir=$conexao->query("INSERT INTO formassinalizacao (
			
			sinalizacaonome) 
			
			VALUES (
				
				'$recebe_sinalizacao')
				
			");
		
		header('location:visualizar_formassinalizacao.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>

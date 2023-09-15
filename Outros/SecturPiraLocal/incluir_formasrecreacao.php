<?php

	include 'conexao.php';

	$recebe_recreacao = $_POST['recreacao'];

	try {
		
		$inserir=$conexao->query("INSERT INTO formasrecreacao (
			
			recreacaonome) 
			
			VALUES (
				
				'$recebe_recreacao')
				
			");
		
		header('location:visualizar_formasrecreacao.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
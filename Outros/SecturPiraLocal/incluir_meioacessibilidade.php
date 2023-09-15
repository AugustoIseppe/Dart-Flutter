<?php

	include 'conexao.php';

	$recebe_acessibilidade = $_POST['acessibilidade'];

	try {
		
		$inserir=$conexao->query("INSERT INTO meioacessibilidade (
			
			acessibilidadenome) 
			
			VALUES (
				
				'$recebe_acessibilidade')
				
			");
				
		header('location:visualizar_meioacessibilidade.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
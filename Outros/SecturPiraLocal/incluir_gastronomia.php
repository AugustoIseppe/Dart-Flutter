<?php

	include 'conexao.php';

	$recebe_nome = $_POST['gastronomia'];
	$recebe_descricao = $_POST['descricao'];            

	try {
		
		$inserir=$conexao->query("INSERT INTO gastronomia (
			
			gastronomianome, 
			gastronomiadescricao) 
			
			VALUES (
				
				'$recebe_nome', 
				'$recebe_descricao')
				
			");
				
		header('location:visualizar_gastronomia.php');

	}catch(PDOException $e) {
			
		echo $e->getMessage();
		
	}

?>	
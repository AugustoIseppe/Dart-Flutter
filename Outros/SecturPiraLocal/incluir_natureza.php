<?php

	include 'conexao.php';

	$recebe_categoria = $_POST['natureza'];

	try {
		
		$inserir=$conexao->query("INSERT INTO natureza (
			
			naturezanome) 
			
			VALUES (
				
				'$recebe_categoria')
				
			");
			
		header('location:visualizar_natureza.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
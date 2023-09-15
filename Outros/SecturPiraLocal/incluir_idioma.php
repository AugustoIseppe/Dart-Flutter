<?php

	include 'conexao.php';

	$recebe_idioma = $_POST['idioma'];

	try {
		
		$inserir=$conexao->query("INSERT INTO idioma (
			
			idiomanome) 
			
			VALUES (
				
				'$recebe_idioma')
				
			");
		
		header('location:visualizar_idioma.php');

	}catch(PDOException $e) {
			
		echo $e->getMessage();
		
	}

?>
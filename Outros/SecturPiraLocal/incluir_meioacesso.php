<?php

	include 'conexao.php';

	$recebe_meioacesso = $_POST['meioacesso'];

	try {
		
		$inserir=$conexao->query("INSERT INTO meioacesso (
			
			meioacessonome) 
			
			VALUES (
			
				'$recebe_meioacesso')
				
			");
		
		header('location:visualizar_meioacesso.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
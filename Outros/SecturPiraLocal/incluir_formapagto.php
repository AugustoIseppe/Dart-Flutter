<?php

	include 'conexao.php';

	$recebe_pagamento = $_POST['pagamento'];

	try {
		
		$inserir=$conexao->query("INSERT INTO formapagto (
			
			formapagtonome) 
			
			VALUES (
				
				'$recebe_pagamento')
				
			");
		
		header('location:visualizar_formapagto.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
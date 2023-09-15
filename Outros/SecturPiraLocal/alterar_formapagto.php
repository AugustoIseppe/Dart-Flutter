<?php

	include 'conexao.php';

	$id_pagamento = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM formapagto WHERE formapagtoid='$id_pagamento'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_pagamento = $_POST['pagamento'];

	try {
		
		$alterar = $conexao->query("UPDATE formapagto SET

		formapagtonome = '$recebe_pagamento'
		
		WHERE formapagtoid = '$id_pagamento'
		
		");
			
		header('location:visualizar_formapagto.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
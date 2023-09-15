<?php

	include 'conexao.php';

	$id_acessibilidade = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM meioacessibilidade WHERE acessibilidadeid='$id_acessibilidade'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_acessibilidade = $_POST['acessibilidade']; 

	try {
		
		$alterar = $conexao->query("UPDATE meioacessibilidade SET 
		
		acessibilidadenome = '$recebe_acessibilidade' 
		
		WHERE acessibilidadeid = '$id_acessibilidade'
		
		");
			
		header('location:visualizar_meioacessibilidade.php');

	} catch(PDOException $e) {
			
		echo $e->getMessage();

	}

?>
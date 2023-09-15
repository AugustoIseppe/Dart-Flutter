<?php

	include 'conexao.php';

	$id_natureza = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM natureza WHERE naturezaid='$id_natureza'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_natureza = $_POST['natureza'];

	try {
		
		$alterar = $conexao->query("UPDATE natureza SET
		
		naturezanome = '$recebe_natureza'

		WHERE naturezaid = '$id_natureza'
		
		");
		
		header('location:visualizar_natureza.php');
		
	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
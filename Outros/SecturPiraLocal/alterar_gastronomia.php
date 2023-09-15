<?php

	include 'conexao.php';

	$id_gastronomia = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM gastronomia WHERE gastronomiaid='$id_gastronomia'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_categoria = $_POST['gastronomia'];
	$recebe_descricao = $_POST['descricao'];

	try {
		
		$alterar = $conexao->query("UPDATE gastronomia SET
		
		gastronomianome = '$recebe_categoria',
		gastronomiadescricao = '$recebe_descricao'
		
		WHERE gastronomiaid = '$id_gastronomia'
		
		");
		
		header('location:visualizar_gastronomia.php');

	} catch(PDOException $e) {
				
		echo $e->getMessage();

	}

?>
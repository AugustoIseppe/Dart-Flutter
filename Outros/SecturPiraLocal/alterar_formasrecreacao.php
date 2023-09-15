<?php

	include 'conexao.php';

	$id_recreacao = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM formasrecreacao WHERE recreacaoid='$id_recreacao'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_recreacao = $_POST['recreacao'];

	try {
		
		$alterar = $conexao->query("UPDATE formasrecreacao SET
		
		recreacaonome = '$recebe_recreacao'

		WHERE recreacaoid = '$id_recreacao'
		
		");
		
		header('location:visualizar_formasrecreacao.php');
		
	} catch(PDOException $e) {
		
		echo $e->getMessage();

	}

?>
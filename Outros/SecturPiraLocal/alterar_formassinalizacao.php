<?php

	include 'conexao.php';

	$id_sinalizacao = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM formassinalizacao WHERE sinalizacaoid='$id_sinalizacao'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_sinalizacao = $_POST['sinalizacao'];

	try {
		
		$alterar = $conexao->query("UPDATE formassinalizacao SET
		
			sinalizacaonome = '$recebe_sinalizacao'

			WHERE sinalizacaoid = '$id_sinalizacao'
		
		");
		
		header('location:visualizar_formassinalizacao.php');

	} 

	catch(PDOException $e) {
		
		echo $e->getMessage();

	}

?>

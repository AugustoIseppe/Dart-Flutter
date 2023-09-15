<?php

	include 'conexao.php';

	$id_meioacesso = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM meioacesso WHERE meioacessoid='$id_meioacesso'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_meioacesso = $_POST['meioacesso'];

	try {
		
		$alterar = $conexao->query("UPDATE meioacesso SET
		
		meioacessonome = '$recebe_meioacesso'
		
		WHERE meioacessoid = '$id_meioacesso'
		
		");
		
		header('location:visualizar_meioacesso.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();

	}

?>
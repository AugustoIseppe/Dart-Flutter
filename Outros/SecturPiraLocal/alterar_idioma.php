<?php

	include 'conexao.php';

	$id_idioma = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM idioma WHERE idiomaid='$id_idioma'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_idioma = $_POST['idioma'];

	try {
		
		$alterar = $conexao->query("UPDATE idioma SET
		
		idiomanome = '$recebe_idioma'

		WHERE idiomaid = '$id_idioma'
		
		");
		
		header('location:visualizar_idioma.php');
		
	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>

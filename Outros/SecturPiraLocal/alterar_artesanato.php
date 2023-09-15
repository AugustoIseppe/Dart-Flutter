<?php

	include 'conexao.php';

	$id_artesanato = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM artesanato WHERE artesanatoid='$id_artesanato'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_artesanato = $_POST['artesanato'];
	$recebe_descricao = $_POST['descricao'];


	try {
		
		$alterar = $conexao->query("UPDATE artesanato SET
		
		artesanatonome = '$recebe_artesanato',
		artesanatodescricao = '$recebe_descricao'

		WHERE artesanatoid = '$id_artesanato'
		
		");
		
		header('location:visualizar_artesanato.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>

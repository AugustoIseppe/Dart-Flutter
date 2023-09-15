<?php

	include 'conexao.php';

	$recebe_artesanato = $_POST['artesanato'];
	$recebe_descricao = $_POST['descricao'];

	try {
		
		$inserir=$conexao->query("INSERT INTO artesanato (
			
		artesanatonome,
		artesanatodescricao) 
		
		VALUES (
			
			'$recebe_artesanato',
			'$recebe_descricao')
			
		");
		
	header('location:visualizar_artesanato.php');

	}catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
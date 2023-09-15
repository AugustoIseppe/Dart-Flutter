<?php

	include 'conexao.php';

	$recebe_categoria = $_POST['categoria'];
	$recebe_descricao = $_POST['descricao'];
	$recebe_sequencia = $_POST['sequencia'];
	$recebe_menu = $_POST['menu'];

	try {

		if(isset($_POST['menu'])) {
			
			$recebe_menu = 1;

		} else {
		
			$recebe_menu = 0;

		}

		$inserir=$conexao->query("INSERT INTO categoria (
			
			categorianome, 
			categoriadescricao, 
			categoriaseq, 
			categoriamenu) 
			
			VALUES (
				
				'$recebe_categoria',
				'$recebe_descricao',
				'$recebe_sequencia',
				'$recebe_menu')
				
			");
		
		header('location:visualizar_categoria.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>

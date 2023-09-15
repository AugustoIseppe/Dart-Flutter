<?php

	include 'conexao.php';

	$recebe_subcategoria = $_POST['subcategoria'];
	$recebe_descricao = $_POST['descricao'];

	$recebe_categoria = explode("_",$_POST['selecionarcategoria']); 
	$codigocategoria = $recebe_categoria[0];

	$descricaocategoria = $recebe_categoria[1];

	try {

		$inserir=$conexao->query("INSERT INTO subcategoria (
			
			subcategorianome, 
			subcategoriadescricao, 
			categoriaid) 
			
			VALUES (
				
				'$recebe_subcategoria',
				'$recebe_descricao',
				'$codigocategoria')
				
			");
				
		header('location:visualizar_subcategoria.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>
<?php

	include 'conexao.php';

	$id_subcategoria = $_GET['id'];

	$consulta = $conexao->query("SELECT * FROM subcategoria WHERE subcategoriaid='$id_subcategoria'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_subcategoria = $_POST['subcategoria'];
	$recebe_descricao = $_POST['descricao'];

	$recebe_categoria = explode("_",$_POST['selecionarcategoria']); 
	$codigocategoria = $recebe_categoria[0];
	

	try {
		
		$alterar = $conexao->query("UPDATE subcategoria SET
		
		subcategorianome = '$recebe_subcategoria',
		subcategoriadescricao = '$recebe_descricao',
		categoriaid = '$codigocategoria'
		
		WHERE subcategoriaid = '$id_subcategoria';
		
		");
		
		header('location:visualizar_subcategoria.php');
		
	} catch(PDOException $e) {
			
		echo $e->getMessage();
		
	}

?>
<?php

	include 'conexao.php';
	include 'resize-class.php';

	$id_categoria = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM categoria WHERE categoriaid='$id_categoria'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

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

		$alterar = $conexao->query("UPDATE categoria SET
		
		categorianome = '$recebe_categoria',
		categoriadescricao = '$recebe_descricao',
		categoriaseq = '$recebe_sequencia',
		categoriamenu = '$recebe_menu'

		WHERE categoriaid = '$id_categoria'
		
		");
		
		header('location:visualizar_categoria.php');

	} catch(PDOException $e) {
		
		echo $e->getMessage();
		
	}

?>

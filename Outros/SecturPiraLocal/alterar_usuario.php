<?php

	include 'conexao.php';

	$id_usuario = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM usuario WHERE usuarioid='$id_usuario'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	$recebe_nome = $_POST['nome'];
	$recebe_senha = $_POST['senha'];
	$recebe_email = $_POST['email'];
	$recebe_cnpj = $_POST['cnpj'];
	// $recebe_admin = $_POST['admin'];

	try {
		
		$alterar = $conexao->query("UPDATE usuario SET
		
		usuarionome = '$recebe_nome',
		usuariosenha = '$recebe_senha',
		usuarioemail= '$recebe_email',
		usuariocnpj = '$recebe_cnpj'
		
		WHERE usuarioid = '$id_usuario'
		
		");
		
		header('location:visualizar_usuario.php');

	} 
	
	catch(PDOException $e) {
		
		echo $e->getMessage();

	}

?>

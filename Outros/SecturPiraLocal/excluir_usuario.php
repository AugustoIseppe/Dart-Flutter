<?php

    session_start();
    
    include 'conexao.php';

    $id_usuario = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM usuario WHERE usuarioid='$id_usuario'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM usuario WHERE usuarioid='$id_usuario'");

    header('location:visualizar_usuario.php');

?>

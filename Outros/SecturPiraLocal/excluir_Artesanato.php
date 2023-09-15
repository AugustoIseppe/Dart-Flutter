<?php

    session_start();
    
    include 'conexao.php';

    $id_artesanato = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM artesanato WHERE artesanatoid='$id_artesanato'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM artesanato WHERE artesanatoid='$id_artesanato'");

    header('location:visualizar_artesanato.php');

?>

<?php

    session_start();

    include 'conexao.php';

    $id_gastronomia=$_GET['id'];

    $consulta = $conexao->query("SELECT * FROM gastronomia WHERE gastronomiaid='$id_gastronomia'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM gastronomia WHERE gastronomiaid='$id_gastronomia'");

    header('location:visualizar_gastronomia.php');

?>
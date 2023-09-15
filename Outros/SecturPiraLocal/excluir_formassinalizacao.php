<?php

    session_start();
    
    include 'conexao.php';

    $id_sinal = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM formassinalizacao WHERE sinalizacaoid='$id_sinal'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM formassinalizacao WHERE sinalizacaoid='$id_sinal'");

    header('location:visualizar_formassinalizacao.php');

?>

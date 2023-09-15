<?php

    session_start();
    
    include 'conexao.php';

    $id_recreacao=$_GET['id'];

    $consulta = $conexao->query("SELECT * FROM formasrecreacao WHERE recreacaoid='$id_recreacao'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM formasrecreacao WHERE recreacaoid='$id_recreacao'");

    header('location:visualizar_formasrecreacao.php'); 

?>
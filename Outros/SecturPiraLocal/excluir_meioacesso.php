<?php

    session_start();

    include 'conexao.php';

    $id_meioacesso = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM meioacesso WHERE meioacessoid='$id_meioacesso'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM meioacesso WHERE meioacessoid='$id_meioacesso'");

    header('location:visualizar_meioacesso.php');

?>
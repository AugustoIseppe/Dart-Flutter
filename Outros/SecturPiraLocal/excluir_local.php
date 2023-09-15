<?php

    session_start();
    include 'conexao.php';

    $id_local = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM local WHERE localid='$id_local'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM local WHERE localid='$id_local'");

    header('location:visualizar_local.php');

?>
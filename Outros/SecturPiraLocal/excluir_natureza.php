<?php

    session_start();

    include 'conexao.php';

    $id_natureza = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM natureza WHERE naturezaid='$id_natureza'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM natureza WHERE naturezaid='$id_natureza'");

    header('location:visualizar_natureza.php');

?>
<?php

    session_start();
    
    include 'conexao.php';

    $id_categoria = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM categoria WHERE categoriaid='$id_categoria'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM categoria WHERE categoriaid='$id_categoria'");

    header('location:visualizar_categoria.php');

?>

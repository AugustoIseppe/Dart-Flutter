<?php

    session_start();

    include 'conexao.php';

    $id_subcategoria = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM subcategoria WHERE subcategoriaid='$id_subcategoria'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM subcategoria WHERE subcategoriaid='$id_subcategoria'");

    header('location:visualizar_subcategoria.php');

?>
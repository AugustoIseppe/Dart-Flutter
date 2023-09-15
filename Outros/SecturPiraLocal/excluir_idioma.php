<?php

    session_start();

    include 'conexao.php';

    $id_idioma = $_GET['id'];

    $consulta = $conexao->query("SELECT * FROM idioma WHERE idiomaid='$id_idioma'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM idioma WHERE idiomaid='$id_idioma'");

    header('location:visualizar_idioma.php');

?>

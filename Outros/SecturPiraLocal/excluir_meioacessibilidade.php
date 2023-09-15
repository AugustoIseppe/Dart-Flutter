<?php

    session_start();

    include 'conexao.php';

    $id_acessibilidade=$_GET['id'];

    $consulta = $conexao->query("SELECT * FROM meioacessibilidade WHERE acessibilidadeid='$id_acessibilidade'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM meioacessibilidade WHERE acessibilidadeid='$id_acessibilidade'");

    header('location:visualizar_meioacessibilidade.php');

?>
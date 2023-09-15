<?php

    session_start();

    include 'conexao.php';

    $id_pagamento=$_GET['id'];

    $consulta = $conexao->query("SELECT * FROM formapagto WHERE formapagtoid='$id_pagamento'");
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);

    $excluir = $conexao->query("DELETE FROM formapagto WHERE formapagtoid='$id_pagamento'");

    header('location:visualizar_formapagto.php');

?>
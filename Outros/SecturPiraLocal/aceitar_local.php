<?php
include 'conexao.php';

if (isset($_GET['id'])) {
    $local_id = $_GET['id'];

    try {
        $alterar = $conexao->query("UPDATE local SET localstatus = 'S' WHERE localid = '$local_id'");
        
        echo "Registro aprovado com sucesso!";
    } catch(PDOException $e) {
        echo "Erro ao aprovar o registro: " . $e->getMessage();
    }
} else {
    echo "ID do registro não fornecido.";
}

header('location: visualizar_auditoria.php');
?>

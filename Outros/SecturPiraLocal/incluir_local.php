<?php
session_start();
include 'conexao.php';
include 'resize-class.php';
$recebe_categoria = explode("_",$_POST['selecionarcategoria']); 
	

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $recebe_usuarioid = $_SESSION['id'];
    $codigocategoria = $recebe_categoria[0];
    $recebe_status = "N";
    $recebe_nome = $_POST['nome'];
    $recebe_descricao = $_POST['descricao'];
    $recebe_enderecodescricao = $_POST['enderecodescricao'];
    $recebe_rua = $_POST['rua'];
    $recebe_numero = $_POST['numero'];
    $recebe_bairro = $_POST['bairro'];
    $recebe_cidade = $_POST['cidade'];
    $recebe_estado = $_POST['estado'];
    $recebe_cep = $_POST['cep'];
    $recebe_complemento = $_POST['complemento'];
    $recebe_telefone = $_POST['telefone'];
    $recebe_latitude = $_POST['latitude'];
    $recebe_longitude = $_POST['longitude'];
    $recebe_posicaogoogle = $_POST['posicaogoogle'];
    $recebe_foto1 = $_FILES['foto1'];
    $recebe_foto2 = $_FILES['foto2'];
    $recebe_foto3 = $_FILES['foto3'];
    $recebe_foto4 = $_FILES['foto4'];
    $recebe_foto5 = $_FILES['foto5'];
    $recebe_website = $_POST['website'];
    $recebe_email = $_POST['email'];
    $recebe_celular = $_POST['celular'];
    $recebe_celularwhatsapp = $_POST['celularwhatsapp'];
    $recebe_facebook = $_POST['facebook'];
    $recebe_instagram = $_POST['instagram'];

    $recebe_placeId = $_POST['place-id'];


    $destino = "assets/uploads/";

    $extencao1 = pathinfo($recebe_foto1['name'], PATHINFO_EXTENSION);
    $img_nome1 = md5(uniqid(time())) . "." . $extencao1;

    if (!empty($_FILES['foto2']['name'])) {
        $extencao2 = pathinfo($recebe_foto2['name'], PATHINFO_EXTENSION);
        $img_nome2 = md5(uniqid(time())) . "." . $extencao2;
    }

    if (!empty($_FILES['foto3']['name'])) {
        $extencao3 = pathinfo($recebe_foto3['name'], PATHINFO_EXTENSION);
        $img_nome3 = md5(uniqid(time())) . "." . $extencao3;
    }

    if (!empty($_FILES['foto4']['name'])) {
        $extencao4 = pathinfo($recebe_foto4['name'], PATHINFO_EXTENSION);
        $img_nome4 = md5(uniqid(time())) . "." . $extencao4;
    }

    if (!empty($_FILES['foto5']['name'])) {
        $extencao5 = pathinfo($recebe_foto5['name'], PATHINFO_EXTENSION);
        $img_nome5 = md5(uniqid(time())) . "." . $extencao5;
    }


    try {
        $stmt = $conexao->prepare("INSERT INTO `local` (
            categoriaid,
            usuarioid,
            localstatus,
            localnome, 
            localdescricao, 
            localenderecodescricao,
            localrua,
            localnumero,
            localbairro,
            localcidade,
            localestado,
            localcep,
            localcomplemento,
            localtelefone,
            locallatitude,
            locallongitude,
            localposicaogoogle,
            localfoto1,
            localfoto2,
            localfoto3,
            localfoto4,
            localfoto5,
            localwebsite,
            localemail,
            localcelular,
            localcelularwhatsapp,
            localfacebook,
            localinstagram,
            place_id
        ) VALUES (
            :codigocategoria,
            :recebe_usuarioid,
            :recebe_status,
            :recebe_nome,
            :recebe_descricao,
            :recebe_enderecodescricao,
            :recebe_rua,
            :recebe_numero,
            :recebe_bairro,
            :recebe_cidade,
            :recebe_estado,
            :recebe_cep,
            :recebe_complemento,
            :recebe_telefone,
            :recebe_latitude,
            :recebe_longitude,
            :recebe_posicaogoogle,
            :img_nome1,
            :img_nome2,
            :img_nome3,
            :img_nome4,
            :img_nome5,
            :recebe_website,
            :recebe_email,
            :recebe_celular,
            :recebe_celularwhatsapp,
            :recebe_facebook,
            :recebe_instagram,
            :recebe_placeId
        )");

      // Defina os valores para a execução da declaração
$valores = array(
    ':codigocategoria' => $codigocategoria,
    ':recebe_usuarioid' => $recebe_usuarioid,
    ':recebe_status' => $recebe_status,
    ':recebe_nome' => $recebe_nome,
    ':recebe_descricao' => $recebe_descricao,
    ':recebe_enderecodescricao' => $recebe_enderecodescricao,
    ':recebe_rua' => $recebe_rua,
    ':recebe_numero' => $recebe_numero,
    ':recebe_bairro' => $recebe_bairro,
    ':recebe_cidade' => $recebe_cidade,
    ':recebe_estado' => $recebe_estado,
    ':recebe_cep' => $recebe_cep,
    ':recebe_complemento' => $recebe_complemento,
    ':recebe_telefone' => $recebe_telefone,
    ':recebe_latitude' => $recebe_latitude,
    ':recebe_longitude' => $recebe_longitude,
    ':recebe_posicaogoogle' => $recebe_posicaogoogle,
    ':img_nome1' => $img_nome1,
    ':img_nome2' => $img_nome2,
    ':img_nome3' => $img_nome3,
    ':img_nome4' => $img_nome4,
    ':img_nome5' => $img_nome5,
    ':recebe_website' => $recebe_website,
    ':recebe_email' => $recebe_email,
    ':recebe_celular' => $recebe_celular,
    ':recebe_celularwhatsapp' => $recebe_celularwhatsapp,
    ':recebe_facebook' => $recebe_facebook,
    ':recebe_instagram' => $recebe_instagram,

    ':recebe_placeId' => $recebe_placeId
);


        // Execute a declaração com os valores apropriados
        $stmt->execute($valores);

        move_uploaded_file($recebe_foto1['tmp_name'], $destino . $img_nome1);
    if (!empty($_FILES['foto2']['name'])) {
        move_uploaded_file($recebe_foto2['tmp_name'], $destino . $img_nome2);
    }
    if (!empty($_FILES['foto3']['name'])) {
        move_uploaded_file($recebe_foto3['tmp_name'], $destino . $img_nome3);
    }
    if (!empty($_FILES['foto4']['name'])) {
        move_uploaded_file($recebe_foto4['tmp_name'], $destino . $img_nome4);
    }
    if (!empty($_FILES['foto5']['name'])) {
        move_uploaded_file($recebe_foto5['tmp_name'], $destino . $img_nome5);
    }

        header('location:visualizar_local.php');
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
} else {
    echo "O formulário não foi enviado.";
}
?>

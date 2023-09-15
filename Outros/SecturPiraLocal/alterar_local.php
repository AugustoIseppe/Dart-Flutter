<?php

	include 'conexao.php';
	include 'resize-class.php';

	$id_local = $_GET['id'];
	$consulta = $conexao->query("SELECT * FROM local WHERE localid='$id_local'");
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);

	// $recebe_status = $_POST['status'];
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

    $destino = "assets/uploads/";

    if (!empty($recebe_foto1['name'])) {

        preg_match("/\.(jpg|jpeg|png|gif){1}$/i",$recebe_foto1['name'],$extencao1);
        $img_nome1 = md5(uniqid(time())).".".$extencao1[1];
    
        $upload_foto1=1;
    
    } else {
        
        $img_nome1=$exibe['localfoto1'];
        $upload_foto1=0;
        
    }
    
    if (!empty($recebe_foto2['name'])) {

        preg_match("/\.(jpg|jpeg|png|gif){1}$/i",$recebe_foto2['name'],$extencao2);
        $img_nome2 = md5(uniqid(time())).".".$extencao2[1];

        $upload_foto2=1;
    
    } else {
        
        $img_nome2=$exibe['localfoto2'];
        $upload_foto2=0;
        
    }
    
    if (!empty($recebe_foto3['name'])) {
    
        preg_match("/\.(jpg|jpeg|png|gif){1}$/i",$recebe_foto3['name'],$extencao3);
        $img_nome3 = md5(uniqid(time())).".".$extencao3[1];

        $upload_foto3=1;
    
    } else {
        
        $img_nome3=$exibe['localfoto3'];
        $upload_foto3=0;
        
    }

    if (!empty($recebe_foto4['name'])) {
    
        preg_match("/\.(jpg|jpeg|png|gif){1}$/i",$recebe_foto4['name'],$extencao4);
        $img_nome4 = md5(uniqid(time())).".".$extencao4[1];
        
        $upload_foto4=1;
    
    } else {
        
        $img_nome4=$exibe['localfoto4'];
        $upload_foto4=0;
        
    }

    if (!empty($recebe_foto5['name'])) {
    
        preg_match("/\.(jpg|jpeg|png|gif){1}$/i",$recebe_foto5['name'],$extencao5);
        $img_nome5 = md5(uniqid(time())).".".$extencao5[1];

        $upload_foto5=1;
    
    } else {
        
        $img_nome5=$exibe['localfoto5'];
        $upload_foto5=0;
        
    } 

	try {
		
        if(!isset($_POST['status'])) {
			
			$recebe_status = "N"; // Status de Aprovação

		} else { 
		
			$recebe_status = "S"; // Status de Aprovação
        
		}

		$alterar = $conexao->query("UPDATE local SET
		
            /*localstatus = '$recebe_status',*/
            localnome = '$recebe_nome',
            localdescricao = '$recebe_descricao',
            localenderecodescricao = '$recebe_enderecodescricao',
            localrua = '$recebe_rua',
            localnumero = '$recebe_numero',
            localbairro = '$recebe_bairro',
            localcidade = '$recebe_cidade',
            localestado = '$recebe_estado',
            localcep = '$recebe_cep',
            localcomplemento = '$recebe_complemento',
            localtelefone = '$recebe_telefone',
            locallatitude = '$recebe_latitude',
            locallongitude = '$recebe_longitude',
            localposicaogoogle = '$recebe_posicaogoogle',
            localfoto1 = '$img_nome1',
            localfoto2 = '$img_nome2',
            localfoto3 = '$img_nome3',
            localfoto4 = '$img_nome4',
            localfoto5 = '$img_nome5',
            localwebsite = '$recebe_website',
            localemail = '$recebe_email',
            localcelular = '$recebe_celular',
            localcelularwhatsapp = '$recebe_celularwhatsapp',
            localfacebook = '$recebe_facebook',
            localinstagram = '$recebe_instagram'

			WHERE localid = '$id_local'
		
		");

        if ($upload_foto1==1) {
                    
            move_uploaded_file($recebe_foto1['tmp_name'], $destino.$img_nome1);             
            $resizeObj = new resize($destino.$img_nome1);
            $resizeObj -> resizeImage(1000, 940, 'crop');
            $resizeObj -> saveImage($destino.$img_nome1, 100);
            
        }

        if ($upload_foto2==1) {
            
            move_uploaded_file($recebe_foto2['tmp_name'], $destino.$img_nome2);             
            $resizeObj = new resize($destino.$img_nome2);
            $resizeObj -> resizeImage(1000, 940, 'crop');
            $resizeObj -> saveImage($destino.$img_nome2, 100);
   
        }

        if ($upload_foto3==1) {
            
            move_uploaded_file($recebe_foto3['tmp_name'], $destino.$img_nome3);             
            $resizeObj = new resize($destino.$img_nome3);
            $resizeObj -> resizeImage(1000, 940, 'crop');
            $resizeObj -> saveImage($destino.$img_nome3, 100);
   
        }
            
        if ($upload_foto4==1) {
            
            move_uploaded_file($recebe_foto4['tmp_name'], $destino.$img_nome4);             
            $resizeObj = new resize($destino.$img_nome4);
            $resizeObj -> resizeImage(1000, 940, 'crop');
            $resizeObj -> saveImage($destino.$img_nome4, 100);
   
        }
            
        if ($upload_foto5==1) {
            
            move_uploaded_file($recebe_foto5['tmp_name'], $destino.$img_nome5);             
            $resizeObj = new resize($destino.$img_nome5);
            $resizeObj -> resizeImage(1000, 940, 'crop');
            $resizeObj -> saveImage($destino.$img_nome5, 100);
   
        }
		
		header('location:visualizar_local.php');

	} 

	catch(PDOException $e) {
		
		echo $e->getMessage();

	}

?>
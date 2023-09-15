<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/testehoteis.css">
    <link rel="stylesheet" type="text/css" href="gerar_css.php">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet" />

    <style>
        .minha-classe {
            background-image: url('assets/uploads/<?php echo $exibir['localfoto1']; ?>');
        }
    </style>

</head>

<body>
    <?php
    session_start();
    include 'conexao.php';
    include 'menu.php';
    // Verifica se um ID foi passado pela URL
    $id_prod = !empty($_GET['id']) ? $_GET['id'] : null;

    // Monta a consulta SQL com base no valor de $id_prod
    $sql = "SELECT * FROM `local` WHERE categoriaid=1";
    if ($id_prod !== null) {
        $sql .= " AND localid='$id_prod'";
    }

    // Executa a consulta
    $consulta = $conexao->query($sql);
    $locais_abertos = [];
    $locais_fechados = [];

    // Obtém o resultado da consulta (pode ser vazio se não houver ID)
    $exibir = $consulta->fetch(PDO::FETCH_ASSOC);
    ?>


    <div id="main-container">


        <?php while ($exibir = $consulta->fetch(PDO::FETCH_ASSOC)) {
            include 'estabelecimento_estado.php' ?>
            <!--início card-->

            <div class="max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
                <a href="#">
                    <img class="rounded-t-lg" src="assets/uploads/<?php echo $exibir['localfoto1']; ?>" alt="" />
                </a>
                <div class="p-5">
                    <a href="#">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                            <?php echo $exibir['localnome']?>
                        </h5>
                    </a>
                    <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
                        <?php
                            echo substr($exibir['localdescricao'], 0, 80) . "...";
                        ?>
                    </p>
                    <a href="detalhes.php?id=<?php echo $exibir ['localid'];?>" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Saiba mais
                        <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                        </svg>
                    </a>
                </div>
            </div>

            <!--fim card-->
        <?php } ?>


    </div>

    <?php include './rodape.html' ?>
</body>

</html>
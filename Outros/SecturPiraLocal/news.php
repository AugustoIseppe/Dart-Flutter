<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News</title>
    <link rel="stylesheet" href="assets/css/news.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

    <style>

        .nav-bar .nav-links li{
            height: 5px !important;
        }

    </style>
</head>

<body>
<?php
    session_start();
    include 'conexao.php';
    include 'menu.php';
    ?>


    <div id="container-principal">
    <!-- <hr class="divisor-hr"> -->
    <a href="" class="read-more-news news-link">
        <div class="container-news-list">

            <div class="news-list-img">
                <img src="assets/foto3.png" alt="" width="120px" height="120px" class="news-list-img">
            </div>

            <div class="news-list">
                <h2 class="title-news">Queen Experience At Stadium</h2>
                <br>

                <p class="description-news">Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur sunt eum
                    corrupti harum. Voluptatem nostrum eos magni molestiae atque. Totam unde voluptas odio quisquam
                    similique commodi ad autem sunt molestias. <a href="" style="color: blue;"
                        class="read-more-news">Ler mais...</a></p>
                <br>
                <span>
                    <i class='fa fa-map-marker'> - Teatro Cacilda Becker</i> |
                    <i class='fa fa-calendar'> - 28/08/2023</i>
                </span>

            </div>
        </div>

    </a>

    <!--##################-->

    <a href="" class="read-more-news news-link">
        <div class="container-news-list">

            <div class="news-list-img">
                <img src="assets/foto2.png" alt="" width="120px" height="120px" class="news-list-img">
            </div>

            <div class="news-list">
                <h2 class="title-news">Fest-Pira</h2>
                <br>

                <p class="description-news">Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur sunt eum
                    corrupti harum. Voluptatem nostrum eos magni molestiae atque. Totam unde voluptas odio quisquam
                    similique commodi ad autem sunt molestias. <a href="" style="color: blue;"
                        class="read-more-news">Ler mais...</a></p>
                <br>
                <span>
                    <i class='fa fa-map-marker'> - Fepasa</i> |
                    <i class='fa fa-calendar'> - 28/08/2023</i>
                </span>

            </div>
        </div>

    </a>
    <a href="" class="read-more-news news-link">
        <div class="container-news-list">

            <div class="news-list-img">
                <img src="assets/foto1.png" alt="" width="120px" height="120px" class="news-list-img">
            </div>

            <div class="news-list">
                <h2 class="title-news">IV Festival de Pole Dance de Pirassununga</h2>
                <br>

                <p class="description-news">Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur sunt eum
                    corrupti harum. Voluptatem nostrum eos magni molestiae atque. Totam unde voluptas odio quisquam
                    similique commodi ad autem sunt molestias. <a href="" style="color: blue;"
                        class="read-more-news">Ler mais...</a></p>
                <br>
                <span>
                    <i class='fa fa-map-marker'> - Teatro Cacilda Becker</i> |
                    <i class='fa fa-calendar'> - 28/08/2023</i>
                </span>

            </div>
        </div>

    </a>

    </div>
    </div>
    </a>


    <?php include 'rodape.html'; ?>
    </div>
</body>

</html>
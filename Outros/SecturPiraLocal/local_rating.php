<?php
include 'conexao.php';
$placeId = $exibir['place_id'];
$apiKey = 'AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs';

$apiUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=name,rating,user_ratings_total,reviews&key=$apiKey&language=pt-BR";

$apiResponse = file_get_contents($apiUrl);
$apiData = json_decode($apiResponse, true);

if (isset($apiData['result']) && isset($apiData['result']['rating']) && $apiData['result']['rating'] > 0) {
    $localName = $apiData['result']['name'];
    $rating = $apiData['result']['rating'];
    $userRatingsTotal = $apiData['result']['user_ratings_total'];
    $reviews = $apiData['result']['reviews'];
    $starFull = './assets/icons/Star_rating_5_of_5.png';
    $starHalf = './assets/icons/Star_rating_0.5_of_5.png';
    $starEmpty = './assets/icons/Star_rating_0_of_5.png';
      // Converte a classificação em estrelas
      $ratingStars = '';
      $fullStars = floor($rating);
      $decimalRating = $rating - $fullStars;
      
      if ($decimalRating >= 0.75) {
        $fullStars++;
    } elseif ($decimalRating >= 0.25 && $decimalRating < 0.75) {
        $halfStar = true;
    } else {
        $halfStar = false;
    }
    echo "<style>
        .star-icon {
            width:25px;
            height:25px;
float:left;        }
 
    </style><br>";
   
   ?>   <?php
    for ($i = 1; $i <= 5; $i++) {
        if ($i <= $fullStars) {
            echo "<img class='star-icon' src='$starFull' alt='Estrela Cheia'>";
        } elseif ($halfStar && $i == $fullStars + 1) {
            echo "<img class='star-icon' src='$starHalf' alt='Meia Estrela'>";
        } else {
            echo "<img class='star-icon' src='$starEmpty' alt='Estrela Vazia'>";
        }
    }
  
}


?>
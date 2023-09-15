<?php
    $placeId = $exibir['place_id'];

    $apiKey = 'AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs';
    $apiUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=opening_hours&key=$apiKey&language=pt-BR";
    date_default_timezone_set('America/Sao_Paulo');
    $apiResponse = file_get_contents($apiUrl);
    $apiData = json_decode($apiResponse, true);

    $status_abertura = "Sem informações";

    if ($apiResponse && isset($apiData['result']['opening_hours']['periods'])) {
        $periodos = $apiData['result']['opening_hours']['periods'];
        $dia_atual = date('w');

        foreach ($periodos as $periodo) {
            if ($periodo['open']['day'] == $dia_atual) {
                $hora_abertura = substr($periodo['open']['time'], 0, 2);
                $minuto_abertura = substr($periodo['open']['time'], 2, 2);
                $hora_fechamento = substr($periodo['close']['time'], 0, 2);
                $minuto_fechamento = substr($periodo['close']['time'], 2, 2);
                $horario_atual = date('H:i');
                $minutos_abertura = $hora_abertura * 60 + $minuto_abertura;
                $minutos_fechamento = $hora_fechamento * 60 + $minuto_fechamento;
                $minutos_atual = intval(substr($horario_atual, 0, 2)) * 60 + intval(substr($horario_atual, 3, 2));

                if ($minutos_atual >= $minutos_abertura && $minutos_atual <= $minutos_fechamento) {
                    $status_abertura = "Aberto";
                    $locais_abertos[] = $exibir;
                } else {
                    $status_abertura = "Fechado";
                    $locais_fechados[] = $exibir;
                }
            }
        }
    }


$cor_texto_abertos = "green";
$cor_texto_fechados = "red";

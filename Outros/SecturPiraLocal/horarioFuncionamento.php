<?php
// Recupera o place_id do estabelecimento da URL

$apiUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=opening_hours&key=$apiKey&language=pt-BR";

$apiResponse = file_get_contents($apiUrl);
$apiData = json_decode($apiResponse, true);

if ($apiResponse && isset($apiData['result']['opening_hours']['weekday_text'])) {
    $horarios_semana = $apiData['result']['opening_hours']['weekday_text'];

    // Verifica o dia atual
    $dia_atual = date('w');
    $horario_hoje = $horarios_semana[$dia_atual];

    echo "Horário de funcionamento hoje: $horario_hoje<br>";

    // Adicione links com ícones para expandir/recolher os horários completos
    echo '<div class="horarios-container">';
    echo '<div class="expandir-recolher">';
    echo '<a href="#" id="expandirHorarios" class="link-expandir"><img src="assets/icons/expandir.png" alt="Expandir"></a>';
    echo '<a href="#" id="recolherHorarios" class="link-recolher" style="display: none;"><img src="assets/icons/recolher.png" alt="Recolher"></a>';
    echo '</div>';
    
    // Exibe os horários de funcionamento completos
    echo '<div id="horariosCompletos" style="display: none;">';
    foreach ($horarios_semana as $dia => $horario) {
        echo "$horario<br>";
    }
    echo '</div>';
    
    echo '</div>';

    // Script JavaScript para exibir/ocultar os horários completos
    echo "
    <script>
        document.getElementById('expandirHorarios').addEventListener('click', function() {
            document.getElementById('horariosCompletos').style.display = 'block';
            document.getElementById('expandirHorarios').style.display = 'none';
            document.getElementById('recolherHorarios').style.display = 'inline';
        });
        document.getElementById('recolherHorarios').addEventListener('click', function() {
            document.getElementById('horariosCompletos').style.display = 'none';
            document.getElementById('recolherHorarios').style.display = 'none';
            document.getElementById('expandirHorarios').style.display = 'inline';
        });
    </script>";
} else {
    echo "Horários de funcionamento não encontrados para este estabelecimento.";
}
?>




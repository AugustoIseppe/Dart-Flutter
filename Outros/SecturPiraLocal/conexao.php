<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "secturpira";

try {
    $options = [
        PDO::ATTR_EMULATE_PREPARES => false, // Impede a emulação de prepared statements
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Define o modo de erro para exceção
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC // Define o modo de busca padrão para retornar um array associativo
    ];
    
    $conexao = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8mb4", $username, $password, $options);
} catch (PDOException $e) {
    error_log("Erro na conexão com o banco de dados: " . $e->getMessage());
    echo "Ocorreu um erro na conexão. Por favor, tente novamente mais tarde.";
    exit; // Encerra o script em caso de erro de conexão
}
?>

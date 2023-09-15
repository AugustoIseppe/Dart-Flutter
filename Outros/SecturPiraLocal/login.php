<?php

// Inicialize a sessão
// session_start(); 
// Verifique se o usuário já está logado, em caso afirmativo, redirecione-o para a página de boas-vindas
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: index.php");
    exit;
}
 
// Incluir arquivo de configuração
require_once "conexao.php";
 
// Defina variáveis e inicialize com valores vazios
$username = $password = "";
$username_err = $password_err = $login_err = "";

 
// Processando dados do formulário quando o formulário é enviado
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Verifique se o nome de usuário está vazio
    if(empty(trim($_POST["username"]))){
        $username_err = "Por favor, insira o nome de usuário.";
    } else{
        $username = trim($_POST["username"]);

    }
    
    // Verifique se a senha está vazia
    if(empty(trim($_POST["password"]))){
        $password_err = "Por favor, insira sua senha.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validar credenciais
    if(empty($username_err) && empty($password_err)){
        // Prepare uma declaração selecionada
        $sql = "SELECT usuarioid, usuarionome, usuariosenha, usuariotipo FROM usuario WHERE usuarionome = :username";
        if($stmt = $conexao->prepare($sql)){
            // Vincule as variáveis à instrução preparada como parâmetros
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            // Definir parâmetros
            $param_username = trim($_POST["username"]);
            
            // Tente executar a declaração preparada
            if($stmt->execute()){
                
                // Verifique se o nome de usuário existe, se sim, verifique a senha
                if($stmt->rowCount() == 1){
                    if($row = $stmt->fetch()){
                       
                        $id = $row["usuarioid"];
                        $username = $row["usuarionome"];
                        $adm = $row["usuariotipo"];
                        $hashed_password = $row["usuariosenha"];
                        
                        if(password_verify($password, $hashed_password)){

                            // A senha está correta, então inicie uma nova sessão
                            session_start();
                            // Armazene dados em variáveis de sessão
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id"] = $id;
                            $_SESSION["username"] = $username; 
                            $_SESSION["admin"] = [$adm];

                            // Redirecionar o usuário para a página de boas-vindas
                            header("location: index.php");
                            exit;
                        } else{
                            // A senha não é válida, exibe uma mensagem de erro genérica
                            $login_err = "Nome de usuário ou senha inválidos.";
                        }
                    }
                } else{
                    // O nome de usuário não existe, exibe uma mensagem de erro genérica
                    $login_err = "Nome de usuário ou senha inválidos.";
                }
            } else{
                echo "Ops! Algo deu errado. Por favor, tente novamente mais tarde.";
            }

            // Fechar declaração
            unset($stmt);
        }
    }
    
    // Fechar conexão
    unset($conexao);

}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projeto Turismo - Login de Usuário</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="jquery.mask.js"></script>
    <style>
        body{
            margin:0;
            padding:0;
            font-family:"arial",heletica,sans-serif;
            font-size:12px;
            background-image: url(https://img.freepik.com/vetores-premium/fundo-triangular-abstrato-padrao-poligonal-geometrico-cinza_434359-289.jpg?w=2000);
            background-repeat: no-repeat;
            background-size: cover;
        }   

        label {
            display: block;
            cursor: pointer;
        }

        h1 {
            text-align: center;
        }

        .navbar{
            margin-bottom: 0;
        }

        #login-field {
            font-family: sans-serif;
            background: #E8E8E8 ;
            border-radius: 15px;
            margin-top: 50px;
            outline:solid;
            outline-color:#a0a0a0;
            outline-width: 1px;
        }
    </style>
    
    <script>
        $(document).ready(function(){
            $("#cep").mask("00 000-000");
        });
    </script>
</head>

<body>
    <?php
    session_start();
    include 'conexao.php';  
    include 'menu.php';
    ?>

    <div class="container-fluid">
        <div class="row">
            <?php 
            if(!empty($login_err)){
                echo '<div class="alert alert-danger">' . $login_err . '</div>';
            }        
            ?>

            <br><br><br><br><br>    

            <div id="login-field" class="col-sm-4 col-sm-offset-4">
                <h1 style="text-align:center;"> Login </h1>

                <br>

                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                    <div class="form-group">
                        <label>Nome</label>
                        <input id="username" type="text" name="username" class="form-control <?php echo (!empty($username_err)) ? 'is-invalid' : ''; ?>" value="">
                        <span class="invalid-feedback"><?php echo $username_err; ?></span>
                    </div>
                    
                    <div class="form-group">
                        <label>Senha</label>
                        <input id="password" type="password" name="password" class="form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>">
                        <span class="invalid-feedback"><?php echo $password_err; ?></span>
                    </div>
                    
                    <br>
                    
                    <div style=text-align:center>
                        <button type="submit" class="btn btn-lg btn-default" value="Entrar">
                            <span class="glyphicon glyphicon-ok"> Entrar</span>
                        </button>
                    </div>
                </form>  

                <br>

                <div style="text-align:center">
                    <a href="registro.php">
                        <button type="submit" class=" btn btn-lg btn-link">
                            Cadastre-se
                        </button> 
                    </a>
                    <a href="esqueciminhaSenha.php">
                        <button type="submit" class=" btn btn-lg btn-link">
                            Esqueci minha senha!
                        </button> 
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 

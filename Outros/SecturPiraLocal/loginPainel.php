<?php

session_start();

if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
  if ($_SESSION["admin"][0] == 1) {
      header("location: dashboard_admin.php");
  } else if ($_SESSION["admin"][0] == 0) {
      echo 'else if';
  }else {
    echo 'else';
  }
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
                              header("location: dashboard_admin.php");
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
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="assets/css/loginPainel.css">

</head>
<body>
<?php
    include 'conexao.php';  
    include 'menu.php';
    ?>
    
<!-- partial:index.partial.html -->
<form class='login-form' action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            
  <div class="flex-row">
    <label class="lf--label" for="username">
      <svg x="0px" y="0px" width="12px" height="13px">
        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z"/>
      </svg>
    </label>
    <input id="username" name="username" class="lf--input form-control <?php echo (!empty($username_err)) ? 'is-invalid' : ''; ?>" value="">
    <span class="invalid-feedback"><?php echo $username_err; ?></span>
  </div>
  <div class="flex-row">
    <label class="lf--label" for="password">
      <svg x="0px" y="0px" width="15px" height="5px">
        <g>
          <path fill="#B1B7C4" d="M6,2L6,2c0-1.1-1-2-2.1-2H2.1C1,0,0,0.9,0,2.1v0.8C0,4.1,1,5,2.1,5h1.7C5,5,6,4.1,6,2.9V3h5v1h1V3h1v2h1V3h1 V2H6z M5.1,2.9c0,0.7-0.6,1.2-1.3,1.2H2.1c-0.7,0-1.3-0.6-1.3-1.2V2.1c0-0.7,0.6-1.2,1.3-1.2h1.7c0.7,0,1.3,0.6,1.3,1.2V2.9z"/>
        </g>
      </svg>
    </label>

    <input id="password" name="password" type="password" class="lf--input form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>">
    <span class="invalid-feedback"><?php echo $password_err; ?></span>
  </div>
  
  <input class='lf--submit' type='submit' value='Entrar'>
</form>
<a class='lf--forgot' href='#'>Forgot password?</a>
<!-- partial -->
<!-- <a class='lf--forgot' href='./dist/index.php'>ir pro dashboard</a> -->

</body>
</html>

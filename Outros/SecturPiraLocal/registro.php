<?php

// session_start();

// Incluir arquivo de configuração
require_once "conexao.php";
 
// Defina variáveis e inicialize com valores vazios
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
$cnpj = "";
$cnpj_err = "";
$email = "";
$email_err = "";

 
// Processando dados do formulário quando o formulário é enviado
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validar nome de usuário
    if(empty(trim($_POST["username"]))){
        $username_err = "Por favor coloque um nome de usuário.";
    } elseif(!preg_match('/^[a-zA-Z0-9_]+$/', trim($_POST["username"]))){
        $username_err = "O nome de usuário pode conter apenas letras, números e sublinhados.";
    } else{
        // Prepare uma declaração selecionada
        $sql = "SELECT usuarioid FROM usuario WHERE usuarionome = :username";
        $adm = "SELECT usuarioid FROM usuario WHERE usuariotipo";
        if($stmt = $conexao->prepare($sql)){
            
            // Vincule as variáveis à instrução preparada como parâmetros
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            
            // Definir parâmetros
            $param_username = trim($_POST["username"]);
            
            // Tente executar a declaração preparada
            if($stmt->execute()){
                if($stmt->rowCount() == 1){
                    $username_err = "Este nome de usuário já está em uso.";
                } else{
                    $username = trim($_POST["username"]);
                }
            } else{
                echo "Ops! Algo deu errado. Por favor, tente novamente mais tarde.";
            }

            // Fechar declaração
            unset($stmt);
        }
        if(empty(trim($_POST["cnpj"]))){
            $cnpj_err = "Por favor insira o CNPJ.";
        } elseif(!preg_match('/^\d{14}$/', trim($_POST["cnpj"]))){
            $cnpj_err = "O CNPJ deve conter exatamente 14 dígitos numéricos.";
        } else{
            $cnpj = trim($_POST["cnpj"]);
        }
    }
    if(empty(trim($_POST["email"]))){
        $email_err = "Por favor insira um email.";
    } elseif(!filter_var(trim($_POST["email"]), FILTER_VALIDATE_EMAIL)){
        $email_err = "Por favor insira um email válido.";
    } else{
        $email = trim($_POST["email"]);
    }
    // Validar senha
    if(empty(trim($_POST["password"]))){
        $password_err = "Por favor insira uma senha.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "A senha deve ter pelo menos 6 caracteres.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    
    // Validar e confirmar a senha
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Por favor, confirme a senha.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "A senha não confere.";
        }
    }
    
    // Verifique os erros de entrada antes de inserir no banco de dados
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err) && empty($email_err)){
        
        // Prepare uma declaração de inserção
        $sql = "INSERT INTO usuario (usuarionome, usuariosenha, usuarioemail, usuariotipo, usuariocnpj) VALUES (:username, :password, :email, '0', :cnpj)";
         
        if($stmt = $conexao->prepare($sql)){
            // Vincule as variáveis à instrução preparada como parâmetros
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            $stmt->bindParam(":password", $param_password, PDO::PARAM_STR);
            $stmt->bindParam(":email", $param_email, PDO::PARAM_STR);
            $stmt->bindParam(":cnpj", $param_cnpj, PDO::PARAM_STR);

            // Definir parâmetros
            $param_username = $username;
            $param_cnpj = $cnpj;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            $param_email = $email;            
            // Tente executar a declaração preparada
            if($stmt->execute()){
                // Redirecionar para a página de login
                header("location: login.php");
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="jquery.mask.js"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>


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


.wrapper{ 
    font-family: Trebuchet MS , sans-serif;
    margin: auto;
    width: 450px; 
    padding: 20px;
    background: #E8E8E8;
    border-radius: 10px;
    margin-top: 120px;
    outline:solid;
    outline-color:#a0a0a0;
    outline-width: 1px;
    
}

</style>

</head>

<body>
    
<?php

session_start();
include 'conexao.php';	
include 'menu.php';
	
?>

	
    <div id="testediv">
    <div class="wrapper">
        <h2 style="text-align:center">Cadastro</h2>
        <p>Por favor, preencha este formulário para criar uma conta.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">

            <div class="form-group">
                <label>Nome do usuário</label>
                <input type="text" name="username" class="form-control <?php echo (!empty($username_err)) ? 'is-invalid' : ''; ?>" value="">
                <span class="invalid-feedback"><?php echo $username_err; ?></span>
            </div> 

            <div class="form-group">
            <label for="cnpj">CNPJ <span style="color: red">*</span></label>
					
                    <input maxlength="14" type="text" name="cnpj" id="cnpj" class="form-control" placeholder="Ex: 01.234.567/8910-11" onkeypress="$(this).mask('00.000.000/0000-00')" required></input>
            <span class="invalid-feedback" ><?php echo $cnpj_err; ?></span>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control <?php echo (!empty($email_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $email; ?>">
                <span class="invalid-feedback"><?php echo $email_err; ?></span>
            </div>

            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="password" class="form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $password; ?>">
                <span class="invalid-feedback"><?php echo $password_err; ?></span>
            </div>

            <div class="form-group">
                <label>Confirme a senha</label>
                <input type="password" name="confirm_password" class="form-control <?php echo (!empty($confirm_password_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $confirm_password; ?>">
                <span class="invalid-feedback"><?php echo $confirm_password_err; ?></span>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Criar Conta">
                <input type="reset" class="btn btn-secondary ml-2" value="Apagar Dados">
            </div>
            <p>Já tem uma conta? <a href="login.php">Entre aqui</a>.</p>
        </form>
    </div> 
    </div>
    <br><br><br>

</body>
</html>
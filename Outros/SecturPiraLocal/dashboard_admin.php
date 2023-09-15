<?php 
session_start();
if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
  if ($_SESSION["admin"][0] == 0) {
      header("location: index.php");
  }
}

        ?>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Secturpira</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'><link rel="stylesheet" href="./modal_local.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script src="jquery.mask.js"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQbfbgz5ADPHQQ5JHwQrMXuuNHo5Yq1zs&libraries=places"></script>
<link rel="stylesheet" href="assets/css/modal_local.css">
<script src="assets/js/modal_local.js"></script>
<link rel="stylesheet" href="assets/css/dashboard.css">
<style>
/* Estilos para o balão */
.balloon {
  position: absolute;
  background-color: #ffffff;
  border: 1px solid #ccc;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  display: none;
  padding: 10px;
  z-index: 1; /* Para garantir que o balão apareça acima de outros elementos */
}

.balloon.show {
  display: block;
}

  </style>
</head>
<body>
<?php
include 'conexao.php';

// $userid = $_SESSION['id'];
// $userRole = $_SESSION['admin'][0]; // Obter o primeiro elemento do array 'admin'

// Verificar se o usuário é um administrador
// if ($userRole === "1") {
//     $consulta = $conexao->query("SELECT * FROM local");
// } else {
//     $consulta = $conexao->query("SELECT * FROM local WHERE usuarioid = '$userid'");
// }
$consulta= $conexao->query('SELECT categoriaid, categorianome, categoriadescricao, categoriaseq, categoriamenu FROM categoria');

?>
<!-- partial:index.partial.html -->
<div class="app-container">
  <div class="sidebar">
    <div class="sidebar-header">
      <div class="app-icon">
        <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M507.606 371.054a187.217 187.217 0 00-23.051-19.606c-17.316 19.999-37.648 36.808-60.572 50.041-35.508 20.505-75.893 31.452-116.875 31.711 21.762 8.776 45.224 13.38 69.396 13.38 49.524 0 96.084-19.286 131.103-54.305a15 15 0 004.394-10.606 15.028 15.028 0 00-4.395-10.615zM27.445 351.448a187.392 187.392 0 00-23.051 19.606C1.581 373.868 0 377.691 0 381.669s1.581 7.793 4.394 10.606c35.019 35.019 81.579 54.305 131.103 54.305 24.172 0 47.634-4.604 69.396-13.38-40.985-.259-81.367-11.206-116.879-31.713-22.922-13.231-43.254-30.04-60.569-50.039zM103.015 375.508c24.937 14.4 53.928 24.056 84.837 26.854-53.409-29.561-82.274-70.602-95.861-94.135-14.942-25.878-25.041-53.917-30.063-83.421-14.921.64-29.775 2.868-44.227 6.709-6.6 1.576-11.507 7.517-11.507 14.599 0 1.312.172 2.618.512 3.885 15.32 57.142 52.726 100.35 96.309 125.509zM324.148 402.362c30.908-2.799 59.9-12.454 84.837-26.854 43.583-25.159 80.989-68.367 96.31-125.508.34-1.267.512-2.573.512-3.885 0-7.082-4.907-13.023-11.507-14.599-14.452-3.841-29.306-6.07-44.227-6.709-5.022 29.504-15.121 57.543-30.063 83.421-13.588 23.533-42.419 64.554-95.862 94.134zM187.301 366.948c-15.157-24.483-38.696-71.48-38.696-135.903 0-32.646 6.043-64.401 17.945-94.529-16.394-9.351-33.972-16.623-52.273-21.525-8.004-2.142-16.225 2.604-18.37 10.605-16.372 61.078-4.825 121.063 22.064 167.631 16.325 28.275 39.769 54.111 69.33 73.721zM324.684 366.957c29.568-19.611 53.017-45.451 69.344-73.73 26.889-46.569 38.436-106.553 22.064-167.631-2.145-8.001-10.366-12.748-18.37-10.605-18.304 4.902-35.883 12.176-52.279 21.529 11.9 30.126 17.943 61.88 17.943 94.525.001 64.478-23.58 111.488-38.702 135.912zM266.606 69.813c-2.813-2.813-6.637-4.394-10.615-4.394a15 15 0 00-10.606 4.394c-39.289 39.289-66.78 96.005-66.78 161.231 0 65.256 27.522 121.974 66.78 161.231 2.813 2.813 6.637 4.394 10.615 4.394s7.793-1.581 10.606-4.394c39.248-39.247 66.78-95.96 66.78-161.231.001-65.256-27.511-121.964-66.78-161.231z"/></svg>
      </div>
    </div>
    <ul class="sidebar-list">
      <li class="sidebar-list-item">
        <a href="index.php">
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
          <span>Inicio</span>
        </a>
      </li>
      <li class="sidebar-list-item active">  <!--"Active" Pagina ativa -->
        <a href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-bag"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
          <span>Locais</span>
        </a>
      </li>
      <li class="sidebar-list-item">
        <a href="#">
          <svg width="18px" height="18px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M9 12L11 14L15 10M12 3L13.9101 4.87147L16.5 4.20577L17.2184 6.78155L19.7942 7.5L19.1285 10.0899L21 12L19.1285 13.9101L19.7942 16.5L17.2184 17.2184L16.5 19.7942L13.9101 19.1285L12 21L10.0899 19.1285L7.5 19.7942L6.78155 17.2184L4.20577 16.5L4.87147 13.9101L3 12L4.87147 10.0899L4.20577 7.5L6.78155 6.78155L7.5 4.20577L10.0899 4.87147L12 3Z" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
          <span>Auditoria</span>
        </a>
      </li>
   
   
 
    </ul>
    <div class="account-info">
      <div class="account-info-picture">
        <img src="https://icons.iconarchive.com/icons/aha-soft/free-large-boss/512/Admin-icon.png" alt="Account">
      </div>
      <div class="account-info-name"><?php echo $_SESSION["username"]; ?></div>

      <div class="account-info-name" style="color:red">ADM</div>
      <button class="account-info-more" onclick="toggleBalloon()">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal">
      <circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/>
    </svg>
  </button>

  <!-- Dropdown que aparece ao clicar no botão -->
  <div id="balloon" class="balloon">
    <a href="sair.php">Sair da conta</a>
  </div>

    </div>
  </div>
  <div class="app-content">
    <div class="app-content-header">
      <h1 class="app-content-headerText">Locais</h1>
      <button class="mode-switch" title="Switch Theme">
        <svg class="moon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" width="24" height="24" viewBox="0 0 24 24">
          <defs></defs>
          <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
        </svg>
      </button>
      <input type="checkbox" id="modal" />
<label for="modal" class="modal-btn">
      <i class="app-content-headerButton" aria-hidden="true">+ Local</i>
      </label>
      <label for="modal" class="modal-bg"></label>
<div class="modal-content" style="background-color:#101827
; color:grey;">
	<label for="modal" class="close">
		<i class="fa fa-times" aria-hidden="true"></i>
	</label>
	<header>
		<h2>Inclusão de Local</h3>
	</header>

	<article class="content" style="overflow:scroll; max-height:500px;" >
	<form method="post" action="incluir_local_admin.php" name="incluirLocal" enctype="multipart/form-data" style="padding-right:20px;" >
				<fieldset >

                    <div class="form-group">
					<form>
					<!-- Nome do Estabelecimento -->
						<label for="nome-estabelecimento">Nome do Estabelecimento:<span style="color: red">*</span></label>
						<input id="nome-estabelecimento" maxlength="50" name="nome" type="text" class="form-control" placeholder="" required>
					</div>
					<div class="form-group">

						<label for="categoria">Categoria <span style="color: red">*</span></label>
					
						<select name="selecionarcategoria" id="selecionarcategoria">
						    
							<?php while ($exibir=$consulta->fetch(PDO::FETCH_ASSOC)) { ?>
						
								<option value="<?php echo $exibir['categoriaid']; ?>"><?php echo $exibir['categorianome']; ?> </option>
								
							<?php } ?> 

                        </select>
					</div>
					

					<!-- Mapa -->
					<div id="mapa" style="height: 400px; margin-right:20px;"></div>

					<!-- Descriçao --> 
					<div class="form-group"> 
					    <label for="descricao">Descrição <span style="color: red">*</span></label>
						<textarea id="descricao" rows="3" maxlength="500" name="descricao" type="text" class="form-control" placeholder="" required></textarea>
					</div>

					<!-- Descriçao do Endereço -->
                    <div class="form-group">
                        <label for="enderecodescricao">Descrição do Endereço</label>
						<input type="text" id="descricao-endereco" rows="3" maxlength="300" name="enderecodescricao" type="text" class="form-control" placeholder="">
                    </div>

					<!-- Rua -->
                    <div class="form-group">
						<label for="rua">Rua</label>
						<input type="text" id="rua" maxlength="50" name="rua" type="text" class="form-control" placeholder="">
					</div>

					<!-- Número -->
                    <div class="form-group">
						<label for="numero">Número</label>
						<input type="text" id="numero" maxlength="10" name="numero" type="text" class="form-control" placeholder="">
					</div>

					<!-- Bairro -->
                    <div class="form-group">
						<label for="bairro">Bairro</label>
						<input type="text" id="bairro" maxlength="50" name="bairro" type="text" class="form-control" placeholder="">
					</div>

					<!-- Cidade -->
                    <div class="form-group">
						<label for="cidade">Cidade</label>
						<input type="text" id="cidade" maxlength="50" name="cidade" type="text" class="form-control" placeholder="">
					</div>

					<!-- Estado -->
					<div class="form-group">
						<label for="estado">Estado</label>
						<input type="text" id="estado" maxlength="2" name="estado" type="text" class="form-control" placeholder="Ex: SP">
					</div>

					<!-- CEP -->
					<div class="form-group">
						<label for="cep">Cep</label>
						<input type="text" id="cep" maxlength="11" name="cep" type="text" class="form-control" placeholder="Ex: 01234-567" onkeypress="$(this).mask('00000-000')">
					</div>

					<!-- Complemento -->
					<div class="form-group">
						<label for="complemento">Complemento</label>
						<input type="text" id="complemento" maxlength="150" name="complemento" type="text" class="form-control" placeholder="">
					</div>

					<!-- Telefone -->
                    <div class="form-group">
						<label for="telefone">Telefone</label>
						<input type="text" id="telefone" maxlength="15" name="telefone" type="text" class="form-control" placeholder="Ex: (01) 2345-6789" onkeypress="$(this).mask('(00) 0000-0000')">
					</div>

						<!-- Tel.Celular -->
						<div class="form-group">
						<label for="celular">Tel. Celular</label>
						<input type="text" id="tel-celular" maxlength="15" name="celular" type="text" class="form-control" placeholder="Ex: (DDD) 9 0123-4567" onkeypress="$(this).mask('(00) 0 0000-0000')">
					</div>

					<!-- Whatsapp -->
					<div class="form-group">
						<label for="celularwhatsapp">Tel. Celular WhatsApp?</label>
						<input type="text" id="tel-celular-whatsapp" maxlength="1" name="celularwhatsapp" type="text" class="form-control" placeholder="Ex: S">
					</div>

					<!-- Foto 1 -->
					<div class="form-group">
						<label for="foto1"> Foto Principal <span style="color: red">*</span></label>
						<input type="file" name="foto1" id="foto1" accept="image/*" required>
					</div>

					<!-- Foto 2 -->
					<div class="form-group">
						<label for="foto2">Foto 2</label>
						<input type="file" name="foto2" id="foto2" accept="image/*">
					</div>

					<!-- Foto 3 -->
					<div class="form-group">
						<label for="foto3">Foto 3</label>
						<input type="file" name="foto3" id="foto3" accept="image/*">
					</div>

					<!-- Foto 4 -->
					<div class="form-group">
						<label for="foto4"> Foto 4</label>
						<input type="file" name="foto4" id="foto4" accept="image/*">
					</div>

					<!-- Foto 5 -->
					<div class="form-group">
						<label for="foto5"> Logo </label>
						<input type="file" name="foto5" id="foto5" accept="image/*">
					</div>

					<hr>

					<!-- Website -->
					<div class="form-group">
						<label for="website">Website</label>
						<input type="text" id="website" maxlength="50" name="website" type="text" class="form-control" placeholder="">
					</div>

					<!-- Email -->
					<div class="form-group">
						<label for="email">Email</label>
						<input type="text" id="email" maxlength="50" name="email" type="text" class="form-control" placeholder="">
					</div>


					<!-- Facebook -->
					<div class="form-group">
						<label for="facebook">Facebook</label>
						<input type="text" id="facebook" maxlength="50" name="facebook" type="text" class="form-control" placeholder="">
					</div>

					<!-- Instagram -->
					<div class="form-group">
						<label for="instagram">Instagram</label>
						<input type="text" id="instagram" maxlength="50" name="instagram" type="text" class="form-control" placeholder="">
					</div>
					<!-- Latitude -->
                    <div class="form-group">
						<label for="latitude">Latitude</label>
						<input type="text" id="latitude" maxlength="30" name="latitude" type="text" class="form-control" placeholder="">
					</div>

					<!-- Longitude -->
                    <div class="form-group">
						<label for="longitude">Longitude</label>
						<input type="text" id="longitude" maxlength="30" name="longitude" type="text" class="form-control" placeholder="">
					</div>
					<!-- Posição no Google -->
					<div class="form-group">
						<label for="posicaogoogle">Posição no Google</label>
						<input type="text" id="posicao-google" maxlength="50" name="posicaogoogle" type="text" class="form-control" placeholder="">
					</div>
					<input type="hidden" id="place-id" name="place-id">
					
					<br>

					<div style="text-align: center;">

				        <button type="submit" class="btn btn-lg btn-default" name="btn-enviar">

					        <span class="glyphicon glyphicon-pencil">Cadastrar</span>

				    	</button>

				    </div>

				</fieldset>
				</form>
      </article>


</div>
    </div>
    <div class="app-content-actions">
      <input class="search-bar" placeholder="Pesquisar..." type="text">
      <div class="app-content-actions-wrapper">
        <div class="filter-button-wrapper">
          <button class="action-button filter jsFilter"><span>Filtro</span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-filter"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg></button>
          <div class="filter-menu">
            <label>Categoria</label>
            <select>
              <option>Todas Categorias</option>
              <option>Restaurantes</option>                     <option>Decoration</option>
              <option>Hotéis</option>
              <option>Apartamentos</option>
              <option>Motéis</option>
              <option>Fazendas</option>
            </select>
            <label>Status</label>
            <select>
              <option>All Status</option>
              <option>Active</option>
              <option>Disabled</option>
            </select>
            <div class="filter-menu-buttons">
              <button class="filter-button reset">
                Reset
              </button>
              <button class="filter-button apply">
                Apply
              </button>
            </div>
          </div>
        </div>
        <button class="action-button list active" title="List View">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
        </button>
        <button class="action-button grid" title="Grid View">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
        </button>
      </div>
    </div>
    <div class="products-area-wrapper tableView">
      <div class="products-header">
        <div class="product-cell image">
          Locais
          <button class="sort-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
          </button>
        </div>
        <div class="product-cell category">Categoria<button class="sort-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
          </button></div>
        <div class="product-cell">Descrição Local:<button class="sort-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
          </button></div>
        <div class="product-cell sales">Telefone<button class="sort-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
          </button></div>
        <div class="product-cell stock">Posição Google<button class="sort-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
          </button></div>
        <div class="product-cell status-cell">Status<button class="sort-button">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
          </button></div>
      </div>
      <div class="products-row">
        <button class="cell-more-button">
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
        </button>
          

          <?php 
       $consulta = $conexao->query('SELECT local.*, categoria.categorianome AS nome_categoria 
       FROM local
       JOIN categoria ON local.categoriaid = categoria.categoriaid');



          while ($exibir = $consulta->fetch(PDO::FETCH_ASSOC)) { ?>
        <div class="product-cell image">
          
          <img src="assets/uploads/<?php echo $exibir['localfoto1']; ?>" alt="product">
          <span><?php echo $exibir['localnome'];?></span>
        </div>
          <div class="product-cell category"><span class="cell-label">Categoria:</span><?php echo $exibir["nome_categoria"];?></div>
        <div class="product-cell sales"><span class="cell-label">Descrição do local:</span><?php echo $exibir['localdescricao'];?></div>
        <div class="product-cell stock"><span class="cell-label">Telefone:</span><?php echo $exibir['localtelefone'];?></div>
        <div class="product-cell price"><span class="cell-label">Localização Google:</span><?php echo $exibir['localposicaogoogle'];?>

        </div>
        <div class="product-cell status-cell">
          <span class="cell-label">Status:</span>
          <span class="status active">Active</span>
        </div>
      </div>¨
      <div class="products-row">
        <button class="cell-more-button">
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
        </button>
        
        <?php } ?>
        
      </div>
    </div>
  </div>
</div>

<!-- partial -->
<script  src="assets/js/dashboard.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script><script  src="assets/js/modal_local.js"></script>
<script>
    function toggleBalloon() {
      var balloon = document.getElementById("balloon");
      balloon.classList.toggle("show");
    }
  </script>
<script>
		
        document.addEventListener('DOMContentLoaded', function () {
            function initMap() {
				const pirassunungaBounds = {
                    north: -21.898875, // Latitude máxima (Pirassununga)
                    south: -22.055720, // Latitude mínima (Pirassununga)
                    east: -47.300000,  // Longitude máxima (Pirassununga)
                    west: -47.517586   // Longitude mínima (Pirassununga)
                };

                const map = new google.maps.Map(document.getElementById('mapa'), {
                    center: { lat: -21.998006, lng: -47.425166 }, // Centro do mapa em Pirassununga
                    zoom: 14, 
                    minZoom: 13, 
                    restriction: {
                        latLngBounds: pirassunungaBounds, 
                        strictBounds: true 
                    }
                });
                const input = document.getElementById('nome-estabelecimento');
				const autocomplete = new google.maps.places.Autocomplete(input, { types: ['establishment'] });

                let placeData = {}; 
				 
				 const cidadeInicial = 'Pirassununga';
                const estadoInicial = 'SP';
				document.getElementById('cidade').value = cidadeInicial;
                document.getElementById('estado').value = estadoInicial;
				let cidadeAlterada = false;
                autocomplete.addListener('place_changed', () => {
                    const place = autocomplete.getPlace();
                    if (!place.geometry) {
                        window.alert("Nenhum local encontrado para o nome digitado. Por favor, selecione um local válido.");
                        return;
                    }
					const nomeEstabelecimento = place.name;
					document.getElementById('nome-estabelecimento').value = nomeEstabelecimento;
    				const localId = place.place_id;
   
                    placeData.nomeEstabelecimento = place.name;
                    placeData.enderecoCompleto = place.formatted_address;
                    placeData.rua = place.address_components.find(component => component.types.includes('route'))?.long_name || '';
                    placeData.bairro = place.address_components.find(component => component.types.includes('sublocality'))?.long_name || '';
                    placeData.cidade = place.address_components.find(component => component.types.includes('locality'))?.long_name || '';
                    placeData.estado = place.address_components.find(component => component.types.includes('administrative_area_level_1'))?.short_name || '';
                    placeData.cep = place.address_components.find(component => component.types.includes('postal_code'))?.long_name || '';
                    placeData.latitude = place.geometry.location.lat();
                    placeData.longitude = place.geometry.location.lng();

                   
                    if (placeData.cidade !== "Pirassununga") {
                        document.getElementById('cidade').value = placeData.cidade;
                    }

                    if (placeData.estado !== "SP") {
                        document.getElementById('estado').value = placeData.estado;
                    }

                    document.getElementById('descricao-endereco').value = placeData.enderecoCompleto;
                    document.getElementById('rua').value = placeData.rua;
                    document.getElementById('bairro').value = placeData.bairro;
                    document.getElementById('cep').value = placeData.cep;
                    document.getElementById('latitude').value = placeData.latitude;
                    document.getElementById('longitude').value = placeData.longitude;
                    document.getElementById('posicao-google').value = place.url;
					
    				document.getElementById('place-id').value = localId;
  
                    const service = new google.maps.places.PlacesService(map);
                    service.getDetails({
                        placeId: place.place_id
                    }, (placeDetails, status) => {
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                           
                            if (placeDetails.website) {
                                document.getElementById('website').value = placeDetails.website;
                            }

                            if (placeDetails.formatted_phone_number) {
                                document.getElementById('telefone').value = placeDetails.formatted_phone_number;
                            }
							const localId = placeDetails.place_id;
      
      				atualizarCamposOcultos(localId, avaliacaoTotal);

                        }
						
                    });
					  map.setCenter(place.geometry.location);

                    // Cria um marcador no mapa para o local selecionado
                    const marker = new google.maps.Marker({
                        position: place.geometry.location,
                        map: map,
                        title: place.name
                    });
                
					if (!cidadeAlterada) {
                        document.getElementById('cidade').value = cidadeInicial;
                    }
                });
				
				document.getElementById('cidade').addEventListener('input', () => {
                    cidadeAlterada = true;
                });
				
            }

            initMap();
		
    });
      
    </script>
</body>
</html>

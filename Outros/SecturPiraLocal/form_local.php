<?php session_start(); ?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Área Administrativa - Cadastro</title>

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
	<style>

		fieldset {
			margin-top: 1em 0;
			padding: 1em;
			background: #f8f8f8;
			border: 1px solid #ccc;
			border-radius: 10px;
		}
		label {
			display: block;
			cursor: pointer;
		}
		legend {
			font-weight: bold;
			text-align: center;
		}
		.navbar{
			margin-bottom: 0;
		}

	</style>
</head>

<body>
	<?php

		include 'conexao.php';
		include 'menu.php';

		$consulta = $conexao->query('SELECT categoriaid, categorianome FROM categoria');

	?>

	<div class="container-fluid">

		<div class="row">

			<div class="col-sm-4 col-sm-offset-4">

				<br><br>

				<legend>Inclusão de Local</legend>

				<form method="post" action="incluir_local.php" name="incluirLocal" enctype="multipart/form-data">
				<fieldset>

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
					<div id="mapa" style="height: 400px;"></div>

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
				<br>

			</div>

		</div>

	</div>
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

<!DOCTYPE html>
<html lang="pt-br">
<head>

	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>O Que Fazer</title>

	<style>

		* {
			box-sizing: border-box;
		}

		body {
			height: 100vh;
			margin: 0;
			font-family: Arial, Helvetica, sans-serif;
			background-image: url(https://scontent.fvcp1-1.fna.fbcdn.net/v/t39.30808-6/369696167_6371210249640744_1101031585612146181_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=WxUqfpC4B3YAX8ISwt6&_nc_ht=scontent.fvcp1-1.fna&oh=00_AfA_FXSENUxIq5BluccMbIfZExjW925tqM2_W53DSHNLXw&oe=64F178FA);
			background-repeat: no-repeat;
			background-size: cover ;
			background-position: center center;
			background-attachment: fixed;
   		}


		/* Estilos para a barra de navegação lateral (menu) */
		.sidenav {
			border-bottom-right-radius: 2rem;
			height: 1000%;
			width: 170px;
			position: fixed;
			z-index: 1;
			top: 0;
			left: 0;
			background-color: #2F4F4F;
			overflow-x: hidden;
		}
		/* Estilos para os links da barra de navegação lateral */
		.sidenav a {
			color: white;
			padding: 16px;
			text-decoration: none;
			display: block;
		}

		/* Mudar cor ao passar o mouse */
		.sidenav a:hover {
			background-color: #ddd;
			color: black;
		}

		/* Estilos para o conteúdo principal */
		.content {
			margin-top: 2rem;
        	margin-left: 135px;
        	padding-left: 20px;
		}

		/* Estilos para os conteúdos das seções */
		.menu-content {
			display: none;
		}

		/* Exibir o conteúdo da seção "A Cidade" quando não houver hash na URL */
		.menu-content#onde-visitar {
			display: block;
		}

		/* Exibir o conteúdo das seções quando seus links correspondentes forem clicados */
		.menu-content:target {
			display: block;
		}
		
		.text-title{
			text-align: center;
			margin-bottom: 10px;
			font-size: 32px;
			font-weight: bold;
		}

		.hr-title2{   
			border-width: 2px;  
			margin-left: 5%;
			width:90%;
			height:0.5px;
			background-color: rgb(95, 94, 94);
		}

		.hr-title{
			height:1px;
			background-color:rgb(95, 94, 94);
		}


		.left {
			float: left;
			margin-right: 1em;
		}

		.right {
			float: right;
			margin-left: 1em;
		}

		article {
			padding: 1em;
			width: 80%;
			margin: 0 auto;
		}
		
		/* Antigo <p> */
		.history { 
			text-align: justify;
			font-family: sans-serif;
		}

		figure {
			text-align: center;
			text-transform: uppercase;
			padding: 0.2em;
			margin: 0;
		}

		figure img {
			max-width: 100%;
		}

		@media all and (max-width: 1100px) {
			article {
			width: 80%;
			}
		}

		@media all and (max-width: 950px) {
			article {
			width: 95%;
			}
		}

		#title-servicos
		{
			font-size: 32px;
			font-family: 'Courgette', cursive;
			font-weight: bold;
			filter: blur(0.55px);
			line-height: 1.5;
		}

	</style>
</head>

<body>
	<? /*php include '../menu.php'*/ ?>

	<div class="sidenav">
		<a href="index.php" data-target="a-cidade">Home</a>
		<a href="#" class="menu-link" data-target="onde-visitar">Onde Visitar</a>
		<a href="#" class="menu-link" data-target="barragem">Barragem de Emas</a>
		<a href="#" class="menu-link" data-target="templos">Templos Religiosos</a>
		<a href="#" class="menu-link" data-target="cultura">Cultura Local</a>
		<a href="#" class="menu-link" data-target="calendario">Calendário de Eventos</a>
	</div>

	<div class="content">

		<div id="onde-visitar" class="menu-content" id="default-content">
			<article style="background-color: beige;">
				<h2 class="text-title">ONDE VISITAR</h2>
					<hr class="hr-title2">
						<p class="history">
							<br>

		Cachaça: 
			A cachaça em Pirassununga é famosa, e não por acaso. Desde a chegada dos imigrantes europeus no Brasil, é fabricada na região. 
			O grande movimento de imigrantes vindos para o Brasil ocorreu por volta de 1820 a 1830. 
			Inicialmente os italianos foram trabalhar no interior de São Paulo, na cultura do café. Logo montaram seus alambiques em Pirassununga e produziram para o consumo próprio. 
			Vendiam eventualmente, mas a fama da cachaça e dos alambiques de Pirassununga logo se alastrou pelo país. Muitas famílias produziam a cachaça e revendiam a comerciantes das cidades vizinhas para a revenda.
			Dessa forma, surgiram mais de cem marcas de cachaça em Pirassununga por volta de 1920.
			A cidade possui uma imensidão de marcas, e já era conhecida como “a Terra da Cachaça”.
			As cachaças eram todas feitas em alambique e os produtores vendiam suas produções a granel par revenda.
			Com a evolução do mercado, comerciantes mais experientes foram surgindo e por volta de 1960 surge a 51, já com a família Müller. 
			Desde então, Pirassununga passou a ser conhecida pela 51 e pela cachaça de maior escala, produzida em colunas de destilação, porém, seus alambiques e famílias produtoras permaneceram ativas.
			Assim Pirassununga ficou sendo o lugar onde é “uma boa ideia”. <br><br>

		Museu da Cachaça: 
			Uma incrível coleção de cachaças (a maior do Brasil), com mais de 3mil exemplares, também montado um alambique de produção artesanal antigo bem como outras máquinas de época, além de muita história e curiosidades. 	Degustação e compra de bebidas diversas e guloseimas da Adega Therense.
			Av. Paínguás, 969 centro
			Tel: (19) 3561-9144
			Funcionamento: De segunda a sexta-feira das 8h às 18h e de sábado, domingo e feriados das 8h às 12h30
			www.adegatherense.com.br <br><br>

		Roteiro da Cachaça:
			Para 12 pessoas com saída na Praça Central, com destino a destilaria, visitando os barris de envelhecimento da cachaça, áreas de produção e moenda, fermentação, envase e palestra sobre licenças necessárias para produção e também sobre os produtos feitos no local. Com degustação e venda de produtos. Após visita ao Museu da Cachaça. E almoço típico conforme a necessidade do grupo.
			Agendamento tel: (19) 3561-9144 / 9.9692-1882 / 9.9650-3233 <br><br>

		Alambique Sapucaia: 
			Instalações da Cachaçaria Sapucaia, que produz uma gama de produtos artesanais como cachaças de alambique, gin, vodka, licores entre outros. Na visita se conhece todas as etapas de produção, com degustação e compra de produtos.
			Visita com agendamento: (19) 9.9650-3233
			www.cachacasapucaia.com.br <br><br>
		
		Sitio Ramalho: 
			Propriedade de produção tradicional e familiar de cachaça, doces, licores, açúcar mascavo, melado entre diversos produtos.
			Produtos a venda na feira do produtor agrícola e visita somente para grupos pequenos e mediante prévio agendamento (19) 3562-7379 / 3562-2824
			produtos.ramalho@hotmail.com <br><br>

		Cachoeira de Emas: 
			Ponto de maior expressão turística da idade, no rio Mogi-Guaçu. Distante 9 quilometros da cidade, possui restaurantes especializados em pratos a base de peixes e oferece passeios de barco, pescarias, quiosques e centro comercial para compras, e praias além de outros.
			Via de Acesso: Rodovia Euberto Nemésio Pereira de Godoy. <br><br>

		<p>

		</article></div>

		<div id="barragem" class="menu-content">
			<article style="background-color: beige;">
				<h2 class="text-title">Barragem da Cachoeira de Emas</h2>
					<hr class="hr-title2">
						<p class="history">
							<br>

		Passeio de barco: 
			Aos fins de semana diversos barqueiros oferecem um passeio ao longo do rio Mogi-Guaçu para apreciação da natureza.
			Localização: Rio Mogi-Guaçu, Cachoeira de Emas. <br><br>

		Gastronomia:
			Estruturada com vários restaurantes 24h, quiosques e barracas. A gastronomia local é um destaque onde cada restaurante procura se diferenciar e atender o paladar do turista e visitante. Tem como pratos de maior destaque o rodízio de peixes, e peixadas a la carte.
			Localização: Cachoeira de Emas, Pirassununga, SP. <br><br>
				
		Piracema:
			É o período de reprodução dos peixes, onde se deslocam até as nascentes dos rios  para desovar. Acontece mediante condições ideais na natureza, fatores como a temperatura, velocidade da correnteza e volume de água do rio, são determinantes. Comemorada dia 8 de dezembro em Pirassununga, ela acontece num período onde a pesca é proibida pelo IBAMA, período de belíssima expressão da natureza apreciar a subida dos cardumes subindo, “roncando” e saltando no rio.
			Localização: Rio Mogi-Guaçu, Cachoeira de Emas Pirassununga, SP. <br><br>
		
		Menina Eufrosina:
			Eufrosina nasceu em Pirassununga, em 1864, no bairro Campo Alegre, região de Cachoeira de Emas. Filha de pais leprosos, aos quatro meses foi abandonada e adotada por padrinhos que cuidaram dela até 6 anos quando a doença manifestou.
			Seu padrinho construiu um rancho à beira da estrada para ela viver, mas as vezes passava necessidade, e para espantar o medo, rezava e cantava hinos religiosos, sua companhia era os animais.
			Sem instrução alguma, a jovem impressionava ao falar de coisas que iam acontecer. Previu as guerras mundiais, falou da febre aftosa, e o aparecimento de carros e aviões, que as mulheres usariam calças compridas e se comportariam como homens, e também sua morte. Fatos que atraíram a atenção de muitos e que começaram a tê-la como uma pessoa santa.
			Para homenageá-la, os sitiantes ergueram uma igrejinha onde depois a  Igreja Católica, quando ali se instalou, batizou a igrejinha de Capela de Santa Eufrosina,  em homenagem a monja que viveu no século V, em Alexandria, cuja imagem está sobre seu altar. A escolha da padroeira do bairro foi inspirada na santidade que as pessoas atribuíam à menina Eufrosina, que ali viveu e morreu.
			Muitos milagres foram atribuídos a Eufrosina. Mesmo com o passar dos anos, o culto piedoso em torno dela se mostra vigoroso. Num túmulo simbólico, construído pela família Furlan em 1969, ao lado da capela, os devotos nunca deixaram de rezar, acender velas e fazer pedidos. 
			Hoje, a capela está desativada e, numa sala, atrás do altar, ficaram algumas fotos, muletas e objetos deixados por fiéis que pediram e alcançaram graças. A família Pavani, proprietária do local, quer restaurar a capela onde, no passado, no dia 25 de setembro de cada ano, centenas de fiéis, re reuniam para celebrar a Festa de Santa Eufrosina, com novenas, missas, procissões, banda de música e leilão de prendas.
			Visitas com agendamento via Secretaria Municipal de Cultura e Turismo, Setor de Turismo: (19) 3562-1207
			Localização: Cachoeira de Emas Pirassununga, SP. <br><br>

		Antiga Estação de Emas:
			Unidade geradora de energia elétrica fundada em 1918, pela S.A Central Elétrica Rio Claro – SACERC, com máquinas e equipamentos americanos, na época 1819. Umas das únicas no Brasil feitas de modo ecologicamente correto com escadarias para não limitar os peixes na época da Piracema.
			Localização: Cachoeira de Emas, Pirassununga SP. <br><br>

		Pesqueiros:
			Diversos ranchos e casas de aluguel para recreação e turismo de pesca as margens do rio Mogi-Guaçu.
			Localização: Rio Mogi-Guaçu, Cachoeira de Emas Pirassununga, SP. <br><br>
			
		Passeio de Boias:
			Tradicional passeio de boias no rio Mogi-Guaçu, entre os trechos de Cachoeira de Emas e Porto Ferreira, totalizando cerca de 17 quilômetros, sempre no ultimo sábado de janeiro. Grupos com  boias, jangadas, barcos, se equipam com filtro solar, água para hidratação, guarda sóis e sacos para recolherem todo lixo encontrado no caminho. Uma ação espontânea com caráter de preservação ambiental.
			Localização: Rio Mogi-Guaçu, Cachoeira de Emas Pirassununga, SP. <br><br>
		
		Turismo Religioso:
			Pirassununga e Tambaú fazem uma dobradinha neste quesito. Os turistas chegam em excursões para “pagar promessa” em Tambaú através da fé no Padre Donizetti e após se deslocam para Cachoeira de Emas, almoçar e desfrutar da beleza natural e lojinhas de compras de artesanato e diversos.
			Localização: Rio Mogi-Guaçu, Cachoeira de Emas Pirassununga, SP. <br><br>

		Procissões Fluviais: 
			Em virtude do caráter religioso na cidade ser muito forte, temos um calendário de diversas manifestações culturais religiosas em Cachoeira de Emas, nas margens do rio Mogi-Guaçu. São procissões nos dias de Yemanjá, Nossa Senhora. As datas estão logo abaixo no calendário de eventos.
			Localização: Rio Mogi-Guaçu, Cachoeira de Emas Pirassununga, SP. 

		</p>
		
		</article></div>
			
		<div id="templos" class="menu-content">
			<article style="background-color: beige;">
				<h2 class="text-title">Templos Religiosos</h2>
					<hr class="hr-title2">
						<p class="history">
							<br>

		Santuário Bom Jesus dos Aflitos:
			Igreja inaugurada em 4 de outubro de 1904, com belíssima arquitetura com pinturas em seu átrio de artistas italianos e rica arte sacra.
			Localização: Rua Siqueira Campos, 1539 centro
			Tel: (19) matriz 3561-2435 / casa paroquial 3561-2277 / secretaria 3561-2267
		
		Paróquia Santa Rita de Cássia
			Av. Santos Dumont, 194 – Jardim Santa Rita
			Tel: (19) 3562-1611

		Igreja da Assumpção:
			O largo onde estão a Igreja da Assunção e a Rodoviária, foi o local da primeira missa na cidade, em uma capela ali existente. A data da fundação da atual igreja é 6 de agosto de 1953, sendo a antiga matriz demolida nos anos 1950/1951. Localização: Avenida Padre Antônio Van Ess, nº – Centro

		Paróquia São Francisco de Assis
			Rua: R Trevisan, 245 – Tel: (19) 3562-8533

		Paróquia Santo Antonio:
			Arquitetura belíssima e pinturas diferenciadas.
			Largo Santo Antonio s/no. Centr0 – Tel: (19) 3561-3481

		Igreja São Judas Tadeu
			Rua: Antonio Souza Mourão, s/n.
			Tel: (19) 3562-2341 <br><br>

		Igreja Presbiteriana Pirassununga
			Rua: A I Silva, 1143
			Tel: (19) 3561-4170 <br><br>

		Igreja Evangelho Quadrangular I
			Rua: S Gravena, 1034 – Tel: (19) 3561-5663 <br><br>

		Igreja Evangélica Brasileira
			Rua: D. Pedro II, 1658 – Centro. <br><br>

		Igreja Evangélica Assembleia Deus
			Av: Prudente de Moraes, 2005 – Tel: (19) 3562-3960 <br><br>

		Congregação Cristã do Brasil
			Rua: 13 de Maio, 2771 Centro – S/Tel. <br><br>

		Igreja Batista Primeira
			Rua: Pereira Bueno, 304 – Tel: (19) 3561-1466 <br><br>

		Igreja Metodista
			Rua: Sete de Setembro, 574 Centro – Tel: (19) 3561-3479 <br><br>

		Ministério Cristo Vive
			Rua: XV de Novembro, 1141 – Tel: (19) 3563-2342 <br><br>

		Grupo Espirita Irmão Gabriel
			Rua: Martiniano dos Santos, 1544 – Cidade Jardim – Tel: (19) <br><br>

		Grupo Socorrista de Ricardo
			Av. Painguás, 897 – Tel: (19) <br><br>

		Sociedade Espirita Joana de Angelis
			Rua: Joaquim Custódio, 466 – Tel: (19) <br><br>

		Templo de Umbanda Caboclo Tupinambá Vovô João de Angola
			Rua: Duque de Caxias, 137 Centro - Tel: (19)3561-3495 <br><br>

		Educandário Maria de Magdala
			Avenida Duque de Caxias Norte, 1521 Clayton Malaman.
			contato@educmm.com.br  www.educmm.com.br <br><br>

		Centro Espirita Obreiros do Bem
			Rua: Sebastião Silveira Franco, 3157 Vila Paulista – s/tel. <br><br>

		Centro Espirita Missionários da Luz
			Rua: Sete de Setembro, 682 Centro – s/tel. <br><br>

		Santuário de Umbanda Nossa Senhora da Guia
			R: Mauro Boizan, 264 Jardim dos Ipês – Tel: (19) 9.9717-7358 <br><br>

		Grupo Espirita Joanna de Ângelis
			R: Jonas Batista de Castro, 5392 – Jd Morumbi s/tel. <br><br>

		AFA – Academia da Força Aérea:
			Também conhecida como “Ninho das Águias Brasileiras”, é um estabelecimento de ensino superior para a formação de oficiais da Aeronáutica dos quadros de intendência, infantaria e aviador.
			Estrada de Aguai, km 39 Pirassununga, SP
			Visitações mediante agendamento: Telefone (19) 3565-7000 / 3565-7217 comunicação social. <br><br>
		
		FAYS – Fazenda da Aeronáutica:
			Subordinada diretamente ao comando da Academia da Força Aérea, possui 3600 hectares, dos quais 3.108 hectares de áreas produtivas (1430 hectares de culturas anuais e perenes, 217 hectares para exploração animal e 1461 hectares arrendados para soja e cana-de-açúcar, possui usina de beneficiamento e industrialização de leite e de beneficiamento de arroz e de café: abastece a AFA (tanto civil como militar) com arroz, feijão, café, açúcar, pão, leite e derivados, carnes bovina, suína e de frango, verduras, legumes e frutas, participando ativamente da economia agropastoril da região.
			A exuberância de sua riqueza natural pode ser comprovada coma existência de uma área de pedreira, e uma mata preservada com um exemplar de jequitibá rosa, que atesta 1600 anos sendo testemunha de todo o desenvolvimento pelo qual passou umas das mais importantes regiões produtivas de nosso país, no qual estamos inseridos.
			Rodovia Euberto Nemésio Pereira de Godoy, km 7 Cachoeira de Emas.
			Visitação mediante agendamento: (19) 3565-7404. <br><br>

		EDA – Esquadrão de Demonstrações Aéreas:
			Vulgarmente conhecida como Esquadrilha da Fumaça, seu comando situa-se em Brasília e sua sede em Pirassununga devido as condições climáticas excelentes de voo que esta localização oferece, proporcionando o maior número de dias para voos ideais – “céu de Brigadeiro”. A Esquadrilha da Fumaça é um comando da AFA que tem por missão resgatar e disseminar o sentimento de patriotismo no Brasil, através de suas incríveis apresentações aéreas com manobras únicas registradas no guinners book. Oferece loja de lembrancinhas, sala histórica para visitação, palestra e vídeo institucional.
			Estrada de Aguai, km 39 Pirassununga, SP.
			Visitação de segunda a sexta-feira das 8 h às 17 h com agendamento prévio (19) 3565-7236 / 3565-7491 / 3565-7497 <br><br>
		
		2o. RCC / 13o. RCMec:

			Antigo 2º Regimento de Carros de Combate e o 11º Esquadrão de Cavalaria Mecanizado. O primeiro instalou-se definitivamente no município em janeiro de 1973, vindo de Valença, RJ, sendo uma das principais peças de manobras da 11ª Brigada de Infantaria Blindada, sediada em Campinas, SP, em razão de seu poder de fogo, ação de choque e ampla possibilidade de comunicação; equipado originalmente com carros de combate M 41, de fabricação americana, recebeu em janeiro de 1998 os primeiros carros de combate Leopard 1A1.
			O 11º Esquadrão de Cavalaria Mecanizado, que estivera na cidade em 1919, integrante do 2º Regimento de Cavalaria Divisionário, retornou em julho de 1995. 
			Atualmente, onde estavam baseados até 2005 o 2º Regimento de Carros de Combate, equipado com carros Leopard 1A1 e o 11º Esquadrão de Cavalaria Mecanizado, com equipamento similar ao da unidade atual, no nível esquadrão, da junção de ambos, nasceu o 13º Regimento de Cavalaria Mecanizado, tendo os Leopard 1A1 de sua dotação sido transferidos para unidades no sul do País. 
			O 13º RCMec é uma unidade hoje voltada para operações de Garantia da Lei e da Ordem (GLO), e tem o seu 4º Esquadrão de Fuzileiros Mecanizado operando no Haiti, na Missão de Paz da ONU. Utiliza os seguintes carros: a Viatura Blindada de Transporte de Pessoal (sobre rodas) EE-11 Urutu e a Viatura Blindada de Reconhecimento e Combate EE-9-Cascavel.
			Localização: Avenida Newton Prado, 2.251, Centro.
			Visitação aberta a pequenos grupos, excursões mediante agendamento: (19) 3561-3777 <br><br>
		
		CEPTA/ICMBio:
			Órgão do Instituto Nacional do Meio Ambiente e dos Recursos Naturais e Recicláveis, produz e difunde conhecimentos científicos, tecnológicos, socioeconômicos e ambientais para o ordenamento do uso sustentável dos ecossistemas aquáticos continentais, dedica-se a pesquisa multidisciplinares e promove a captação de pessoal mediante cursos de atualização e aperfeiçoamento nas áreas de Psicultura, aquicultura e educação ambiental.
			Localização: Rodovia Euberto Nemésio Pereira de Godoy, km 6,5 Cachoeira de Emas.
			Visitas mediante agendamento: (19) 3565-1260 <br><br>
		
		USP:
			Fazenda modelo com 2300 hectares, sedia a Faculdade de Zootecnia e Engenharia de Alimentos e Biossistemas, Zootecnia e Veterinária da Universidade de São Paulo. A prefeitura do Campus, o maior da USP, administra as atividades agropecuárias, que atendem aos objetivos de ensino, pesquisa e extensão. Mantem um programa de prestação de serviços à comunidade, com visitas periódicas a propriedades rurais por grupos de alunos e docentes, um laboratório de bromatologia, uma estação meteorológica, um laboratório para análises de fertilidade dos solos e hospital veterinário.
			Localização: Rua Duque de Caxias Norte.
			Visitas mediante agendamento: 3565-4000 / 3565-4243 / 3565-4008 <br><br>
		
		Turismo de Intercâmbio:
			Em virtude de sediar diversos órgãos governamentais oficiais de estudo existe um fluxo de intercambio de alunos e docentes grandes na cidade.
			(USP, AFA, Exército, CEPTA/ICMBio, EDA, FAYS, etc). <br><br>

		Comercio e feiras:
			A cidade se destaca na indústria de bebidas e cachaças, joias, dentes, açúcar e álcool, produtos do mel, artesanato. Estes comércios dão destaque para as feiras livres da cidade. <br><br>
								
		</p>						
		
		</article></div>

		<div id="cultura" class="menu-content">
			<article style="background-color: beige;">
				<h2 class="text-title">Cultura Local</h2>
					<hr class="hr-title2">
						<p class="history">
							<br>

		Cacilda Becker:
			Diva do teatro nacional, nascida em Pirassununga. Em sua homenagem temos o Teatro Municipal Cacilda Becker, Conservatório de Musica Cacilda Becker e o Festival Nacional de Teatro Cacilda Becker.
			Informações: Israel Foguel Diretor do Teatro Municipal (19) 3562-5257. <br><br>

		Corporação Musical Pirassunuguense:
			Há 121 anos trazendo música de qualidade a população pirassununguense. Participa das atividades festivas da municipalidade com apresentações memoráveis. Agrada o grande público porque seus maestros procuram diversificar os estilos musicais tocados e esmeram na qualidade da execução musical. É composta por músicos e maestros profissionais, e através de lei municipal considerada de utilidade pública. Seus ensaios acontecem em sua sede na Av Padre Antonio Van Ess, 773 centro. E todos os domingos realiza retretas musicais no coreto da praça Conselheiro Antônio Prado às 19h30 centro. <br><br>
		
		Teatro Municipal Cacilda Becker:
			É uma das melhores casas de espetáculos do interior paulista, na opinião de artistas que ali se apresentaram. Seu nome é uma homenagem à famosa atriz nascida em Pirassununga e que foi expoente no teatro das décadas de quarenta a sessenta. 
			Localização: Rua Siqueira Campos, 1.290, Centro.
			Visitação mediante agendamento telefone (19) 3562-5657. <br><br>
			
		Centro de Convenções Prof. Fausto Victorelli:
			Localização: Avenida Painguás, 2.014, Jardim do Lago, telefone (19) 3563-0530 - 657 lugares. <br><br>

		Centro Cultural de Eventos Dona Belila:
			Abrange a antiga estação da FEPASA, e o Memorial da Cultura Caipira.
			Av. Juca Costa s/no. Centro.
			Aberto a visitação (área externa). <br><br>

		IEP:
			Tombada pelo patrimônio histórico e cultural, foi inaugurada em 1911, como Escola Normal, passando, posteriormente, a Instituto de Educação. 	Quando de sua criação, em dezembro de 1910, havia estabelecimentos de ensino iguais apenas em Itapetininga, Guaratinguetá, Campinas e Piracicaba.
			Localização: Rua José Bonifácio, 325, Centro.
			Visitação mediante agendamento (19) 3561-9148. <br><br>
		
		Cidade da Criança:
			Reúne dois espaços: área de cultura e lazer, com parque infantil, praças do avião e das árvores, pergulados, casa na árvore e minicastelo, e área de educação, onde se desenvolvem atividades educacionais de ciências, telecomunicações, trânsito, preservação ambiental, etc.
			Localização: Rua Siqueira Campos, 2.000, Centro. <br><br>
		
		Pesque Pagues:
			São opções para um dia de lazer, principalmente aos sábados, domingos e feriados. Os pesque pagues oferecem um descanso junto à natureza, onde se pode realizar uma pescaria nos lagos desfrutando da natureza e destaque ao canto dos pássaros. Também são servidos porções variadas e um bom almoço. <br><br>

		Pesque Pague Campo Alto
			Estrada Pirassununga- Aguaí, entrada Bairro Rural Campo Alto, sinalizado.
			www.pesquepaguecampoalto.com.br
			Tel: (19) 9.9645-8780 / 9.9705-8863 <br><br>

		Pesque Pague Marangoni
			Estrada Rural São Domingos entrada a direita sinalizada.
			Tel: (19) 9.9612-2174 / 3561-2933 <br><br>

		Pesque Pague São Cristóvão
			Rodovia Euberto Nemésio Pereira de Godoy, entrada Engenho Batistela 1.600 m da pista. 
			Tel:(19) 9.9751-1448 <br><br>

		Cachoeiras:
			São cachoeiras naturais em propriedades privadas. <br><br>

		Cachoeira do Mafra:
			Estrada Pirassunuga-Analandia, entrada à esquerda após Rancho do Carmo, descida e plantação de bambu, segue reto, vira direita, após ranchos entrada plantação de bambu a esquerda. <br><br>
		
		Cachoeira do Monte Sião
			Estrada Pirassunuga-Analandia, entrada na caixa d’agua a direita. <br><br>
		
		Cachoeira do Bicho
			Estrada São Domingos, entrada à esquerda passa fazenda Bela Aliança, entrada da cachoeira a direita. <br><br>
		
		Praça Conselheiro Antonio Prado
			Situada no coração da cidade, com mais de 10.000 m2 ajardinados, a Praça Antônio Conselheiro Prado é composta por coreto, bancos e intensa arborização. É palco de eventos públicos e das tradicionais retretas da Corporação Musical de Pirassununga.
			Localização: Rua Duque de Caxias, esquina com Rua José Bonifácio – Centro. <br><br>
		
		Parque Municipal Temístocles Marrocos Leite – Lago Municipal:
			Completo centro de lazer e recreação, dispõe de lago com aves aquáticas, queda d?água, pedalinhos, quadras poliesportivas, parque infantil, praça do idoso e espaço para caminhadas. Aberto de quarta a domingo. Às terças aberto apenas para prática da pesca por aposentados inscritos no projeto Pescaria no Lago. Aos domingos, acontecem apresentações musicais no período da tarde.
			Localização: Avenida Painguás, s/nº, Jardim do Lago, telefone (19) 3561-1521 <br><br>

		</p>

		</article></div>

		<div id="calendario" class="menu-content">
		<article style="background-color: beige;">
			<h2 class="text-title">Calendário de Eventos</h2>
				<hr class="hr-title2">
					<p class="history">
						<br>

		Pirassununga possui eventos e manifestações culturais, de caráter local, estadual e nacional. Dentre os diversos eventos, seguem os consolidados e que se destacam pela singularidade, identidade e potencial turístico: <br><br>

		Café com Chorinho / Feira livre – Todos os domingos do ano
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-1207
			Descrição: Encontro musical dançante, com espaço de restaurante cedido para as entidades filantrópicas da cidade, é um entretenimento de caráter familiar das manhãs e tardes de domingo. Paralelamente a feira livre tradicional acontece e coroa com a participação de grande público.
			Localização: Rua Duque de Caxias, nº 2259 centro – antiga estação da Fepasa, no Centro Cultural de Eventos Dona Belila. <br><br>
		
		Feira do Produtor Rural Pirassununguense – Todas as quartas-feiras do ano
			Realização: Prefeitura Municipal de Pirassununga e Sindicato Rural, (19) 3562-1207
			Descrição: Feira onde os produtores rurais vendem seus produtos naturais de suas propriedades. Hortaliças, legumes, frutas, produtos artesanais etc. Acontece todas as quartas-feiras das 17h às 21h
			Localização: Rua Duque de Caxias, nº 2259 centro – antiga estação da Fepasa, no Centro Cultural de Eventos Dona Belila. <br><br>

		Carnaval – Fevereiro
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-1207
			Descrição: composto pela abertura com Grupos de Melhor Idade, Blocos Carnavalescos e Escolas de Samba. Dentre os blocos, o tradicional Bloco dos Sujos reúne aproximadamente 2.000 pessoas em uma noite. O também tradicional Bloco Pinto do Meio-Dia abre oficialmente o Carnaval, com marchinhas, no coreto da Praça Conselheiro Antônio Prado.
			Localização: Diversas conforme programação. <br><br>

		Festival de Teatro Cacilda Becker – Abril
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-5657
			Descrição: festival competitivo de âmbito nacional com curadoria, reunindo cerca de 40 atividades, entre espetáculos e workshops, os quais acontecem em vários locais do município. O festival é uma homenagem à atriz pirassununguense Cacilda Becker.
			Localização: Teatro Municipal Cacilda Becker, Rua Siqueira Campos, 1290 centro. <br><br>

		Dia do Trabalhador – Maio
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-1207
			Descrição: tradicional festa realizada no Lago Municipal, com música de cantores conhecidos na mídia nacional, barracas de ambulantes. Entretenimento familiar com entrada franca.
			Localização: Parque Municipal Temístocles Marrocos Leite, Lago Municipal – Av. Painguás s/no. Jardim do Lago. <br><br>

		Procissão de São Cristóvão – Julho
			Realização: Paróquia do Senhor Bom Jesus dos Aflitos, (19) 3561-2267
			Descrição: carreata que percorre várias ruas da cidade. Participam carros, motos, caminhonetes e caminhões, totalizando aproximadamente 1.000 veículos.
			Localização: Rua General Osório, 290 centro. <br><br>

		Semana Nenete de Música Caipira – Julho
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-1207
			Descrição: Um dos principais eventos de celebração da cultura caipira do país. Reúne mais de 25 restaurantes de comida típica, atrações musicais do gênero e apresentações da cultura tradicional. Traz também o Festival de Viola, com divulgação nacional. Em quatro dias de atividade, atrai mais de 80.000 pessoas.
			Localização: Rua Duque de Caxias, nº 2259 centro – antiga estação da Fepasa, no Centro Cultural de Eventos Dona Belila. <br><br>
			
		
		Megajogo Paintball
			Realização: Fazenda dos Ingleses, (19) 3563-7186 / 3566-7462
			Descrição: competição nacional de paintball, reúne em torno de 200 jogadores na maior arena do país. Www.paintballevento.com.br
			Localização: Conforme programação. <br><br>

		Aniversárioda Cidade – Agosto
			Realização: Prefeitura Municipal de Pirassununga, (19) 3565-8000
			Descrição: Comemoração ao aniversário do município, shows musicais.
			Localização: Conforme programação. <br><br>

		Exposição Nacional de Orquídeas – Agosto
			Realização: Clube dos Orquidófilos de Pirassununga, (19) 3561-3254
			Descrição: exposição competitiva, com a participação de aproximadamente 25 associações, atraindo mais de 10.000 pessoas
			Localização: Conforme programação. <br><br>
		
		Domingo Aéreo – Outubro
			Realização: Academia da Força Aérea, (19) 3565-7000 / 3565-7217
			Descrição: consiste em atividades de demonstração aérea, exposições e praça de alimentação, abrindo-se os portões da AFA para visitantes de todo o país. Atrai mais de 90.000 pessoas em apenas um dia de atividade.
			Localização: AFA, estrada de Aguaí s/no. Campo Fontenelli, Pirassununga. <br><br>
		
		Dia da Criança – 12 Outubro
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-1207
			Descrição: tradicional festa realizada no Lago Municipal, com música, brinquedos infláveis, trenzinho, pedalinhos, balas e doce, algodão doce, pipoca; tudo para o melhor entretenimento familiar com entrada franca.
			Localização: Parque Municipal Temístocles Marrocos Leite, Lago Municipal – Av. Painguás s/no. Jardim do Lago. <br><br>

		Dia de Nossa Senhora Aparecida – 12 Outubro
			Realização: Paróquia Nossa Senhora Conceição Aparecida, (19) 3561-2862
			Descrição: Comemoração ao dia de Nossa Senhora com atividades na Igreja.
			Localização: Conforme programação. <br><br>

		Semana Thatú Pereira de Música – Novembro
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-5657
			Descrição: Em comemoração ao dia do músico e em homenagem a este músico autodidata pirassununguense, temos uma semana completa de apresentações e atividades pertinentes a música. São orquestras, bandas, grupos, corais da cidade, região e outros de caráter nacional. Entrada franca.
			Localização: Diversos conforme programação. <br><br>
		
		Desfile Cívico de 7 de Setembro, Independência do Brasil
			Realização: Prefeitura Municipal de Pirassununga, (19) 3565-8000
			Descrição: Desfile cívico onde todas as autarquias federais, estaduais e municipais desfilam.
			Localização: Avenida do quartel, centro. <br><br>

		Festa da Piracema – Dezembro
			Realização: Prefeitura Municipal de Pirassununga, (19) 3562-1207
			Descrição: evento musical que acontece no domingo mais próximo ao dia 8 de dezembro, quando se comemora o Dia da Piracema, feriado municipal. O evento é realizado em Cachoeira de Emas, e atrai mais de 8.000 pessoas.
			Localização: Cachoeira de Emas. <br><br>
		
		Procissão Fluvial – Dia da Imaculada Conceição – 8 de Dezembro
			Realização: Associação de Canoeiros de Porto Ferreira
			Descrição: evento intermunicipal, no qual canoeiros da cidade vizinha transporta pelo Rio Mogi Guaçu, a imagem de Nossa Senhora da Imaculada Conceição, até o Distrito de Cachoeira de Emas, onde devotos e turistas aguardam para a celebração de Missa Campal, defronte à Capela Histórica do Distrito.
			Localização: Cachoeira de Emas.

		</p>

		</article></div>
	
	</div>

	<script>

		document.addEventListener("DOMContentLoaded", function() {
			const menuLinks = document.querySelectorAll(".menu-link");

			menuLinks.forEach(link => {
				link.addEventListener("click", function(event) {
					event.preventDefault();

					// Ocultar todos os conteúdos das seções
					const allContents = document.querySelectorAll(".menu-content");
					allContents.forEach(content => {
						content.style.display = "none";
					});

					// Exibir o conteúdo da seção alvo
					const targetId = link.getAttribute("data-target");
					const targetContent = document.getElementById(targetId);
					targetContent.style.display = "block";
				});
			});
		});

	</script>
</body>
</html>
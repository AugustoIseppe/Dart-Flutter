<!DOCTYPE html>
<html lang="en">
<head>
    <title>A Cidade</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        
        * {
            box-sizing: border-box;
            transition: all 0.4s ease;
        }

        body {
            height: 100vh;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: white;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            background-attachment: fixed;
        }

        /* Estilos para a barra de navegação lateral (menu) */
        
        .sidenav {
            position: absolute;
            margin-top: 6rem;
            height: 100%;
            width: 130px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: -9%;
            background-color: transparent; /* cor antiga #992c4b */
            overflow-x: hidden;
        }

        .sidenav:hover {
            left: 0;
        }

        /* Estilos para os links da barra de navegação lateral */

        .sidenav a {
            color: #992c4b;
            padding: 10px;
            font-size: 16px;
            font-weight: bolder;
            text-decoration: none;
            display: block;
        }
        .dark .sidenav a{
            color: #AAA;
        }

        /* Mudar cor ao passar o mouse */
        .sidenav a:hover {
            color: #FFF; 
        }

        /* Estilos para o conteúdo principal */
        .content {
            position: absolute;
            margin-left: 13.5px;
        }

        /* Estilos para os conteúdos das seções */
        .menu-content {
            display: none;
        }

        /* Exibir o conteúdo da seção "A Cidade" quando não houver hash na URL */
        .menu-content#a-cidade {
            display: block;
        }

        /* Exibir o conteúdo das seções quando seus links correspondentes forem clicados */
        .menu-content:target {
            display: block;
        }

        .text-title{
                text-align: center;
                margin-bottom: 10px;
                font-size: 30px;
                font-weight: bold;
                font-family: Courgette, "serif";
                color: rgb(0, 0, 0, 0.75);
        }

        .hr-title2{   
                border-width: 2px;  
                margin-left: 5%;
                width:90%;
                height:0.5px;
        }

        .hr-title{
            height:1px;
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
            background-image: url(https://media.istockphoto.com/id/133998209/photo/old-paper.jpg?s=612x612&w=0&k=20&c=FQtWJD0PsvWu5dR23ceTfGex4PhPQWblTwyOx3w4yXw=);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            background-attachment: fixed;
            border-radius: 6px;
        }
            
        /* Antigo <p> */
        .history{ 
            margin-left:10px;
            margin-right: 10px;
            text-align: justify;
            font-family: sans-serif;
            font-style: italic;
            font-size: 15.5px;
            line-height: 1.8;
            color: rgb(0, 0, 0, 0.85);
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

        #title-servicos {
            font-size: 32px;
            font-family: 'Courgette', cursive;
            font-weight: bold;
            filter: blur(0.55px);
            line-height: 1.5;
        }

    </style>
</head>

<body>
    <?php include 'menu.php' ?>
  
    <div class="sidenav">
        <ul class="sidenav-bar">
            <li><a href="#" class="menu-link" data-target="a-cidade">A Cidade</a></li>
            <li><a href="#" class="menu-link" data-target="os-simbolos">Os Símbolos</a></li>
            <li><a href="#" class="menu-link" data-target="dados-cidade">Dados da Cidade</a></li>
            <li><a href="#" class="menu-link" data-target="o-turismo">O Turismo</a></li>
            <li><a href="#" class="menu-link" data-target="cachoeiras">Cachoeiras</a></li>
            <li><a href="#" class="menu-link" data-target="monumentos">Monumentos</a></li>
        </ul>
    </div>

    <!-- Outros links do menu -->
    <br><br><br><br><br>
    <div class="content">
        <div id="a-cidade" class="menu-content" id="default-content">
        <article>
        <!-- A CIDADE -->
    <h2 class="text-title">A CIDADE</h2>
    <p class="history">
        <br>
        Fundação: 06 de agosto de 1823 (200 anos)<br>	
        As terras onde hoje se situa o município eram habitadas por índios de língua tupi que denominavam o atual distrito de Cachoeira de Emas como Pirasununga, que significa “peixes barulhentos” ou “barulho dos peixes”, através da junção dos termos pirá (“peixe”) e sunung (“fazer barulho”). O nome é uma referência ao fenômeno da piracema: todos os anos, em dezembro, os peixes (principalmente curimbatás) sobem o Rio Mojiguaçu para a desova e, no esforço para nadar contra a correnteza, emitem sons semelhantes ao de roncos.</p><br>
        <figure class="l left"><img src="http://www.estacoesferroviarias.com.br/p/fotos/pirassununga9061.jpg" height="190" width="250" alt="daisy photographed from below">
        </figure>
    
    <p class="history">Lema: Cultura et progressus – Cultura e progresso
        Gentílico: Pirassununguense
        <br>
        Localização:
        <br>
        Coordenadas: 21º59’46” S 47º25’33” 0
        <br>
        País: Brasil
        <br>
        Unidade federativa: São Paulo
        <br>
        Região metropolitana: Piracicaba
        <br>
        Municípios limítrofes: Porto Ferreira, Descalvado, Santa Cruz das Palmeiras, Analândia, Mogi Guaçu, Aguaí, Leme e Santa Cruz da Conceição.
        Distância da capital: 208 km.
        <br>
        Características geográficas:
        <br>
        Área territorial: 727,118 km2. (2022)
        <br>
        População total (Censo IBGE 2022): 73.545 habitantes (2022)
        <br>
        Densidade demográfica: 101,15 hab/km2. (2022)
        <br>
        Clima: tropical de altitude (Cwa)
        <br>
        Altitude: 627 metros.
        <br>
        Fuso horário: Hora de Brasília (UTC-3)
        </p>
    </article>
        </div>
        <!-- SIMBOLOS -->
        <div id="os-simbolos" class="menu-content">
    <article>
    <h2 class="text-title">OS SÍMBOLOS DA CIDADE DE PIRASSUNUNGA:
    Hino, Brasão e Bandeira
    </h2><br>
    

        <figure class="r right"><img src="https://upload.wikimedia.org/wikipedia/commons/0/0a/Pirassununga_Bandeira.gif" alt="mossy log with ferns growing out of it" width="80%">
        </figure>
        <p class="history">
            O texto sobre o significado das cores e do símbolo da Bandeira foi publicado em agosto de 1973, na edição especial da Revista Pirassununga 73”, alusiva ao “Sesquicentenário de Pirassununga”.
            É uma bandeira bonita, com faixas vermelhas, branca e preta, lembrando toda a sua história, com figura de um peixe, a lembrar do seu nome de “lugar onde o peixe ronca”, ladeado de dois ramos: um de cafeeiro e o outro de cana-de-açúcar, símbolo do trabalho humano dos fundadores.
            Geologicamente, o “branco” significa o arenito decomposto, que é parte do solo arenoso do “campo de cerrado” de Pirassununga, que constitui cerca de ½ da área do município. O vermelho significa a terra vermelha, presente em muitos lugares, resultado da decomposição do basalto superficial, que forma uma boa parte só solo agrícola do município, quase 2/3 da área municipal. O “preto” significa o basalto, rocha que está no subsolo profundo de todo o município, que aflora em vários pontos, sobretudo na região de Cachoeira de Emas, onde forma a topava, entre a ponte velha e a barragem. Todo o leito do rio Mogi Guaçu tem como base a rocha basáltica.<br>
            Baseado na cerâmica pintada Tupi-guarani encontrada no município, o significado dentro da herança Tupi-guarani é a seguinte:
            O “branco”, encontrado na ornamentação da cerâmica, como fundo e quase constante, significa singeleza; o “vermelho”, cor fundamental para o Tupi-Guarani, sempre encontrado na cerâmica em desenhos geométricos e estilizados, traduzindo vitória e alegria: o “preto”, cor aliada ao vermelho, geralmente encontrado em desenhos geométricos e estilizados, traduzindo tristeza.<br>
            Dentro da herança após a Fundação, o “branco” revela a pureza e a fé de todos os seres humanos que aqui vieram e se fundiram, que trabalharam a terra, que formaram as fazendas e os sítios e edificaram a cidade tendo como lema “Cultura e Progresso”; o “vermelho” revela a luta dos pioneiros e das gerações que tombaram neste e por este município e que deixaram marcas de trabalho, de alegria e de exemplo para o futuro; e o “preto” revela os momentos de dor de todos aqueles que aqui vieram e lutaram; que anonimamente edificaram o município e a cidade, e que deverão de alguma forma, para sempre, receber a lembrança e a homagem de Pirassununga.
            Pirassununga, na língua tupi-guarani, significa “lugar onde o peixe ronca” e foi o primeiro nome da localidade de Cachoeira de Emas. Depois, por adoção, o então Bairro fundado recebeu a denominação de Senhor Bom Jesus dos Aflitos de Pirassununga, nome dado pelos fundadores Ignácio Pereira Bueno e sua esposa Anna Francisca da Silva.<br>
            O peixe deu nome a esta cidade. Pirassununga é conhecida como a “terra do peixe” e o pirassununguense é conhecido pela alcunha de “curimbatá”, o peixe mais abundante do rio Mogi Guaçu.<br>
            Como centro da nossa bandeira cabe a figura do curimbatá, símbolo máximo de Pirassununga.
            Na agricultura, Pirassununga teve na cana-de-açúcar e no café suas primeiras culturas. A cana começou a ser cultivada a partir do ano de 1809, quando para esta região fixou-se nas imediações do “campo cerrado” de Emas, vindo de Bragança (atual Bragança Paulista), Christovam Pereira de Godoy, fundador do bairro dos Christovam.<br>
            O café passou a ser cultivado a partir de 1830/1835, quando para cá vieram às famílias Souza Mourão (fundadora da Fazenda “Água Parada”), Policarpo Carlos Cardoso (fundadora do Bairro do “Potreiro”), Ararytaguaba (fundadora da Fazenda “Combate”), Antonio Pereira de Godoy (fundadora do Bairro do “Retiro do Campo Alto”), entre outros.<br>
            Pirassununga é a famosa terra da boa aguardente, conhecida em todo o Brasil. Assim, ao lado do peixe se justificam – e bem – a presença da cana-de-açúcar e do café, também, lembrando-nos tais símbolos, a fauna e a flora que deram e dá riqueza a Pirassununga e foi uma das bases do sustentáculo da vida do município.
    </p>

    <p class="history">Hino:
        O hino de Pirassununga foi escrito no ano de 1927 tendo letra do professor Elias de Mello Ayres e música de Antenor Godoy.
        </p>
        <p class="history" style="text-align:center;">I<br>
        Terra de meus amores<br>
        Região de sonhos e de alegria<br>
        Em cujo solo esplendem flores,<br>
        Em cujo céu reina a poesia.<br>
        II<br>
        Pelos teus campos<br>
        Loureja a messe<br>
        Um sol de paz tudo ilumina.<br>
        Um sino tange de suave prece,<br>
        E com vigor ressoa o malho da oficina.<br>
        III<br>
        De tua escola<br>
        Templo sagrado,<br>
        Partem arautos da instrução,<br>
        De teu quartel marcha o soldado<br>
        Para defesa do auriverde pavilhão.<br>
        Coro<br>
        Pirassununga, Áureo recanto brasileiro.<br>
        Chovam-te do azul<br>
        As graças d’ouro<br>
        Do Cruzeiro.<br>
        </p>
        </p>
    </article>
        </div>
        <!-- DADOS DA CIDADE -->
        <div id="dados-cidade" class="menu-content">
        <article>
    <h2 class="text-title">DADOS DA CIDADE:</h2>
            <br>
    <p class="history">Geografia
        O Morro do Limoeiro é o ponto mais elevado, com 759 m; está a 191 km em linha reta e 207 km pela SP-330 – Rodovia Anhanguera da Capital, seu relevo é colinoso e sua paisagem é botânica: representações da Mata Atlântica em solos de melhor qualidade e cerrado em solos pobres; numerosas áreas de preservação ambiental.
    </p>
        <figure class="l left"><img src="https://knowledge.carolina.com/wp-content/uploads/2021/08/graph_3068300.jpg" height="190" width="250" alt="daisy photographed from below">
        </figure>
    
        <p class="history">Hidrografia: Rio Itupeva, Rio Mogi Guaçu e Rio do Roque.<br>
        Rodovias:
        SP-330 – Rodovia Anhanguera; SP-225 – Rodovia Deputado Ciro Albuquerque (Aguaí a Pirassununga); SP-225 – Rodovia Deputado Rogê Ferreira (Pirassununga a Itirapina); SP-201 – Rodovia Prefeito Euberto Nemésio Pereira de Godoy; SP-328 – Sul: Santa Cruz da Conceição (Bairro Paraíso) a Pirassununga (Rua Siqueira Campos); E SP-328 – Norte: Pirassununga (Av. Duque de Caxias Norte) a Porto Ferreira (Av. Rudolf Streit).
    </p>
        
        <p class="history">
        Clima:
        O clima de Pirassununga é considerado subtropical úmido (Cwa de acordo com a classificação climática de Koppen-Geiger). A temperatura média anual é de 22 °C. O verão é quente, com precipitação, e o inverno é fresco, com pouca precipitação. Ao longo do ano, normalmente, a temperatura mínima nos meses mais frios é de 10 °C e a temperatura máxima nos meses mais quentes é de 30 °C e raramente são inferiores a 5 °C ou superiores a 35 °C.
        As precipitações estão concentradas nos meses entre outubro e março, onde também há maior aumento da temperatura e humidade do ar. Nesse período elas podem vir na forma de chuva, acompanhadas de descargas elétricas atmosféricas, fortes rajadas de vento e, as vezes, de granizo.
        Entre os meses de abril e setembro configura-se um cenário de pouca precipitação, ocasionado por sistemas meteorológicos que inibem a formação e entrada significativa de umidade. Nesse período do ano são comuns dias com grande amplitude térmica e ar muito seco. Geadas ocorrem ocasionalmente.
        Em 20 de julho de 2021, durante a incursão de uma intensa massa de ar polar sobre o Brasil, Pirassununga registrou – 3 °C. A cidade registrou a marca de 39 °C mais que uma vez, sendo que seu primeiro registro foi no dia 15 de outubro de 2008. Outras datas em que a temperatura máxima atingiu esse digito foram: 26 de outubro de 2008, 18 de outubro de 2014, 20 de outubro de 2015, e 28 e 30 de setembro de 2020.
    </p>
    <p class="history">
                Infraestrutura:
                    Na cidade, encontram-se sediados os seguintes órgãos e instituições: a Academia da Força Aérea, onde são formados oficiais dos quadros de infantaria, intendência e aviação, todos de carreira e futuros oficiais da Força Aérea Brasileira; a Universidade, com a Faculdade de Zootecnia e Engenharia de Alimentos; o Forte Anhanguera, que abriga o 13º Regimento de Cavalaria Mecanizado do Exército Brasileiro; o Centro Nacional de Pesquisa e Conservação de Peixes Continentais, ligado ao Instituto Chico Mendes de Conservação da Biodiversidade; uma Unidade de Pesquisa e Desenvolvimento (o antigo Laboratório de Peixes Fluviais Doutor Pedro de Azevedo), do Pólo Centro-Leste da Agência Paulista de Tecnologia dos Agronegócios da Secretaria de Agricultura e Abastecimento de São Paulo; o Distrito de Cachoeira de Emas, importante recanto turístico do Nordeste Paulista, onde existem restaurantes especializados na culinária com peixe, atraindo milhares de turistas aos finais de semana e feriados e a Residência de Conservação do Departamento de Estradas de Rodagem do Estado de São Paulo.
                    </p>
                    <p class="history">
                    Ensino:
                    A infraestrutura da municipalidade, em constante aprimoramento, procura atender a demanda de vagas nos segmentos creches, educação infantil, ensinos médio e fundamental, música e dança. Para tanto, a Rede Municipal de Ensino reúne mais de 20 unidades, 4.548 alunos e 177 professores. A rede estadual soma aproximadamente onze mil alunos e a particular mais de cinco mil.
                    No ensino superior, a cidade possui uma universidade pública, um polo de uma universidade pública de ensino a distância, uma universidade particular, duas faculdades particulares e a Academia da Força Aérea, oferecendo um total de dezoito cursos superiores. São elas: Academia da Força Aérea (Brasil), Universidade de São Paulo (FZEA), Universidade Virtual do Estado de São Paulo (UNIVESP), Centro Universitário Anhanguera Educacional, Faculdade de Tecnologia, Ciências e Educação (FATECE), e Faculdade de Engenharia de Agrimensura de Pirassununga (FEAP).
                    No ensino a distância, a cidade conta com polos de várias universidades, tais como a Faculdade Interativa COC, a Universidade Paulista – Polo Pirassununga, entre outras.
                    A cidade ainda conta com uma unidade do Centro Estadual de Educação Tecnológica Paula Souza, a Escola Técnica Ten. AV Gustavo Klug oferece cursos técnicos gratuitos para a população nas áreas de gestão, saúde, informática e eletrônica.
                    </p>
                    <p class="history">
                    Saneamento básico:
                    Instituído pela Lei Número 1.153, de 14 de março de 1973, como autarquia municipal com autonomia financeira e administrativa, o Serviço de Água e Esgoto de Pirassununga (SAEP) conferiu, ao longo dos anos, nova e eficiente dinâmica ao abastecimento de água e ao tratamento do esgoto sanitário.
                    Em termos de abastecimento de água, àquela época havia apenas um ponto de captação e uma estação de tratamento, localizados no Ribeirão Descaroçador e três reservatórios para armazenamento e distribuição, com capacidade total para de 2.800.000 litros. O crescimento do consumo e a pequena produção de água tratada determinavam frequentes racionamentos e faltas do líquido, evidenciando a necessidade, entre outros aspectos, do emprego de hidrômetros para coibir o abuso e o desperdício; assim, de imediato, mais de 6.000 foram instalados em residências e prédios, objetivando o fornecimento racional.
                    Com o desenvolvimento da cidade e o consequente aumento da população, estruturou-se, em área adjacente ao aeroclube, a Estação de Tratamento de Água II, implantou-se a Estação de Tratamento de Água Chica Costa, na zona rural e efetivou-se reforma na Estação de Tratamento de Água I, o que contribuiu, de maneira marcante, para melhor eficiência no processamento da água para consumo. A instalação da estação de captação e tratamento da Vila Santa Fé, no Distrito de Cachoeira de Emas e da Estação de Tratamento de Água III, também próxima ao aeroclube, vieram reforçar o abastecimento.
                    Hoje, há três captações de água: no Ribeirão Descaroçador, na Chica Costa (mina e dois poços artesianos) e na vila Santa Fé (Córrego da Barra). Das cinco estações de tratamento de água, quatro abastecem em 100% o Distrito sede; a na Vila Santa Fé fornece água para todo o Distrito de Cachoeira de Emas. São dezenove os reservatórios, para o total de 11.000.000 de litros. A significativa capacidade de captação, tratamento, reservação e distribuição asseguram adequado abastecimento em qualquer época do ano – mesmo nas mais prolongadas estiagens, sem a imposição de medidas de racionamento, pois a constante ampliação e modernização dos serviços, que caminham à frente da demanda, viabilizam rápidos acréscimos, se necessário. A Autarquia conta com duas estações de tratamento de lodo (que se forma nos filtros e decantadores), uma em Pirassununga e outra no Distrito de Cachoeira de Emas.
                    Quanto ao esgoto sanitário, a primeira estação de tratamento encontra-se na Vila Santa Fé e trata todo o esgoto produzido nesta vila e 95% do produzido pelo Distrito de Cachoeira de Emas. Para o Distrito sede, existe a Estação Ambiental de Tratamento de Esgoto, localizada no bairro Laranja Azeda. Essa estação de tratamento de esgoto trata de 100% do esgoto do município, antes de seu lançamento no rio Ribeirão do Ouro. Existe, ainda, uma Estação de Tratamento de Lodo, ao lado da SP-225, junto do Complexo de abastecimento de água.
                    </p>
                    <p class="history">
                    Segurança:
                    Pirassununga possui, atualmente, uma Secretaria Municipal de Segurança Pública, com uma grande interação nos trabalhos das polícias. A Polícia Civil conta com: 1 Delegacia Central, 1 Distrito Policial, 1 Delegacia de Defesa da Mulher e 1 Cadeia Pública. A Polícia Militar conta com: a 3ª Companhia do 36º Batalhão do Interior, uma Base do Policiamento Rodoviário (km 208 da Rodovia Anhanguera) e uma Base, em Cachoeira de Emas, da Polícia Ambiental. Além disso, existe o Terceiro Posto do Corpo de Bombeiros (pertencente a PM) e a Guarda Civil Municipal.
                    </p>
                    <p class="history">
                    Comunicações:
                    Pirassununga possui dois jornais: O Movimento, online www.omovimento.com.br, e o J.C Regional, com 4.000 exemplares aos sábados. São cinco as rádios: Piracema FM, Mundial FM Web, Kerigma FM, Clube FM, Difusora FM e Nativa FM106,1. Há também 9 rádios WEB operando pela Internet.
                    Houve uma emissora de televisão operando na cidade, a Rede 41, no canal físico 41 UHF, virtual digital 41.1 (ex-TV Mix Regional; em 13 de dezembro de 2018, migrou do canal 59 UHF para o canal 41 UHF, e em 10 de abril de 2020, mudou seu nome para Rede 41, passando a operar com o canal virtual 41.1), pertencente ao grupo de comunicação mantida pela Fundação Cultural Padre Luiz Bartholomeu.
                    Na telefonia fixa a cidade era atendida pela Telecomunicações de São Paulo (TELESP), que construiu a central telefônica utilizada até os dias atuais. Em 1998 esta empresa foi privatizada e vendida para a Telefônica, sendo que em 2012 a empresa adotou a marca Vivo para suas operações.
                    </p>
                    <p class="history">
                    Transportes:
                    Aéreo
                    Aeródromo Campo do Fontenelle, pertencente à Academia da Força Aérea e atende às missões militares desta Organização Militar – Código: SBYS.
                    Aeroporto de Pirassununga “Antonio Carlos Fávaro”: (Pista: 860 m x 30 m – Código: SDPY), destinado à atividade de aeronaves privadas, bem como onde se realiza a formação dos pilotos civis e atividades aerodesportivas, por meio do Aeroclube de Pirassununga. Fazenda Boa Vista, Aeródromo Privado (Pista: 790 m x 18 m – Código: SSMV).
                    Rodoviário
                    Terminal Rodoviário Intermunicipal, em operação 24 horas.
                    Terminal Urbano “Carlos Brüner”, onde é feita a integração entre as linhas de ônibus coletivos, operadas pela “Viação Pirassununga”.
                    Ferroviário
                    A cidade também já foi atendida por transporte ferroviário, onde era cortada pelo Ramal de Descalvado da Companhia Paulista de Estradas de Ferro. A antiga estação ferroviária, inaugurada em 1878 (sua atual edificação foi inaugurada em 1911) era o principal ponto de ligação da cidade com os demais municípios do Centro-Leste do estado, com cidades como Campinas e Jundiaí e com a capital paulista, São Paulo. Foi desativada em 1977, quando circulou o último trem de passageiros do ramal, já sob o comando da antiga FEPASA.
                    Os trilhos foram retirados da cidade no ano de 1997.
                No bairro de Laranja Azeda, havia um entroncamento ferroviário entre o Ramal de Descalvado e o Ramal de Santa Veridiana, também pertencente à Companhia Paulista de Estradas de Ferro, onde este último ligava Pirassununga à cidade de Santa Cruz das Palmeiras e possuía um importante papel no período do ciclo do café paulista.
                    Com a decadência da cafeicultura na região, o ramal foi perdendo sua importância e teve parte de seus trechos finais desativados e extintos pela Paulista no final dos anos 1960. Como consequência da redução populacional das localidades margeadas pelo ramal, os trens de passageiros e de cargas deste também perderiam espaço até serem desativados em 1976, já sob a administração da FEPASA.
                    Os trilhos do trecho restante do ramal foram retirados no início dos anos 1980, sobrando atualmente as antigas estações ferroviárias (algumas convertidas em moradias) e a antiga ponte de ferro no distrito de Cachoeira de Emas (hoje um ponto turístico).
                    </p>
                    <p class="history">
                    Desenvolvimento urbano:
                    Regido por Plano Diretor e por leis geradas por exigência deste mesmo plano, projetos de governo, tecnicamente elaborados, têm sido aplicados pelas administrações que se sucedem, assegurando adequada continuidade aos programas priorizados pela demanda social.
                    A aplicabilidade dos planejamentos é garantida pelas finanças municipais, permanente e acertadamente equilibradas, também estruturadas e operando segundo normas gerenciais modernas Em decorrência, a cidade apresenta níveis eficientes de serviços públicos raramente observada, como, por exemplo, índices totais quanto a abastecimento de água tratada, coleta de esgotos, iluminação pública e coleta de lixo (residencial, industrial e hospitalar).
                    A elevada quantidade de praças e jardins oferece ampla disponibilidade de área verde por habitante, superior a 52 metros quadrados. Numerosas quadras poliesportivas localizadas nos bairros proporcionam à população a possibilidade de atividades esportivas e recreativas, atuando, ao mesmo tempo, como importante elemento para tirar crianças e adolescentes das ruas.
                    O sistema viário, amplamente sinalizado, tanto horizontal como verticalmente, favorece adequado fluxo do trânsito para os mais variados locais da cidade.
                    A iluminação pública estende-se por todo o perímetro urbano.
                    </p>
                    <p class="history">
                    Nível cultural:
                    Diferentemente dos grandes centros urbanos, onde os desníveis de ordem econômica e social são mais acentuados, gerando significativos grupos de população nos extremos, que não se comunicam, com o consequente surgimento do mesmo fenômeno na área da cultura, Pirassununga situa-se razoavelmente bem.
                    Comunidade em que pessoas de todos os níveis sociais e econômicos se comunicam, o município tende a não apresentar, neste particular, extremos de maior significado.
                    Se a falta de oferta de manifestações culturais de maior porte pode gerar patamares menos elevados no topo da coluna, de outra parte a interação dos indivíduos de uma forma mais global tende a elevar o nível dos que estariam na parte inferior do extrato.
                    Por exemplo, é reduzido o número de analfabetos. O pequeno fluxo de migrantes de mais baixo nível socioeconômico, não pode ser associado a este fator, pois um baixo nível socioeconômico não denota automaticamente baixa formação, mas sim por uma base nativa de boa educação, a despeito do baixo fluxo migratório engessar um maior intercâmbio de pensamentos e tendências vindas de outras regiões do país de sua parte, tornando a cidade ainda de âmbito provinciano.
                    </p>
                    <p class="history">
                    Economia:
                    A principal fonte de arrecadação de impostos é o setor sucroalcooleiro, com destaque para as indústrias de aguardente (Caninha 51, Cachaça 21, além de outros produtores), açúcar líquido e as 04 usinas de açúcar e álcool, as quais: a do Grupo Goiano Vale do Verdão (Usina São Luiz), a Baldin Bioenergia S.A. (Usina Taboão), São Pedro Bioenergia S.A. (Usina Alfa) e a Ferrari Bioenergia (Usina Ferrari), na divisa com o município de Porto Ferreira.
                    A cidade conta com três polos industriais instalados e um em planejamento:<br>
                    Distrito Industrial (em perímetro urbano): situado na entrada da cidade com a Rodovia Anhanguera, na pista sentido capital interior, junto ao acesso do quilômetro 207.<br>
                    Polo Industrial Orlando Poggi: também situado na Rodovia Anhanguera, na pista sentido interior capital, no quilômetro 208, próximo à Base Operacional da Polícia Militar Rodoviária, PMESP.<br>
                    Polo Industrial Guilherme Müller Filho: situado na SP-225, ao lado do Aeródromo Municipal Antonio Carlos Fávaro. Acesso rápido pela Avenida Felipe Boller Júnior ou pela Rua Siqueira Campos. A principal indústria nele instalada é a FVO-Brasília (rações para animais).
                    Em 2018, a cidade possuía 132 indústrias, segundo dados da Fundação Sistema Estadual de Análise de Dados. Além da indústria sucroalcooleira, destacam-se, ainda, as de próteses dentárias e artefatos de joalheria (principal empresa: Brüner).<br><br>
                    O comércio, outra importante renda para a cidade, é compatível com o tamanho e o capital de giro da cidade, sendo movimentado, principalmente, pelos servidores públicos (militares e civis da Força Aérea Brasileira e funcionários do Serviço de Água e Esgoto de Pirassununga, do Centro Nacional de Pesquisa e Conservação de Peixes Continentais, além de professores, funcionários e alunos da Universidade de São Paulo).<br><br>
                    Em 2010, a cidade contava com 673 estabelecimentos comerciais, segundo dados da Fundação Sistema Estadual de Análise de Dados.
                Várias das principais cadeias de varejo do país encontram-se presentes em Pirassununga, tais como: Casas Bahia, Casas Pernambucanas, Magazine Luiza, Droga Raia, Lojas CEM, Lojas Americanas, Supermercado Dia, entre outros.<br><br>
        Além disso, a cidade possui um estabelecimento da Rede Graal, na Rodovia Anhanguera e concessionárias de veículos das marcas General Motors, Volkswagen, Ford, Fiat, Toyota e Honda (motos e carros), além de cadeias de fast-food de renome nacional, tais como McDonald's, Bob's e Burger King.
        Na agricultura, além da cana-de-açúcar, destaca-se também a produção de laranja, bastante expressiva, sendo que a cidade possui, ainda, uma filial da Coopercitrus (Cooperativa de Produtores Rurais). Em 2008, de acordo com o Portal “Cidades@”, do Instituto Brasileiro de Geografia e Estatística, Pirassununga produziu 1.700.000 toneladas de cana-de-açúcar e 310.000 toneladas de laranja.<br><br>
        No que se refere ao turismo e lazer, a cidade possui o Distrito de Cachoeira de Emas. No local o destaque fica por conta da gastronomia, representado pelos vários restaurantes e quiosques especializados na culinária a base de peixe, os quais se constituem como a principal atração para seus visitantes, além do comércio de artesanato e os diversos pesqueiros e ranchos ao longo das margens do rio.<br><br>
        Produto Interno Bruto Municipal: Em 2017, de acordo com dados da Fundação SEADE, Pirassununga obteve um produto interno bruto correspondente a R$2.665,7 milhões. O produto interno bruto municipal é obtido somando-se o valor adicionado (em 2017, de R$ 2.224,11 milhões) aos impostos arrecadados.<br><br>
        A composição do valor adicionado, em 2017, foi de: Agropecuária: R$ 111,41 milhões (5,01%); Indústria: R$ 468,82 milhões (21,08%) e Serviços: R$ 1.643,87 milhões (73,91%), sendo que o produto interno bruto municipal de 2016 foi de R$ 2.489,88 milhões, o crescimento econômico no período 2016-2017 foi de 7,06%.
        Crescimento econômico registrado por setor, no mesmo período: Agropecuária: +23,4%; Indústria: +0,65% e Serviços: +3,6%.<br><br>
        De acordo com o relatório “Tipologia dos Municípios Paulistas Baseadas no Produto Interno Bruto Municipal”, da Fundação Sistema Estadual de Análise de Dados, em 2007, Pirassununga encontrava-se entre os 63 municípios paulistas considerados de perfil agropecuário com relevância no estado. Juntos, estes municípios representam 35,3 por cento do valor adicionado da agropecuária estadual.<br><br>
        Exportações municipais: Em 2019, Pirassununga obteve um volume de exportações equivalente a US$ 47.984.023. Queda de 3,11% em relação a 2018.<br>
        No mesmo período, Pirassununga atingiu um volume de importações de US$ 19.874.101, de forma que, em 2019, a cidade obteve um superavit comercial de US$ 28.109.922.<br><br>
        Emprego: Em 31 de dezembro de 2010, Pirassununga possuía um total de 20.341 empregos ocupados. Em 31 de dezembro de 2010, os setores em que os empregos encontravam-se distribuídos, e a remuneração média que ofereciam eram os que seguem: Extrativa mineral – 4 empregos – Remuneração média R$ 1.163,10; Indústria de Transformação – 4.758 empregos – Remuneração média R$ 1.848,98; Serviços Industriais de Utilidade Pública – 271 empregos – Remuneração média R$ 2.359,03; Construção Civil – 247 empregos – Remuneração média R$ 1.243,11; Comércio – 3.817 empregos – Remuneração média R$ 1.194,71; Serviços – 4.017 empregos – Remuneração média R$ 1.557,06; Administração Pública – 4.171 empregos – Remuneração média R$ 2.804,25; e Agropecuária – 3.056 empregos – Remuneração média R$ 1.299,11. A remuneração média dos empregos em Pirassununga, em 31 de dezembro de 2010, era de R$ 1.782,90, para o total das atividades.
        <br><br>
        Investimentos privados: Em 2010, o volume de investimentos realizados pela iniciativa privada em Pirassununga foi de US$ 7,96 milhões, de acordo com o relatório “Pesquisa de Investimentos Anunciados no Estado de São Paulo 2010”, da Fundação Sistema Estadual de Análise de Dados. De acordo com o relatório, foram investidos R$ 2,26 milhões pela CPFL Bioenergia e Baldin Bioenergia, no setor de Eletricidade, Gás e Água Quente, e US$ 5,7 milhões pelo Serviço Social da Indústria – Sesi, no setor de Educação.

        </p>
    </article>
        </div>
        <!-- Turismo -->
    <div id="o-turismo" class="menu-content">
        <article>
            <h2 class="text-title">Turismo</h2>        
                <p class="history">
                <br>
                    Centro Histórico-Cultural: Local onde foi inaugurada a primeira Capela, em 6 de agosto de 1823. Atualmente ali se localiza a Igreja Nossa Senhora Assumpção, totalmente restaurada, e o Terminal Rodoviário. <br><br>
                    Escola Estadual Pirassununga: antiga Escola Normal, fundada em 11 de junho de 1911 <br><br>
                    Santuário Senhor Bom Jesus dos Aflitos: A Paróquia foi criada em 04 de março de 1842 e instalada em 07 de abril de 1849. Em 04 de outubro de 1904 foi inaugurada na parte alta da cidade, sendo elevada a Santúario em 05/02/2017.<br><br>
                    Coreto e bancos da praça central: Atual Praça Conselheiro Antônio Prado, com 136 bancos que contam a história do Comércio local.<br><br>
                    Distrito de Cachoeira de Emas, localizado na SP-201, sendo um lugar de lazer e divertimentos com restaurantes e ainda com destaque para os seguintes locais:
                    Ecomuseu: prédio em reforma que a ARATU Energia disponibilizará para a comunidade local.<br><br>
                    Teatro de Arena Dr. Orlando dos Santos: atualmente desativado;<br><br>
                    Centro Nacional de Pesquisa e Conservação de Peixes Continentais e o Instituto Brasileiro do Meio Ambiente e dos Recursos Naturais Renováveis;<br><br>
                    Ponte Velha: onde a partir de 1891 foram utilizados pela Companhia Paulista de Estradas de ferro;<br><br>
                    Unidade de Pesquisa e Desenvolvimento, do Pólo Centro-Leste da Agência Paulista de Tecnologia dos Agronegócios:	
                    Central Hidroelétrica de Emas (PCHE);
                    Centro Comercial;<br><br>
                    Escola Municipal de Educação Infantil Parque Ecológico<br><br>
                    Teatro Municipal Cacilda Becker: Fundado em 01º de janeiro de 1993, teve sua estreia em 16 de dezembro do mesmo ano. É um dos melhores teatros da região. Após reformas, será reaberto para uso da classe artística e nacional.<br><br>
                    Praça Central Conselheiro Antonio Prado: Nesta praça encontramos um verdadeiro patrimônio histórico-cultural da cidade através de seus bancos (136 no total), bustos (Tenente Coronel Manoel Franco da Silveira e Dr. João Antonio Del Nero), relógio Solar, Praça da Bandeira, coretos, etc.<br><br>
                    Parque Municipal Temístocles Marrocos Leite: mais conhecido por Lago Municipal, abriga um lago, uma ilha, restaurante, concha acústica, parques de diversões, quadras poliesportivas, etc. Para uso da comunidade.<br><br>
                    Anfiteatro da Diretoria Regional de Ensino Professora “Lydia Del Nero”: um amplo auditório com capacidade aproximada de 800 lugares, localizada no antigo prédio anexo da E. E. Pirassununga.<br><br>
                    Academia da Força Aérea: Pirassununga também é chamada de “Ninho das Águias Brasileiras em virtude da AFA que é a escola de formação de cadetes e aviadores do Brasil. A cidade foi escolhida como sede pois, a cidade é a melhor do país em relação a dias com as características ideais para voo. A luminosidade, a velocidade do vento a quantia de umidade no ar são perfeitos e acontecem em maiores números de dias uteis para o a prática do voo.
                    FAYS (Fazenda da Aeronáutica de Pirassununga): A Fazenda da Aeronáutica de Pirassununga é uma Organização Militar (OM), subordinada diretamente à Diretoria de Administração da Aeronáutica (DIRAD). A FAYS conta com uma área de 6.502 hectares, pertencente a Guarnição de Aeronáutica de Pirassununga, no Estado de São Paulo.<br><br>
                    Esquadrão de Demonstração Aérea: O EDA faz parte da AFA porém tem seu comando separado. Conhecida mundialmente como Esquadrilha da Fumaça, possui recordes de acrobacias e por isto esta classificada no Guinners Book por diversas vezes, o que desperta nosso sentimento de patriotismo. Em seu angar visitamos a loja de souvenires que agrada a todos os gostos. Conforme o agendamento pode-se visitar o angar, apreciar os aviões, passando também no museu histórico e recebendo uma pequena palestra.<br><br>
                    13º Regimento de Cavalaria Mecanizado: No ano de 1919, por sábia decisão do Ministério da Guerra e insofismável ação do ilustre prefeito Sr Fernando Costa, o então 2º Regimento de Cavalaria Divisionária, com origens genealógicas ligadas a um Regimento imperial, teve sua construção iniciada em Pirassununga. Atualmente abriga o 13º Regimento de Cavalaria Mecanizado.<br><br>
                    Estátua do Cristo Redentor e uma aeronave estática T-27 Embraer EMB-312 Tucano: localizados no trevo do quilômetro 210 da Rodovia Anhanguera.
                    Auditório da Academia da Força Aérea: localizado dentro da Academia da Força Aérea, este auditório tem uma capacidade de abrigar aproximadamente 1.200 pessoas.<br><br>
                    Conservatório Municipal Cacilda Becker: Criado em 1969, data do falecimento da grande atriz pirassununguense Cacilda Becker, encontra-se localizado no Jardim do Lago ao lado do Centro de Convenções Prof. Dr. Fausto Victorelli.<br><br>
                    Antiga Estação Ferroviária de Pirassununga: Atualmente denominado de Centro de Eventos Dona Belila, a Estação abrigou até o ano de 2005 o Museu Histórico e Pedagógico Dr. Fernando Costa (atualmente desativado).<br><br>
                    Cidade da Criança – Inaugurado em 1995, a Cidade da Criança localiza-se na Praça Fernando Costas (Praça do Avião) e possui um  “Castelinho”, parque, jardim e uma aeronave estática T-6.<br><br>
                    Campus da Universidade de São Paulo: o maior campus da USP, com destaque para o prédio administrativo do local. Forma alunos do curso superior de Veterinária.<br><br>
                    Centro de Educação Física e Esportiva Presidente Médici, um dos maiores do interior paulista, com destaque para o Ginásio Lauro Pozzi e o Estádio Municipal José Maldonado, o qual possui uma pista de atletismo em piso de borracha.<br><br>
                    Centro de Excelência de Ginástica Olímpica Antenor Jacintho de Souza – Sinhô.<br><br>
                    Horto Municipal;<br><br>
                    Nas rotatórias ao longo da Avenida Juca Costa, existem os monumentos da Bíblia, uma aeronave estática T-25 Universal, um carro de combate estático M41 Walker Buldog e uma réplica do  14-Bis.<br><br>
                    Centro de Convenções Prof. Dr Fausto Victorelli: Inaugurado em 2012, com 657 lugares, abriga atualmente os espetáculos artísticos da cidade.<br><br>

                    Roteiro da Cachaça – No Bairro do Roque encontram-se alambiques que fazem parte de um roteiro de visitas a produtores de cachaça de Pirassununga.<br><br>

                    Roteiros turísticos:
                    Roteiro Cachoeira de Emas: Terminal Turístico Cachoeira de Emas, Ecomuseu, Centro Nacional de Pesquisa e Conservação de Peixes Continentais<br><br>
                    Roteiro Religioso:
                    Cachoeira de Emas: município vizinho de Tambaú, Padre Donizetti.<br><br>
                    Roteiro da Cachaça:
                    Cachaça 51, Caninha 21, Cachaça 21, Cachaça Sapucaia, Museu da Cachaça e alambiques familiares<br><br>
                    Roteiro Militar:
                    Academia da Força Aérea, Fazenda da Aeronáutica de Pirassununga, Esquadrilha da Fumaça, 13º Regimento de Cavalaria Mecanizado.<br><br>
                    Roteiro da Cerâmica: Cachoeira de Emas, Porto Ferreira
                    <br><br>
                    Eventos e datas importantes:
                    Semana Nenete (julho) - A Semana Nenete é um dos maiores festivais de cultura caipira do país e é realizada pela Secretaria Municipal da Cultural de Pirassununga. Ela reúne milhares de pessoas que apreciam a cultura caipira. Durante o festival há diversas atrações para resgatar a cultura, gastronomia e música caipira através de barracas, exposições, desfiles e shows. Evento com foco na família. Sua última realização aconteceu no ano de 2019.<br><br>
                    Domingo Aéreo da AFA (agosto) - O maior evento aeronáutico do interior do Estado de São Paulo com exposição dos aviões da Força Aérea Brasileira e demonstração da Esquadrilha da Fumaça;<br><br>
                    Semana Natalina – Diversas atrações na cidade e desfile do Papai Noel;<br><br>
                    Fenacema – Festa da Piracema, no Distrito de Cachoeira de Emas (dezembro). Atualmente desativada.<br><br>
                    Festa Italiana (setembro) - Festa típica da cultura italiana com gastronomia e shows. Atualmente desativada.<br><br>
                    Aniversário do Aeroclube (setembro)<br><br>
                    Encontro Anhanguera de Viaturas Militares Antigas (setembro)<br><br>
                    Exposição de Carros Antigos da USP (setembro)<br><br>
                    Festa municipal de Iemanjá (dezembro)<br><br>
                    Passeio de Boias no Distrito de Cachoeira de Emas (janeiro)<br><br>

                    A CACHAÇA DE PIRASSUNUNGA
                    A cachaça em Pirassununga é famosa, e não por acaso, pois desde a chegada dos imigrantes europeus no Brasil, é fabricada na região. O grande movimento de imigrantes vindos para o Brasil ocorreu por volta de 1820 a 1830.
                    Inicialmente os italianos foram trabalhar no interior de São Paulo, na cultura do café.
                    Logo montaram seus alambiques em Pirassununga e produziram para o consumo próprio. Vendiam eventualmente, mas a fama da cachaça e dos alambiques de Pirassununga logo se alastrou pelo país. Muitas famílias produziam a cachaça e revendiam a comerciantes das cidades vizinhas para a revenda.
                    Dessa forma, surgiram mais de cem marcas de cachaça em Pirassununga por volta de 1920.
                    A cidade possui uma imensidão de marcas, e já era conhecida como “a Terra da Cachaça”.
                    As cachaças eram todas feitas em alambique e os produtores vendiam suas produções a granel par revenda.
                    Com a evolução do mercado, comerciantes mais experientes foram surgindo e por volta de 1960 surge a 51, já com a família Müller. Desde então, Pirassununga passou a ser a conhecida pela 51 e pela cachaça de maior escala, produzida em colunas de destilação, porém, seus alambiques e famílias produtoras permaneceram ativas.
                    Assim Pirassununga ficou sendo o lugar onde é “uma boa ideia”.
                    <br><br>
                    O MUSEU DA CACHAÇA
                    Uma incrível coleção de cachaças (a maior do Brasil), com mais de 3 mil exemplares, também montado um alambique de produção artesanal antigo bem como outras máquinas de época, além de muita história e curiosidades.
                    Degustação e compra de bebidas diversas e guloseimas da Adega Therense.
                    Av. Painguás, 969 centro
                    Telefone: (19) 3561-9144
                    Funcionamento: De segunda a sexta-feira das 8 h às 18 h e de sábado, domingo e feriados das 8 h às 12h30.
                    <br><br>
                    O ROTEIRO DA CACHAÇA
                    Para 12 pessoas com saída na Praça Central, com destino a destilaria, visitando os barris de envelhecimento da cachaça, áreas de produção e moenda, fermentação, envase e palestra sobre licenças necessárias para produção e também sobre os produtos feitos no local. Com degustação e venda de produtos.
                    Após visita ao Museu da Cachaça. E almoço típico conforme a necessidade do grupo.
                    Agendamento telefone: (19) 3561-9144 / 9.9692-1882 / 9.9650-3233.
                    <br><br>
                    ALAMBIQUE SAPUCAIA
                    Instalações da Cachaçaria Sapucaia, que produz uma gama de produtos artesanais como cachaças de alambique, gin, vodka, licores entre outros.
                    Na visita se conhece todas as etapas de produção, com degustação e compra de produtos.
                    Visita com agendamento: (19) 9.9650-3233.
                    www.cachacasapucaia.com.br
                    <br><br>


                    SÍTIO RAMALHO
                    Propriedade de produção tradicional e familiar de cachaça, doces, licores, açúcar mascavo, melado entre diversos produtos.
                    Produtos a venda na feira do produtor agrícola e visita somente para grupos pequenos e mediante prévio agendamento pelo telefone (19) 3562-7379 / 3562-2824 – E-mail: produtos.ramalho@hotmail.com
                     <br><br>
                    CACHOEIRA DE EMAS
                    Ponto de maior expressão turística da cidade, no rio Mogi Guaçu. 	Distante 9 quilometros da cidade, possui restaurantes especializados em pratos a base de peixes e oferece passeios de barco, pescarias, quiosques e centro comercial para compras e praias além de outros.
                    Via de Acesso: Rodovia Euberto Nemésio Pereira de Godoy.
                    <br><br>
                    O PASSEIO DE BARCO
                    Aos fins de semana diversos barqueiros oferecem um passeio ao longo do rio Mogi Guaçu para apreciação da natureza.
                    Localização: Rio Mogi Guaçu, Cachoeira de Emas.
                    <br><br>
                    GASTRONOMIA
                    Estruturada com vários restaurantes 24 horas, quiosques e barracas.
                    A gastronomia local é um destaque onde cada restaurante procura se diferenciar e atender o paladar do turista e visitante.
                    Tem como pratos de maior destaque o rodízio de peixes, e peixadas a la carte.
                    Localização: Cachoeira de Emas, Pirassununga, SP.
                    <br><br>
                    A PIRACEMA
                    É o período de reprodução dos peixes, onde se deslocam até as nascentes dos rios para desovar.
                    Acontece mediante condições ideais na natureza, fatores como a temperatura, velocidade da correnteza e volume de água do rio, são determinantes.
                    Comemorada no dia 8 de dezembro em Pirassununga, ela acontece num período onde a pesca é proibida pelo IBAMA, período de belíssima expressão da natureza apreciar a subida dos cardumes subindo, “roncando” e saltando no rio.
                    Localização: Rio Mogi Guaçu, Cachoeira de Emas Pirassununga, SP
                    <br><br>
                    A HISTÓRIA DE FLAUSINA
                    O ano de 1869 ficou marcado em sua história pelo nascimento de uma menina de nome Flausina Correia, filha de Baldoíno Correia d’Oliveira e de Maria Justina do Rozario, mais conhecida como Eufrosina, que se tornaria um patrimônio imaterial da cultura curimbatá.
                    É a história de vida (..) de vida e de morte da menina Flausina, acometida pela lepra (hanseníase) na época conhecida como “mal de Lázaro”, que vivia isolada numa choupana, deformada pelas feridas que tomavam conta de seu corpo. A doença infectocontagiosa atacava a pele, os olhos e os nervos e excluía os seus portadores do convívio social. A sequência e os desdobramentos dos fatos merecem a atenção de todos nós que amamos esta Terra Curimbatá.
                    Flausina Correa, era filha de Baldoíno Correa d’Oliveira e Maria Justina do Rozario. Nasceu em Pirassununga, no ano de 1869, no bairro Campo Alegre, região de Cachoeira de Emas. Filha de pais leprosos, aos quatro meses foi abandonada num pasto pela mãe.
                    Um casal a adotou, até que a doença nela se manifestasse aos 6 anos de idade. Para protegê-la, o padrinho construiu um rancho à beira da estrada, entre Cachoeira de Emas e Santa Cruz das Palmeiras. Vivia trancada e despida, à espera de água e comida.
                    Quando tudo lhe faltava, alimentava-se de larvas e insetos e dividia sal grosso com o gado num cocho. Para espantar o medo, rezava e cantava hinos religiosos. Flausina tinha dois irmãos leprosos que viviam de esmolas. Aos 12 anos a doença já havia desfigurado a menina.
                    Flausina morreu em 29 de outubro de 1885, aos 16 anos. O pai adotivo, ao encontrá-la morta, estendeu seu corpo sobre um estaleiro e saiu à procura de um de seus irmãos para dar-lhes a notícia.
                    Ao regressarem, o susto: Flausina estava viva e curada da lepra. A notícia da ressurreição atraiu muitas pessoas ao local. Disse que tinha voltado graças a uma “licença divina” de 23 dias de vida que recebeu. Que tinha sido “devolvida” por não ter cumprido sua missão. Havia lhe faltado humildade e tinha vergonha de pedir esmolas. Também explicou que tinha voltado para contar coisas que todos deveriam saber.
                    Sem instrução alguma, a jovem impressionava ao falar de coisas que iam acontecer.
                    Previu, em 1880, as Guerras Mundiais que só aconteceriam em 1914/1918 e 1939/1945. Contou que uma doença eliminaria o gado (Febre aftosa). Adiantou o aparecimento de carros e aviões, ao dizer que as carroças andariam sem animais e que o homem ia voar. As mulheres usariam calças cumpridas e se comportariam como homens. Disse que, instantes após sua morte, quando as pessoas retornassem aos seus lares, ao passarem pelo campo, encontrariam poças de água cheias de peixes vivos, e que deveriam ser levados como alimento para suas casas. Aqueles que testemunharam os fatos contaram a seus filhos, e esses aos netos, que todas as profecias de Flausina haviam se confirmado.
                    Completados os 23 dias da “licença divina”, no dia 20 de novembro de 1885, Flausina morreu na hora marcada, à vista de muitas pessoas.
                    Segundo uma certidão de óbito obtida na seção de arquivos da Cúria Diocesana de São João da Boa Vista, no livro óbito n°03, de 1885 a 1889, folha 10, assentamento n°104, da Paróquia Santa Cruz – cidade Santa Cruz das Palmeiras – encontra-se o seguinte termo:
                    “Aos 20 dias de novembro de 1885, no cimitério desta Matriz de Santa Cruz das Palmeiras, foi sepultada, depois d’encomendada Flausina Correia, de dezesseis anos, filha de Baldoíno Correia d’Oliveira e Maria Justina do Rozario (já finada), faleceu de mal de Lázaro em próprio domicílio, isto no Campo Alegre. – Assinado: vigário Antonio Mainieri.”
                    Os pais adotivos decidiram que Eufrosina (Flausina) seria enterrada em Santa Cruz das Palmeiras, porque o padre de Pirassununga na época (lhe fazia pesadas críticas pelo fato de reunir centenas de fiéis que a procuravam em busca de milagres.
                    Seu corpo foi sepultado em Santa Cruz das Palmeiras. Em seu túmulo, milhares de fiéis ali rezaram, acenderam velas, pediram e alcançaram curas. Com o crescimento da cidade, a área onde ficava o antigo cemitério de Palmeiras teve que ser loteada.
                    A família que comprou o lote onde ficava o jazigo de Flausina preservou o local, que lá está até hoje. Os moradores da região do bairro Campo Alegre contavam que ouviam Eufrosina (Flausina) cantar todas as noites. Como forma de homenageá-la, no ano de 1910, ergueram no local uma orada de taipa que, anos depois, foi substituída por outra de alvenaria.
                    A Igreja Católica, quando ali se instalou, batizou a igrejinha de Capela de Santa Eufrosina, em homenagem a monja que viveu no século V, em Alexandria, cuja imagem está sobre seu altar. A escolha da padroeira do bairro foi inspirada na santidade que as pessoas atribuíam a menina Flausina, que ali viveu e morreu.
                    Muitos milagres foram atribuídos a Flausina. Mesmo com o passar dos anos, o culto piedoso em torno dela se mostra vigoroso.
                    Num túmulo simbólico, construído pela família Furlan em 1969, ao lado da capela, os devotos nunca deixaram de rezar, acender velas e fazer pedidos. Ali encontra-se restaurada a Capela de Santa Eufrosina.
                    <br><br>
                    ANTIGA ESTAÇÃO DE EMAS
                    Unidade geradora de energia elétrica fundada em 1922, pela S.A Central Elétrica Rio Claro – SACERC, com máquinas e equipamentos americanos, na época 1819.
                    Umas das únicas no Brasil feitas de modo ecologicamente correto com escadarias para não limitar os peixes na época da Piracema.
                    Localização: Cachoeira de Emas , Pirassununga SP.
                    <br><br>
                    PESQUEIROS
                    Diversos ranchos e casas de aluguel para recreação e turismo de pesca as margens do rio Mogi Guaçu.
                    Localização: Rio Mogi Guaçu, Cachoeira de Emas Pirassununga, SP
                    <br><br>
                    PASSEIO DE BOIAS
                    Tradicional passeio de boias no rio Mogi Guaçu, entre os trechos de Cachoeira de Emas e Porto Ferreira, totalizando cerca de 17 quilômetros, sempre no último sábado de janeiro.
                    Grupos com boias, jangadas, barcos, se equipam com filtro solar, água para hidratação, guarda sóis e sacos para recolherem todo lixo encontrado no caminho.
                    Uma ação espontânea com caráter de preservação ambiental.
                    Localização: Rio Mogi Guaçu, Cachoeira de Emas Pirassununga, SP.
                    <br><br>
                    TURISMO RELIGIOSO
                    Pirassununga e Tambaú fazem uma dobradinha neste quesito.
                    Os turistas chegam em excursões para “pagar promessa” em Tambaú através da fé no Padre Donizetti e após se deslocam para Cachoeira de Emas, almoçar e desfrutar da beleza natural e lojinhas de compras de artesanato e diversos.
                    Localização: Rio Mogi Guaçu, Cachoeira de Emas Pirassununga, SP.
                    <br><br>
                    PROCISSÕES FLUVIAIS
                    Em virtude do caráter religioso na cidade ser muito forte, temos um calendário de diversas manifestações culturais religiosas em Cachoeira de Emas, nas margens do rio Mogi Guaçu.
                    São procissões nos dias de Yemanjá, Nossa Senhora.
                    As datas estão logo abaixo no calendário de eventos.
                    Localização: Rio Mogi Guaçu, Cachoeira de Emas Pirassununga, SP.
                    <br><br>
                    PEIXE À PASSARINHO
                    Certa manhã, num restaurante de Cachoeira de Emas, quando dois garçons à paisana preparavam o “salão” para mais um dia de atividades, um grupo de turistas se aproximou deles pedindo a “famosa peixada”, que eles tanto tinham ouvido falar em São Paulo, de onde vieram. Os garçons, por sua vez, explicaram que aquele pedido seria impossível naquele momento, porque o restaurante estava fechado e as cozinheiras só chegariam mais tarde, e que estavam ali limpando e organizando o ambiente para o almoço.
                    Como estavam com certa pressa, alguém do grupo sugeriu a eles que servissem algo mais simples, de rápido preparo, pra não saírem dali de “mãos abanando”, com o estômago vazio. Os garçons foram até a cozinha e tudo o que lá encontraram foram alguns pedaços de peixes fritos, sobras da noite anterior. E o que fazer, então, para servir aos clientes?  Para não levar à mesa aqueles peixes frios e “amanhecidos”, resolveram cortá-los em pedaços e envolvê-los novamente na farinha para uma “segunda fritada”. Feito isso, rearranjaram os pedaços no prato e acrescentaram alguns limões cortados ao meio.
                    Quando a porção chegou à mesa, mais do que rápido os turistas avançaram no prato e não faltaram elogios.
                    Surpresos, os garçons/cozinheiros” não podiam acreditar no que viam. Eles gostaram tanto do prato, que pediram outra porção igual àquela. Impossível: a única sobra do dia anterior que havia na cozinha eles tinham acabado de consumir. Não havia mais nada... nem para remédio.
                    Ao agradecerem a atenção e presteza dos garçons, saíram felizes e satisfeitos com a promessa de retornarem à Cachoeira de Emas para saborear a “Peixada que eles tanto ouviam falar em São Paulo, e aqueles pedacinhos de peixes irresistíveis, que acabavam de saborear.
                    <br><br>
                    FERNANDO DE SOUZA COSTA
                    Nascido em São Paulo a 10 de junho de 1886 de uma tradicional família paulistana, Fernando de Souza Costa diplomou-se na Escola Superior de Agricultura “Luís de Queiroz”, em Piracicaba. Em 1908 casou-se, em Piracicaba, com a pirassununguense Anita da Silveira Mello. Logo depois, em 1911 fixou sua residência em Pirassununga, onde modestamente iniciou a sua vida, dirigindo um pequeno estabelecimento industrial.  Mais tarde entrou o jovem agrônomo a emprestar a sua atividade e a sua energia a política de Pirassununga, que obedecia às diretrizes do saudoso Coronel Manoel Franco da Silveira. Em 8 de dezembro de 1912, houve a eleição para completar a vaga deixada pelo falecimento do então prefeito Tenente Cel. Franco, sendo eleito o Dr. Fernando de Souza Costa, o qual ocupou o cargo de Prefeito a partir de 15 de janeiro de 1913. Como prefeito, cargo que exerceu de 1913 até 1927, quando a convite do Presidente do Estado de São Paulo, Júlio Prestes, assumiu a gestão da Secretaria da Agricultura do Estado de São Paulo, foi o Dr. Fernando Costa de uma operosidade que não se discute. Administrador inteligente e hábil, contando apenas com a limitadíssima verba de um município de rendas modestas, conseguiu realizar, no entanto, obras de largo fôlego, transformando Pirassununga, numa cidade de feições modernas, num centro florescente e de ininterrupta atividade. Exerceu diversos cargos públicos inclusive o de Deputado Estadual, de 1918 a 1927, concomitantemente com a administração do município; e em seguida como Secretário da Agricultura no período de 1927 a 1930 continuou a elevar o nome de Pirassununga, mas também muito fez para o nosso Estado. Em 13 de Novembro foi nomeado Ministro da Agricultura dos Estados Unidos do Brasil, realizando feitos de extrema importância para o nosso país. Em 1941 foi nomeado interventor Federal do Estado de São Paulo. Apoiado por Getúlio Vargas seria provável candidato a Presidente da República. Porém, no dia 21 de janeiro de 1946, nas proximidades da cidade de Louveira, ao desviar de um veículo que vinha em sentido contrário e na contramão, chocou-se contra um poste que caiu sobre seu próprio veículo, vitimando-o momentos após o acidente.
                    <br><br>
                    CLEYDE YÁCONIS
                    Do casamento “Alzira Leonor Becker e Edmundo Radamés Yáconis”, realizado no dia 11 de abril de 1920, nasceram três filhas: Cacilda Becker Yáconis, Dirce Becker Yáconis e Cleyde Becker Yáconis. No dia 14 de novembro de 1923, às 12h00, aconteceu na casa da rua Duque de Caxias, número 110, em Pirassununga, o nascimento da menina Cleyde Becker Yáconis. Cacilda entrou para o teatro muito antes de Cleyde, que então era mera espectadora. Cleyde estava num cursinho, onde ia prestar exame em janeiro ou fevereiro de 1950 para medicina, em São Paulo e frequentava o Teatro Brasileiro de Comédias, que tinha como atriz principal Cacilda Becker. Em 1950, Cacilda estava representando “Anjo de Pedra”, de Tenesse Williams, ao lado de Sérgio Cardoso, Nídia Lícia e Maurício Barroso. Nídia adoeceu e precisava de alguém que fizesse seu papel no dia seguinte. Cleyde não pretendia fazer teatro, pois dedicava-se ao cursinho para a Faculdade. Mas, por assistir a muitos ensaios, surpreendeu-se ao ver que havia memorizado o texto. Ela já tinha visto o espetáculo várias vezes. Consultada, respondeu, “Faço o espetáculo amanhã, porque a Nídia ficou doente”. No dia seguinte, deu-se a estreia de Cleyde Yáconis. Cleyde não foi prestar exame na Faculdade de Medicina. Nascia ali uma grande estrela, irmã da não menos famosa Cacilda Becker. Seguindo os caminhos da irmã Cacilda, Cleyde participou de 72 peças teatrais, 90 novelas, 12 filmes e diversas aparições em programas e shows televisivos. Faleceu aos 89 anos, no dia 15 de abril de 2013, de isquemia.
                    <br><br>
                    PEIXE À PASSARINHO
                    Certa manhã, num restaurante de Cachoeira de Emas, quando dois garçons à paisana preparavam o “salão” para mais um dia de atividades, um grupo de turistas se aproximou deles pedindo a “famosa peixada”, que eles tanto tinham ouvido falar em São Paulo, de onde vieram. Os garçons, por sua vez, explicaram que aquele pedido seria impossível naquele momento, porque o restaurante estava fechado e as cozinheiras só chegariam mais tarde, e que estavam ali limpando e organizando o ambiente para o almoço. Como estavam com certa pressa, alguém do grupo sugeriu a eles que servissem algo mais simples, de rápido preparo, pra não saírem dali de “mãos abanando”, com o estômago vazio. Os garçons foram até a cozinha e tudo o que lá encontraram foram alguns pedaços de peixes fritos, sobras da noite anterior. E o que fazer, então, para servir aos clientes?  Para não levar à mesa aqueles peixes frios e “amanhecidos”, resolveram cortá-los em pedaços e envolvê-los novamente na farinha para uma “segunda fritada”. Feito isso, rearranjaram os pedaços no prato e acrescentaram alguns limões cortados ao meio. Quando a porção chegou à mesa, mais do que rápido os turistas avançaram no prato e não faltaram elogios. Surpresos, os garçons/cozinheiros” não podiam acreditar no que viam. Eles gostaram tanto do prato, que pediram outra porção igual àquela. Impossível: a única sobra do dia anterior que havia na cozinha eles tinham acabado de consumir. Não havia mais nada... nem para remédio.  Ao agradecerem a atenção e presteza dos garçons, saíram felizes e satisfeitos com a promessa de retornarem à Cachoeira de Emas para saborear a “Peixada que eles tanto ouviam falar em São Paulo, e aqueles pedacinhos de peixes irresistíveis, que acabavam de saborear.
                    <br><br>
                    “PIRASSUNUNGA: CIDADE SIMPATIA”
                    O título “Cidade Simpatia” surgiu quando da participação de Pirassununga num concurso promovido entre 1951/1955 (não conseguimos identificar a data precisa) pelo Governador Paulista Lucas Nogueira Garcez, que escolheria o jardim público mais bonito do Estado de São Paulo. Na época, Pirassununga tinha um majestoso jardim, que fascinava a todos que aqui chegavam. As árvores da espécie “ficus” (plantadas em 1932) eram caprichosamente aparadas, descrevendo contornos apreciados e elogiados por todos. Convidada a participar, a prefeitura inscreveu Pirassununga no concurso, com grandes chances de conquistar o título estadual. Os moradores da época se recordam do episódio, e afirmam que realmente Pirassununga tinha a praça mais bonita de todas as concorrentes. Entretanto, por razões desconhecidas, a comissão julgadora, para espanto dos participantes, teria dado o título a uma outra cidade. “Que não merecia”, argumentam.
                    Eleito com o apoio do Governador Adhemar Pereira de Barros, Adhemar tentou mandar em Garcez, mas esse logo de início não aceitou e acabaram rompendo. Adhemar ameaçado de prisão pelo sucessor caiu no ostracismo (tanto assim que perderia a eleição de 1954 para Jânio Quadros, por falta de apoio de Garcez). Esta era a razão de Lauro Pozzi não compactuar com esse tipo de iniciativa pela gestão Lucas Nogueira Garcez, pois Lauro Pozzi era correligionário de Adhemar Pereira de Barros. Para minimizar o impacto, antes de divulgar o município vencedor, os organizadores premiaram Pirassununga com o título de Cidade Simpatia, pela realeza e imponência de seu jardim.
                    Um fato relatado pelo saudoso empresário Valdir Trevisan também teve participação no título. Quem comentou o fato com Valdir foi o professor Farid Elmor, então proprietário da Rádio Difusora – ZYI – 3. Na época não havia estação rodoviária na cidade (só surgiria em 1965, na gestão do prefeito Fausto Victorelli). Os ônibus que aqui chegavam faziam ponto no Bar e Lanchonete Simpatia, de propriedade de Chiafi Elmor, que ficava na rua Duque de Caxias (hoje Delicatessen), onde eram também vendidas as passagens. Viajantes e empresários de São Carlos, Ribeirão Preto, Franca e demais localidades por ali passavam. O Bar e Lanchonete Simpatia era referência na cidade. Em virtude da tremenda repercussão que a participação de Pirassununga no “Concurso da Praça mais Bonita” causou à população, Farid Elmor, inspirado no nome daquele estabelecimento, teria lançado em sua emissora o slogan “Cidade Simpatia” a Pirassununga.
                    <br><br>
                    NINHO DAS ÁGUIAS BRASILEIRAS
                    Em 14 de maio de 1952, o Esquadrão de Demonstração Aérea (EDA) realizava a sua primeira demonstração oficial na cidade do Rio de Janeiro. Desde a década de 50 até os dias atuais, diversas foram as transformações que esta unidade da Força Aérea Brasileira sofreu. Da mudança de cidade à escolha de novos vetores que estivessem em consonância com a evolução da aviação, a Esquadrilha tem, hoje, muitos motivos para comemorar. Devido à sua atuação estratégica, a Esquadrilha da Fumaça tem recebido do Comando da Aeronáutica alguns incentivos tanto no âmbito dos recursos humanos quanto físicos. Seus pilotos representam a elite da aviação brasileira. A Esquadrilha da Fumaça está localizada na Força Aérea de Pirassununga transformado a cidade no “Ninho das Águias Brasileiras”. Em Pirassununga todos os dias somos brindados pelos fumaceiros que, ao vento, sobranceiros, lançam o roncar da hélice de seus aviões a girar, sobrevoando o céu azul de anil deste áureo recanto brasileiro
                    </p>
        </div>
        <!-- Outros conteúdos das seções do menu -->
    <!-- Cachoeiras -->
    <div id="cachoeiras" class="menu-content">
        <article>
            <h2 class="text-title">Cachoeiras</h2>
                    <p class="history">
                    <br>
                    CACHOEIRA DO MAFRA
        Estrada Pirassunuga-Analandia, entrada à esquerda após Rancho do Carmo, descida e plantação de bambu, segue reto, vira direita, após ranchos entrada plantação de bambu a esquerda.
    <br><br>
    Cachoeira do Monte Sião
        Estrada Pirassunuga-Analandia, entrada na caixa d'água a direita
        <br><br>
    CACHOEIRA DO BICHO
        Estrada São Domingos, entrada à esquerda passa fazenda Bela Aliança, entrada da cachoeira a direita
        <br><br>
    PRAÇA CONSELHEIRO ANTÔNIO PRADO
        Situada no coração da cidade, com mais de 10.000 m2 ajardinados, a Praça Antônio Conselheiro Prado é composta por coreto, bancos e intensa arborização.
        É palco de eventos públicos e das tradicionais retretas da Corporação Musical de Pirassununga.
        Localização: Rua Duque de Caxias, esquina com Rua José Bonifácio – Centro
        <br><br>
    PARQUE MUNICIPAL TEMÍSTOCLES MARROCOS LEITE – LAGO MUNICIPAL
        Completo centro de lazer e recreação, dispõe de lago com aves aquáticas, queda d’água, pedalinhos, quadras poliesportivas, parque infantil, praça do idoso e espaço para caminhadas. Aberto de quarta a domingo. Às terças aberto apenas para prática da pesca por aposentados inscritos no projeto Pescaria no Lago.
        Aos domingos, acontecem apresentações musicais no período da tarde.
        Localização: Avenida Painguás, s/nº, Jardim do Lago, telefone (19) 3561-1521

            </p>

        </div>
        <div id="monumentos" class="menu-content">
        <article>
            <h2 class="text-title">Monumentos</h2>
                    <p class="history">
                    <br>
                    NINHO DAS ÁGUIAS BRASILEIRAS
        Na entrada principal da cidade - quilômetro 210 da rodovia Anhanguera,
        Temos uma aeronave estática T-27 Embraer EMB-312 Tucano desativado da FAB – Força Aérea Brasileira dando as boas vindas as pessoas e mostrando que a aviação faz parte da vida dos Pirassununguenses.
        A cidade tem “céu de brigadeiro”- o maior aproveitamento de dias no ano para voar devido a características climáticas favoráveis. E portanto a FAB, instalou aqui a escola de aviação nacional.
        Localização: Avenida Padre Antonio Van Ess, s/no. <br><br>

    CRISTO REDENTOR
        A estátua do Cristo Redentor é um referencial de fé, abençoa todas as pessoas que entram e saem da cidade.
        Localização: às margens da Rodovia Anhanguera (SP-330). <br><br>

    RELÓGIO SOLAR
        Projetado e construído em 1984 por Felix Carvajal que através de uma maquete e muitos cálculos descobriu a  posição correta para afixá-lo, já que sua precisão em ver as horas é de acordo com a sombra do movimento do sol.
        Temos uma espécie de régua afixada no alto da plataforma cinza (bem no meio do mostrador), para adequar a medição das horas durante o horário de verão.
        Localização: Praça Central Conselheiro Antonio Prado, Centro  <br><br>

    RÉPLICA 14 BIS
        Homenagem a aviação brasileira e a importância da aeronáutica na cidade temos este monumento.
        Localização: Avenida Juca Costa s/no. Zona Sul. <br><br>

    PRAÇA DA CAVALARIA
        Neste monumento fundado em 2008 temos um carro de combate estático M41-B /da década de 80 desativado, e o busto do Marechal Manoel Luis Osório – exemplo de patriotismo, no dia de seu aniversário é comemorado o dia da Cavalaria.
        Localização: Avenida Juca Costa s/no. Zona Sul <br><br>

    TRIBUTO A AERONÁUTICA
        É uma aeronave estática T-25 Universal, exemplar utilizado pela AFA e desativado.
        Localização: Encontro da avenida Juca Costa  e avenida Santos Dumont, zona Sul. <br><br>

    MONUMENTO DA BÍBLIA
        Tributo a fé da cidade…
        “Bem-aventurados os pacificadores, porque eles serão chamados filhos de Deus”, “Feliz a nação cujo Deus é o Senhor e o povo que o escolheu para sua herança”.
        Localização: Avenida Juca Costa s/no. Zona Sul. <br><br>

    EEP- ESCOLA ESTADUAL PIRASSUNUNGA
    Tombada pelo patrimônio histórico e cultural (Condephath),pela suntuosidade que enternece. Inaugurada em 1911 como escola normal, passando posteriormente a instituto de educação.
    Localização: R. José Bonifácio, 45 – Centro
    PRAÇA CONSELHEIRO ANTONIO PRADO E RETRETAS DOMINGUEIRAS MUSICAIS DA CORPORAÇÃO MUSICAL PIRASSUNUNGU8ENSE
    No coração da cidade, com mais de dez mil metros quadrados ajardinados, possui coreto, bancos e intensa arborização. É palco de eventos públicos onde se destaca as tradicionais retretas. Evento familiar e de grande público em virtude a qualidade profissional de músicos e maestros que compõe a Corporação Musical Pirassununguense que tem 118 anos, e é considerada pela municipalidade de utilidade pública pelo seu caráter sócio-educativo, além do entretenimento cultural de qualidade.
    Localização: Rua Duque de Caxias, s/no. Centro <br><br>
    CEFE PRESIDENTE MÉDICI – CENTRO DE EDUCAÇÃO FÍSICA E ESPORTES PRESIDENTE MÉDICI
    Amplo e completo centro poliesportivo mantido pela municipalidade, seus equipamentos compreendem entre outros, conjunto aquático com três piscinas, ginásio poliesportivo coberto, quadras poliesportivas externas e coberta, quadras de tênis e de vólei de areia, campo de futebol oficial, pista de atletismo e áreas para lançamento de dardo, martelo, etc. Possui sede social com refeitório e alojamento para quatrocentos atletas.
    Localização: Av. Presidente Médice, s/no. Jd Carlos Gomes
    Contato para agendamento: (19) 3561-7379 / 3561-1101 / 3563-2590 <br><br>
    AEROCLUBE MUNICIPAL
    Fundado em 1942, o Aeroclube de Pirassununga é uma escola de pilotagem aeronáutica, tendo por finalidade principal a formação e o treinamento de pilotos civis. Já formou centenas de pilotos, dos quais muitos se tornaram comandantes de grandes companhias aéreas. Obedece ao padrão de instrução determinado pelo Ministério da Aeronáutica, por meio da ANAC, contando com equipamentos e aeronaves diversas. Possui pista com 560mx30m, seis hangares, oficina de manutenção, sala de aula, sede social e dependências administrativas. Além da formação de pilotos, o Aeroclube também realiza voos panorâmicos para os visitantes aos finais de semana
    Localização: Rua Siqueira Campos, 4609 tel: (19) 3561-1480 / 99651-5522 <br><br>
    CIRCUITO CAMINHO DA PAZ
    É um roteiro de peregrinação de 388 km entre Pirassununga e vários municípios da Região Turística Histórias e Vales. Este Roteiro Turístico, pode ser feito a pé, de bike, moto, e nos dias que o turista determinar. No percurso o peregrino conhecerá um pouco da cultura e beleza de cada cidade destacando o contato com a natureza. A partir da escolha do município que será seu ponto de partida, deve passar pelo local de emissão de passaporte, fazer seu cadastro e receber gratuitamente seu passaporte, que será um diário de registro do passeio. Em cada localidade o turista deverá carimbar o passaporte, registrando sua passagem pelo local e colecionando os carimbos pois cada um traz uma imagem alusiva, decorando o passaporte do peregrino com lembranças de sua atividade.
    Maiores informações dos locais de cadastro dos passaportes entre outras: www.circuitocaminhodapaz.com.br, ou (19) 3562-1207

            </p>

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

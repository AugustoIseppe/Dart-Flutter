
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';


class PainelPassageiro extends StatefulWidget {
  const PainelPassageiro({super.key});

  @override
  State<PainelPassageiro> createState() => _PainelPassageiroState();
}

class _PainelPassageiroState extends State<PainelPassageiro> {
  TextEditingController _controllerDestino = TextEditingController();
  //Lista de itens para o PPopupMenuButton
  List<String> itensMenu = ["Configurações", "Deslogar"];

  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition _posicaoCamera = const CameraPosition(
      //-22.005972, -47.436284
      //-21.985207, -47.421291
      target: LatLng(-22.005972, -47.436284),
      zoom: 18);

  //método para exibir marcadores
  Set<Marker> _marcadores = {};

  //Método para deslogar o usuário (dentro do PopupMenuButton)
  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/");
  }

  //Método para escolher o item do menu (PopupMenuButton)
  _escolhaMenuItem(String escolha) {
    switch (escolha) {
      case "Deslogar":
        _deslogarUsuario();
        break;
      case "Configurações":
        break;
    }
  }

  //método para criar o mapa dentro da tela do passageiro
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _adicionarListenerLocalizacao(){
    var locationOptions = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10 );
 
    Geolocator.getPositionStream(locationSettings: locationOptions).listen((Position position) {
      _exibirMarcadorPassageiro(position);
      _posicaoCamera = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 17
      );
      _movimentarCamera(_posicaoCamera);
    });
  }

  _recuperarUltimaLocalizacaoConhecida() async {
    Position? position = await Geolocator.getLastKnownPosition();

    setState(() {
      if (position != null) {
        _exibirMarcadorPassageiro(position);
        _posicaoCamera = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 18);
        _movimentarCamera(_posicaoCamera);
      }
    });
  }

  _movimentarCamera(CameraPosition cameraPosition) async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  //método para exibir os marcadores do passageiro
  _exibirMarcadorPassageiro(Position local) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: pixelRatio),
            "images/passageiro.png")
        .then((BitmapDescriptor icone) {
      Marker marcadorPassageiro = Marker(
          markerId: MarkerId("marcador-passageiro"),
          position: LatLng(local.latitude, local.longitude),
          infoWindow: InfoWindow(title: "Meu local"),
          icon: icone
          );
          setState(() {
            _marcadores.add(marcadorPassageiro);
          });
    });
  }

// _chamarUber() async {
//   String enderecoDestino = _controllerDestino.text;

//   if (enderecoDestino.isNotEmpty) {
//     List<Location> listaEnderecos =
//         await GeocodingPlatform.instance.locationFromAddress(enderecoDestino);

//     if (listaEnderecos != null && listaEnderecos.length > 0) {
//       Location endereco = listaEnderecos[0];

//       double latitude = endereco.latitude;
//       double longitude = endereco.longitude;

//       List<Placemark> placemarks = await GeocodingPlatform.instance.placemarkFromCoordinates(latitude, longitude);

//       if (placemarks != null && placemarks.length > 0) {
//         Placemark placemark = placemarks[0];

//         Destino destino = Destino();
//         destino.cidade = placemark.administrativeArea;
//         destino.cep = placemark.postalCode;
//         destino.bairro = placemark.subLocality;
//         destino.rua = placemark.thoroughfare;
//         destino.numero = placemark.subThoroughfare;

//         String enderecoConfirmacao = "\n Cidade: " + destino.cidade;
//         enderecoConfirmacao += "\n Rua: " + destino.rua + ", " + destino.numero;
//         enderecoConfirmacao += "\n Bairro: " + destino.bairro;
//         enderecoConfirmacao += "\n Cep: " + destino.cep;

//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Confirmação do Endereço'),
//               content: Text(enderecoConfirmacao),
//               contentPadding: EdgeInsets.all(16),
//               actions: [
//                 TextButton(
//                   child: Text(
//                     'Cancelar',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   onPressed: () => Navigator.pop(context),
//                 )
//               ],
//             );
//           },
//         );
//       }
//     }
//   }
// }

  @override
  void initState() {
    super.initState();
    _recuperarUltimaLocalizacaoConhecida();
    _adicionarListenerLocalizacao(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Uber - Passageiro'),
          centerTitle: true,
          backgroundColor: Colors.white10,
          actions: <Widget>[
            PopupMenuButton(
              onSelected: _escolhaMenuItem,
              itemBuilder: (context) {
                return itensMenu.map((String item) {
                  return PopupMenuItem<String>(value: item, child: Text(item));
                }).toList();
              },
            )
          ],
        ),
        body: Container(
          child: Stack(
            // o stack sobrepõem Widgets
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _posicaoCamera,
                onMapCreated: _onMapCreated,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                //marker -> método para exibir os marcadores
                markers: _marcadores,
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(Icons.location_on, color: Colors.green),
                            hintText: 'Meu local',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: -8, top: 4)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _controllerDestino,
                        readOnly: false, //ativar o textField
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(Icons.local_taxi, color: Colors.black),
                            hintText: 'Informe seu destino',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: -8, top: 4)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    //corrigir o bug do IOS
                    padding:EdgeInsets.fromLTRB(20, 10, 20, 25),
                      
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text(
                          'Chamar Uber',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}

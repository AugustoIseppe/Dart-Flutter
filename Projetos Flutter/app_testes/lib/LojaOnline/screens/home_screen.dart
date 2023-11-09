import 'package:app_testes/LojaOnline/tabs/home_tab.dart';
import 'package:app_testes/LojaOnline/tabs/mycart.dart';
import 'package:app_testes/LojaOnline/tabs/product_tab.dart';
import 'package:app_testes/LojaOnline/tabs/stores_tab.dart';
import 'package:app_testes/LojaOnline/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Página Inicial'),
            centerTitle: true,
            backgroundColor: Colors.amber[800],
          ),
          body: HomeTab(), //páfina inicial
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Produtos'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
          ),
          body: const ProductTab(), //ProductTab -> encaminha para área de Produtos
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Nossas Lojas'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
          ),
          body: const StoresTab(),//StoresTab -> encaminha para Lojas
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Meus pedidos'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
          ),
          body: const MeusPedidosTab(),//StoresTab -> encaminha para Lojas
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
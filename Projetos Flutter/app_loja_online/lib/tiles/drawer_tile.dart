import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon; //Cria o icone do DrawerTile
  final String text; //Criar o texto do DrawerTile
  final PageController controller; //Controlador do DrawerTile
  final int page; //Numeração das paginas

  const DrawerTile(this.icon, this.text, this.controller, this.page, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: [
              Icon(icon, size: 32, 
              color: controller.page == page ? Theme.of(context).primaryColor : Colors.grey[700]),
              const SizedBox(width: 32,),
              Text(text, style: TextStyle(fontSize: 16, color: controller.page == page ? Theme.of(context).primaryColor : Colors.grey[700]),)
            ],
          ),
        ),
      ),
    );
  }
}
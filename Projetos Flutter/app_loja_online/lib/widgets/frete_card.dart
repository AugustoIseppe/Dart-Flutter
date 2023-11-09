import 'package:flutter/material.dart';

class FreteCard extends StatelessWidget {
  const FreteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          'Calcular Frete',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.grey[700]),
        ),
        leading: Icon(
          Icons.location_on,
          color: Colors.greenAccent[700],
        ),
        trailing: Icon(
          Icons.add,
          color: Colors.grey[700],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Informe seu CEP'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
